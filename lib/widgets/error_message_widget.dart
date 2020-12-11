import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  //
  final String message;
  final Function onTap;
  ErrorMessage({this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
