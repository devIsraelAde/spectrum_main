import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spectrum_library/services/services.dart';

class ContactSupportScreen extends StatelessWidget {
  static const routeName = '/contact-support';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Color(0xff054D44),
                    height: 150.0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: HexagonalClipper(reverse: true),
                    child: Container(
                      height: height * .40,
                      decoration: BoxDecoration(
                        color: Color(0xff054D44),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.3, bottom: 20.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Colors.white,
                      scale: 7,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.0),
            Flexible(
              fit: FlexFit.loose,
              child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: 'onlinesupport@spectrumbookslimited.com'));
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          backgroundColor: Constants.primaryColor,
                          content: Text(
                            'Support Email Copied',
                            style: TextStyle(color: Colors.white),
                          )));
                  },

                  child: Info(Icons.mail, 'onlinesupport@spectrumbookslimited.com')),
            ),
            SizedBox(height: 10.0),
            InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: '+2348168775063'));
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        backgroundColor: Constants.primaryColor,
                        content: Text(
                          'Phone Number Copied',
                          style: TextStyle(color: Colors.white),
                        )));
                },
                child: Info(Icons.call, '+234 816 877 5063')),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.facebook,
                          color: Constants.primaryColor,
                          size: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '@spectrumbookslimited',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.instagram,
                          color: Constants.primaryColor,
                          size: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '@spectrumbookslimited',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.twitter,
                          color: Constants.primaryColor,
                          size: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '@spectrumbooksL',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final IconData icon;
  final String title;

  Info(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
/*        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,*/
        children: <Widget>[
          Icon(icon, color: Constants.primaryColor),
          SizedBox(width: 10.0),
          Text(title, style: TextStyle(color: Constants.primaryColor)),
        ],
      ),
    );
  }
}
