import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:loading_hud/loading_hud.dart';
import 'package:loading_hud/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/screen/home_screen.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/my_button.dart';

class Registration extends StatefulWidget {
  static const routeName = '/registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with SingleTickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  var _phoneController = new MaskedTextController(mask: '000-0000-0000');
  var _accessCodeController = new MaskedTextController(mask: '@@@@-@@@@-@@@@-@@@@');

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // var _userID = '';

  // bool _isLoading = false;

  // // reference to our single class that manages the database
  // final dbHelper = DatabaseHelper.instance;

  // SharedPreferences locationStorage;

  // var token = '';
  // var userID = '';

  // String _platformImei = '';

  // // Method to get the device IMEI
  // Future<void> _initPlatformState() async {
  //   String platformImei;
  //   try {
  //     platformImei =
  //         await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
  //   } on PlatformException {
  //     platformImei = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _platformImei = platformImei;
  //   });
  //   SharedPreferences locationStorage = await SharedPreferences.getInstance();
  //   locationStorage.setString('imei', platformImei);
  //   print('DEVICE IMEI = $_platformImei');
  // }

  // _testAuthentication() async {
  //   await SharedPreferences.getInstance().then((value) {
  //     token = value.getString('token');
  //     userID = value.getString('user_id');
  //     if (token != '' && userID != '') {
  //       _registerUsersDevice();
  //     }
  //   });
  // }

  // Future<void> _registerUsersDevice() async {
  //   await _initPlatformState();

  //   var data = {
  //     "imei": _platformImei,
  //   };
  //   if (_platformImei.isNotEmpty) {
  //     var res = await ApiServices().registerDevice(data);
  //     if (res.statusCode == 200) {
  //       var body = json.decode(res.body);
  //       locationStorage = await SharedPreferences.getInstance();
  //       locationStorage.setString('token', body['data']['token']);
  //       locationStorage.setString('user_id', body['data']['user_id']);
  //     } else {
  //       print("Can not register user's device");
  //     }
  //   }
  // }

  // void _isRegistered() async {
  //   SharedPreferences locationStorage = await SharedPreferences.getInstance();
  //   locationStorage.setString('status', 'registered');
  //   locationStorage.setString('first_name', _firstNameController.text);
  //   locationStorage.setString('last_name', _lastNameController.text);
  //   locationStorage.setString('phone', _phoneController.text);
  //   locationStorage.setString('access_code', _accessCodeController.text);
  // }

  // void _insert(Map<String, dynamic> row) async {
  //   // row to insert
  //   final id = await dbHelper.insert(row);
  //   print('inserted row id: $id');
  // }

  // _getUserID() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   return localStorage.getString('user_id');
  // }

  // Future<dynamic> _registerUser() async {
  //   _userID = await _getUserID();
  //   print(_userID);

  //   var data = {
  //     "user_id": _userID,
  //     "first_name": _firstNameController.text,
  //     "last_name": _lastNameController.text,
  //     "phone": _phoneController.text,
  //     "access_code": _accessCodeController.text
  //   };

  //   print(data);

  //   var res = await ApiServices().registerUser(data);
  //   return res;
  // }

  ScrollController _scrollController = ScrollController();

  AnimationController _controller;
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    //_testAuthentication();
    super.initState();
    bool animatevalue = false;

    // _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    // _animation = Tween(begin: 1.0, end: MediaQuery.of(context).size.height / 2).animate(_controller);
    // final ScrollController _scrollController = ScrollController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // ..addListener(() {
    //   //   setState(() {});
    //   // });
    // });

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     setState(() {
    //       animatevalue = true;
    //     });
    //     _controller.forward();
    //   } else {
    //     setState(() {
    //       animatevalue = false;
    //     });
    //     _controller.reverse();
    //   }
    // });

    // KeyboardVisibility.onChange.listen((bool visible) {
    //   if (visible) {
    //     // setState(() {
    //     //   animatevalue = true;
    //     // });
    //     _controller.forward();

    //     print(_animation.value);
    //   } else {
    //     // setState(() {
    //     //   animatevalue = false;
    //     // });
    //     _controller.reverse();

    //     print(_animation.value);
    //   }
    //   print('Keyboard visibility update. Is visible: ${visible}');
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ApiServices(dbphelper: Provider.of<DatabaseHelper>(context, listen: false));
  }

  @override
  void dispose() {
    // _controller.dispose();
    _focusNode.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _accessCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).viewInsets.bottom);
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Enter Your Details',
                      style: AppTextStyles.h3style,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'First Name',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'First Name is required!';
                          }
                          return null;
                        },
                        controller: _firstNameController,
                        input: TextInputType.text,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Last Name',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Last Name is required!';
                          }
                          return null;
                        },
                        input: TextInputType.text,
                        controller: _lastNameController,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Email',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Email is required!';
                          } else if (!input.contains('@')) {
                            return 'Email is invalid!';
                          }
                          return null;
                        },
                        input: TextInputType.text,
                        controller: _emailController,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Phone',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Phone Number is required!';
                          }
                          return null;
                        },
                        controller: _phoneController,
                        input: TextInputType.phone,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Access Code',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Access Code is required!';
                          }
                          return null;
                        },
                        controller: _accessCodeController,
                        input: TextInputType.text,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                        child: Builder(
                          builder: (context) => MyButton(
                            label: 'Register',
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                var loadinghud = LoadingHud(
                                  context,
                                  cancelable: false,
                                  canceledOnTouchOutside: false,
                                  dimBackground: true,
                                  hudColor: Color(0x99000000),
                                  indicator: DefaultLoadingIndicator(
                                    color: Colors.white,
                                  ),
                                  iconSuccess: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                  iconError: Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                );
                                loadinghud.show();
                                Provider.of<ApiServices>(context, listen: false).sendDeviceId().then((value) async {
                                  if (value.keys.first == 0) {
                                    Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(value[0], style: AppTextStyles.h3style,
                                          ),
                                          backgroundColor: Colors.red));
                                  } else {
                                    Scaffold.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(SnackBar(
                                          content: Text(
                                            value[1],
                                            style: AppTextStyles.h3style,
                                          ),
                                          backgroundColor: Colors.green));
                                  }
                                  context
                                      .read<ApiServices>()
                                      .createAccount(
                                          firstname: _firstNameController.text,
                                          lastname: _lastNameController.text,
                                          phone: _phoneController.text,
                                          email: _emailController.text,
                                          context: context,
                                          accesscode: _accessCodeController.text.toUpperCase())
                                      .then((value) async {
                                    if (value.keys.first == 1) {
                                      loadinghud.dismiss();
                                      await Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                    } else {
                                      loadinghud.dismiss();
                                      Scaffold.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(SnackBar(
                                          content: Text(
                                            value[0],
                                            style: AppTextStyles.h3style,
                                          ),
                                          backgroundColor: Colors.red,
                                        ));
                                    }
                                  });
                                });

                                // showDialog(
                                //     context: context,
                                //     useRootNavigator: true,
                                //     builder: (context) {
                                //       return WillPopScope(
                                //         onWillPop: () async => false,
                                //         child: Material(
                                //           color: Colors.white.withOpacity(0.8),
                                //           child: CircularProgressIndicator(
                                //             value: 40,
                                //             valueColor: AlwaysStoppedAnimation<Color>(Constants.primaryColor),
                                //           ),
                                //         ),
                                //       );
                                //     });

                              }
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                //       SizedBox(
                //   height: MediaQuery.of(context).viewInsets.bottom,
                // ),
                // SizedBox(height: _animation.value),
                // AnimatedBuilder(
                //   animation: _animation,
                //   builder: (context, widget) {
                //     return AnimatedContainer(
                //       curve: Curves.easeOut,
                //       duration: Duration(
                //         milliseconds: 400,
                //       ),
                //       // width: double.infinity,
                //       padding: EdgeInsets.only(top: _animation.value ?? 0.0),
                //       alignment: Alignment.center,
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final Function validator;
  final TextEditingController controller;
  final TextInputType input;
  final FocusNode focusNode;
  TextFieldWidget({this.hint, this.controller, this.validator, this.input, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Constants.primaryColor),
          hintText: hint,
        ),
        autofocus: false,
        keyboardType: input,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
