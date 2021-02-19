import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/app/app.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  MyButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 41.0,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: AppTextStyles.h3style.copyWith(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}
