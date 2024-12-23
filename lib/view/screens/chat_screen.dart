import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/consts/app_colors.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:herbal/core/consts/gpt_const.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: "Diwa", lastName: "Anja");
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: "Chat", lastName: "GPT");

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white),
        ),
        backgroundColor: AppColors.lightPrimary,
        title: const Text(
          "Ayo Cari Solusinya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: AppColors.lightPrimary,
          containerColor: AppColors.lightCardColor,
        ),
        onSend: (ChatMessage message) {
          getChatResponse(message);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage message) async {
    // Tambahkan pesan pengguna ke daftar dan tampilkan animasi mengetik
    setState(() {
      _messages.insert(0, message);
      _typingUsers.add(_gptChatUser);
    });

    // Siapkan riwayat pesan untuk API
    final List<Map<String, String>> _messagesHistory = _messages.reversed.map((msg) {
      return {
        "role": msg.user.id == _currentUser.id ? "user" : "assistant",
        "content": msg.text ?? "",
      };
    }).toList();

    // Kirim permintaan ke OpenAI
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: _messagesHistory,
      maxToken: 200,
    );

    try {
      final response = await _openAI.onChatCompletion(request: request);

      if (response != null && response.choices.isNotEmpty) {
        for (var choice in response.choices) {
          if (choice.message != null) {
            setState(() {
              _messages.insert(
                0,
                ChatMessage(
                  user: _gptChatUser,
                  createdAt: DateTime.now(),
                  text: choice.message!.content,
                ),
              );
            });
          }
        }
      }
    } catch (e) {
      // Tangani kesalahan
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _gptChatUser,
            createdAt: DateTime.now(),
            text: "Maaf, terjadi kesalahan saat menghubungi OpenAI. Coba lagi nanti.",
          ),
        );
      });
      debugPrint("Error: $e");
    }

    // Hapus animasi mengetik
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}
