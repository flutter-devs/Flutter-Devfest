import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/utils/styles.dart';

class CustomPopUPButton extends StatelessWidget {
  final String title;
  final VoidCallback voidCallback;
  final TextStyle textStyle;
  final double height;
  final double weight;

  const CustomPopUPButton(
      {Key key,
      this.title,
      this.voidCallback,
      this.textStyle = Styles.defaultButtonTextStyle,
      this.height,
      this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Styles.purpleColor,
      ),
      height: height ?? MediaQuery.of(context).size.height / 16,
      width: weight ?? MediaQuery.of(context).size.width / 3,
      child: InkWell(
        onTap: voidCallback,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
