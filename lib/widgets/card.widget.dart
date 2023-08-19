import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.sourceImage,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
    this.alignment,
    this.color,
    this.imageUrl,
    this.isSelected = false,
  });

  final double width;
  final double height;
  final String sourceImage;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;
  final Alignment? alignment;
  final Color? color;
  final String? imageUrl;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color,
          border: Border.all(
            color:  isSelected ? Colors.orange :Colors.transparent,
            width: 3
          ),
          image: imageUrl != null ? DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl!)
          ) : null
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              sourceImage,
              width: 50,
              height: 50,
            ),
            child,
            Visibility(
              visible: isSelected,
              child: const Icon(
                Icons.check_circle,
                color: Colors.orange,
                size: 62,
              ),
            )
          ],
        ),
      ),
    );
  }
}