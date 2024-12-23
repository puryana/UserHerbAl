import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/providers/fav_providers.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.ramuanId,
    // this.isInWishlist = false,
  });
  final Color bkgColor;
  final double size;
  final String ramuanId;
  // final bool? isInWishlist;
  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final favoritProvider = Provider.of<FavoritProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          try {
            if (favoritProvider.isProdinFavorites(ramuanId: widget.ramuanId)) {
              await favoritProvider.removeFavoriteItemFromFirestore(
                favoritId: favoritProvider.getFavorites[widget.ramuanId]!.favoritId,
                ramuanId: widget.ramuanId,
              );
            } else {
              await favoritProvider.addToFavoriteFirebase(
                ramuanId: widget.ramuanId,
                context: context,
              );
            }
            await favoritProvider.fetchFavorites();
          } catch (e) {
            print(e);
          } finally {
            setState(() {
              _isLoading = false;
            });
          }
        },
        icon: _isLoading
            ? const CircularProgressIndicator()
            : Icon(
                favoritProvider.isProdinFavorites(ramuanId: widget.ramuanId)
                    ? CupertinoIcons.heart_fill 
                    : CupertinoIcons.heart,
                size: widget.size,
                color: favoritProvider.isProdinFavorites(ramuanId: widget.ramuanId)
                    ? Colors.red
                    : Colors.grey,
              ),
      ),
    );
  }
}
