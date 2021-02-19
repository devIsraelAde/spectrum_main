import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_library/screen/home_screen.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/my_button.dart';

class AccessCodeScreen extends StatelessWidget {
  static const routeName = '/access-code';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        margin: EdgeInsets.symmetric(vertical: 40.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
                'Input access code to start reading',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AccessCodeCard(),
                  AccessCodeCard(),
                  AccessCodeCard(),
                  AccessCodeCard(),
                  AccessCodeCard(),
                  AccessCodeCard(),
                ],
              ),
              SizedBox(height: 70.0),
              MyButton(
                label: 'Start Reading',
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccessCodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [Constants.kBoxShadow],
      ),
      width: 36.0,
      height: 32.0,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        cursorColor: Constants.primaryColor,
        textAlign: TextAlign.center,
        style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.bold, fontSize: 17.0),
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
