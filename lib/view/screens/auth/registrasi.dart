import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:herbal/core/services/loading_manager.dart';
import 'package:herbal/core/services/validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:herbal/core/providers/my_app_functions.dart';
import 'package:herbal/core/providers/user_provider.dart';
import 'package:herbal/view/screens/auth/login.dart';
import 'package:herbal/view/screens/home_screen.dart';


class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final ValueNotifier<bool> _isObscure;
  late final TextEditingController
      _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController;

  late final FocusNode
      _nameFocusNode,
      _emailFocusNode,
      _passwordFocusNode,
      _confirmPasswordFocusNode;

  final _formkey = GlobalKey<FormState>();
  XFile? _pickedImage;
  bool _isLoading = false;
  final auth = FirebaseAuth.instance;
  String? userImageUrl;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    // Focus Nodes
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _isObscure = ValueNotifier<bool>(true);
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _nameController.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _confirmPasswordController.dispose();
      // Focus Nodes
      _nameFocusNode.dispose();
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      _confirmPasswordFocusNode.dispose();
      _isObscure.dispose();
    }
    super.dispose();
  }

  Future<void> _registerFCT() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Pastikan untuk mengambil gambar",
        fct: () {},
      );
      print("Gambar tidak dipilih");
      return;
    }
    if (!isValid) {
      print("Formulir tidak valid");
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorSnackbar("Password tidak cocok");
      print("Password tidak cocok");
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      print("Membuat pengguna dengan email: ${_emailController.text.trim()}");
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = userCredential.user;
      if (user == null) {
        print("Pengguna null setelah registrasi");
        throw FirebaseAuthException(
          message: "Pengguna null setelah registrasi",
          code: "USER_NULL",
        );
      }

      final String uid = user.uid;

      // Initialize Firebase Storage
      final FirebaseStorage storage = FirebaseStorage.instance;
      final ref = storage.ref().child("usersImages").child("$uid.jpg");
      await ref.putFile(File(_pickedImage!.path));
      userImageUrl = await ref.getDownloadURL();
      print("Gambar diunggah ke: $userImageUrl");

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        'userId': uid,
        'userName': _nameController.text,
        'userImage': userImageUrl,
        'userEmail': _emailController.text.toLowerCase(),
        'createdAt': Timestamp.now(),
        'userFav': [],
        'userHist': [],
      });
      print("Data pengguna disimpan ke Firestore");

      Fluttertoast.showToast(
        msg: "Registrasi berhasil!",
        backgroundColor: Color.fromRGBO(6, 132, 0, 1),
        textColor: Colors.white,
      );
      
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.fetchUserInfo();

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.message.toString(),
        fct: () {},
      );
      print("FirebaseAuthException: ${error.message}");
    } on FirebaseException catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.message.toString(),
        fct: () {},
      );
      print("FirebaseException: ${error.message}");
    } catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.toString(),
        fct: () {},
      );
      print("Exception: $error");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 10),
            Text(message, style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                    clipper: GreenClipper(),
                    child: Container(
                      color: Color.fromRGBO(6, 132, 0, 1),
                      height: 250,
                      alignment: Alignment.topCenter, // Align text to top center
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80), // Move text slightly down
                        child: Text(
                          "Registrasi Akun",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.chevron_left, color: Colors.white),
                      iconSize: 40,
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          localImagePicker();
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffD6D6D6),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: _pickedImage == null
                                    ? Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    : Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: FileImage(File(_pickedImage!.path)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Buatlah akun agar Anda dapat menjelajahi semua fitur yang ada",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_emailFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.displayNamevalidator(value);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.emailValidator(value);
                            },
                          ),
                          SizedBox(height: 20),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isObscure,
                            builder: (context, value, child) {
                              return TextFormField(
                                obscureText: value,
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _isObscure.value = !_isObscure.value;
                                    },
                                    icon: Icon(
                                      value ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (value) async {
                                  FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
                                },
                                validator: (value) {
                                  return MyValidators.passwordValidator(value);
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isObscure,
                            builder: (context, value, child) {
                              return TextFormField(
                                obscureText: value,
                                controller: _confirmPasswordController,
                                focusNode: _confirmPasswordFocusNode,
                                decoration: InputDecoration(
                                  labelText: "Konfirmasi Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _isObscure.value = !_isObscure.value;
                                    },
                                    icon: Icon(
                                      value ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (value) async {
                                  await _registerFCT();
                                },
                                validator: (value) {
                                  return MyValidators.repeatPasswordValidator(
                                    value: value,
                                    password: _passwordController.text,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () async {
                        await _registerFCT();
                      },
                      color: Color.fromRGBO(6, 132, 0, 1),
                      minWidth: double.infinity,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Saya sudah memiliki akun",
                        style: TextStyle(
                          color: Color.fromRGBO(6, 132, 0, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Atau lanjut menggunakan',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 132, 0, 1),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Implementasi sign-in dengan Google
                          },
                          child: Image.asset(
                            'assets/google.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        InkWell(
                          onTap: () {
                            // Implementasi sign-in dengan Facebook
                          },
                          child: Image.asset(
                            'assets/facebook.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}