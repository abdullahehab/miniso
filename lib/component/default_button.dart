import 'package:flutter/material.dart';
import '../helpers/theme.dart';
class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final bool enable;
  final bool borderedButton;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final double? buttonWidth;

  const DefaultButton({
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.enable = true,
    this.borderedButton = false,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    this.buttonWidth,
    super.key,
  }) : icon = null;

  const DefaultButton.icon({
    required this.title,
    required this.icon,
    this.onPressed,
    this.isLoading = false,
    this.enable = true,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.buttonWidth,
    super.key,
  }) : borderedButton = false;

  const DefaultButton.outlined({
    required this.onPressed,
    required this.title,
    super.key,
    this.isLoading = false,
    this.enable = true,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.buttonWidth,
  })  : borderedButton = true,
        icon = null;

  ButtonStyle _buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(buttonWidth ?? double.infinity, 50),
      animationDuration: const Duration(milliseconds: 100),
      padding: padding,
      backgroundColor: borderedButton ? Colors.transparent : AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(62),
      ),
      elevation: 0.0,
      foregroundColor: borderedButton ? AppColors.primary : Colors.white,
      textStyle:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      side: borderedButton
          ? const BorderSide(
        width: 2.0,
        color: AppColors.primary,
      )
          : BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: enable && !isLoading ? onPressed : null,
        style: _buttonStyle(context),
        icon: icon!,
        label: _buildButtonChild(context),
      );
    }
    return ElevatedButton(
      onPressed: enable && !isLoading ? onPressed : null,
      style: _buttonStyle(context),
      child: _buildButtonChild(context),
    );
  }

  Widget _buildButtonChild(BuildContext context) {

    return Text(
      title,
    );
  }
}
