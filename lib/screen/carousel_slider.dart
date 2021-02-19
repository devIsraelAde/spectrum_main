import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/screen/registration.dart';
import 'package:spectrum_library/services/services.dart';

class CarouselSlider extends StatelessWidget {
  static const length = 2;
  final pageIndexNotifier = ValueNotifier<int>(0);

  final List images = [
    {
      'image': 'assets/images/carousel1.png',
      'title': 'Keep Track Of Reading Process\nUsing Various Reader Functionalities',
      'check': false
    },
    {
      'image': 'assets/images/carousel2.png',
      'title': 'Create A Virtual Library You Can Access\nAnywhere, Anytime',
      'check': true
    },
    // {'image': '', 'title': 'Create Your Own Notebook', 'check': true},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Stack(
            alignment: FractionalOffset.bottomCenter,
            children: <Widget>[
              PageView.builder(
                onPageChanged: (index) => pageIndexNotifier.value = index,
                itemCount: length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                    child: CarouselCardWithButton(
                      image: images[index]['image'],
                      title: images[index]['title'],
                      check: images[index]['check'],
                    ),
                  );
                },
              ),
              _buildExample1()
            ],
          ),
        ),
      ),
    );
  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.green,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}

class CarouselCardWithButton extends StatelessWidget {
  final String image;
  final String title;
  final bool check;

  CarouselCardWithButton({this.image, this.title, this.check});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
        SizedBox(height: 30.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.h3style.copyWith(fontSize: 13),
        ),
        SizedBox(height: 50.0),
        check
            ? FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedUI()));
                },
                child: Text(
                  'NEXT',
                  style: AppTextStyles.h3style.copyWith(fontSize: 13, color: Constants.primaryColor),
                ),
              )
            : FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedUI()));
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
              ),
      ],
    );
  }
}

class GetStartedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Image.asset(
            'assets/images/carousel3.png',
            width: 250,
            height: 250,
          ),
          SizedBox(height: 30.0),
          Text(
            'Create Your Own Notebook',
            textAlign: TextAlign.center,
            style: TextStyle(color: Constants.primaryColor, fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40.0),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
            },
            child:
                Text('GET STARTED', style: AppTextStyles.h3style.copyWith(fontSize: 13, color: Constants.primaryColor)),
          )
        ],
      ),
    );
  }
}
