import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

///custom button for reusing it
class ReusableButton extends StatefulWidget {
  ///constructor for a button with its attribute
  const ReusableButton({
    required this.title,
    required this.topmargin,
    super.key,
    this.buttonColor,
    this.height,
    this.width,
    this.onpressed,
    this.textcolor,
    this.borderradius,
    this.child,
    this.gradientcolor,
    this.textsize,
    this.buttonCenter,
    this.padding,
    this.bottomMargin,
  });

  ///height of a  button
  final double? height;

  ///width of a  button
  final double? width;

  /// border Radius  of a  button
  final double? borderradius;

  ///Title for the button
  final String title;

  ///margin from top of a container
  final double topmargin;

  ///margin from top of a container
  final double? bottomMargin;

  ///color of text in button
  final Color? textcolor;

  /// Button Color
  final Color? buttonColor;

  ///size of text in button
  final double? textsize;

  ///child can be widget rather than only text its optional
  final Widget? child;

  /// gradient color of container
  final List<Color>? gradientcolor;

  /// option1l widget at a center of button
  final Widget? buttonCenter;

  ///onpressed function of a button
  final void Function()? onpressed;

  ///padding
  final EdgeInsetsGeometry? padding;

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: EdgeInsets.only(
        top: widget.topmargin,
        // left: 5,
        // right: 5,
        bottom: widget.bottomMargin ?? 0,
      ),
      width: widget.width,
      height: widget.height ?? 50,
      child: ElevatedButton(
        onPressed: widget.onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonColor ?? whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.textcolor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
