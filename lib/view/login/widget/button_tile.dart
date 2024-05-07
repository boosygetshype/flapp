import '../../../util/padding/padding_ext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonTile extends StatefulWidget {
  ButtonTile({super.key, required this.imagePath, this.onTap});
  final String imagePath;
  Function()? onTap;

  @override
  State<ButtonTile> createState() => _ButtonTileState();
}

class _ButtonTileState extends State<ButtonTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.011),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          width: context.width * 0.2,
          height: context.height * 0.06,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
