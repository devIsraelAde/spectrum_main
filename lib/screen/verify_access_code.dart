import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';

class VerifyAccessCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        margin: EdgeInsets.symmetric(vertical: 150.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 10.0),
            Text(
              'Access Code',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.0),
            Text(
              'Verfied...',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 50.0),
            Container(
              width: MediaQuery.of(context).size.width * .70,
              height: 100.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      size: 40.0,
                      color: Constants.primaryColor,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Well done! Access confirmed',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
