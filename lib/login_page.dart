import 'package:SLAHP/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;
  final submittedUsername = TextEditingController();
  final submittedPassword = TextEditingController();

  String contentForEmptyUsername = 'Username is required!';
  String contentForEmptyPassword = 'Password is required!';
  String contentForEmptyUsernameAndPassword =
      'Username and Password are required!';
  String contentForInvalidUsernameAndOrPassword =
      'Invalid Username And/Or Password';
  FocusNode focusNodeForUsername;
  FocusNode focusNodeForPassword;

  void initState() {
    super.initState();
    focusNodeForUsername = FocusNode();
    focusNodeForPassword = FocusNode();
  }

  @override
  void dispose() {
    focusNodeForUsername.dispose();
    focusNodeForPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: '',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/icon.png'),
      ),
    );

    final username = TextFormField(
      controller: submittedUsername,
      focusNode: focusNodeForUsername,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: submittedPassword,
      focusNode: focusNodeForPassword,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    showAlertDialog(BuildContext context, String contentMessage) {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
          if (isUsernameEmpty == true && isPasswordEmpty == true ||
              isUsernameEmpty == true) {
            focusNodeForUsername.requestFocus();
          } else if (isPasswordEmpty == true) {
            focusNodeForPassword.requestFocus();
          } else if (isUsernameEmpty == false && isPasswordEmpty == false) {
            focusNodeForUsername.requestFocus();
          }
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("ATTENTION"),
        content: Text(contentMessage),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    void clearTextInput() {
      submittedUsername.clear();
      submittedPassword.clear();
    }

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (submittedUsername.text == 'JCM' &&
              submittedPassword.text == 'JCM') {
            isUsernameEmpty = false;
            isPasswordEmpty = false;
            focusNodeForUsername.requestFocus();
            clearTextInput();
            return Navigator.of(context).pushNamed(HomePage.tag);
          } else if (submittedUsername.text == '' &&
              submittedPassword.text == '') {
            isUsernameEmpty = true;
            isPasswordEmpty = true;
            return showAlertDialog(context, contentForEmptyUsernameAndPassword);
          } else if (submittedUsername.text == '') {
            isUsernameEmpty = true;
            return showAlertDialog(context, contentForEmptyUsername);
          } else if (submittedPassword.text == '') {
            isUsernameEmpty = false;
            isPasswordEmpty = true;
            return showAlertDialog(context, contentForEmptyPassword);
          } else {
            isUsernameEmpty = false;
            isPasswordEmpty = false;
            return showAlertDialog(
                context, contentForInvalidUsernameAndOrPassword);
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text('LOGIN', style: TextStyle(color: Colors.white)),
      ),
    );

    final exitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          SystemNavigator.pop();
        },
        padding: EdgeInsets.all(12),
        color: Colors.black,
        child: Text('EXIT', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'FORGOT PASSWORD ?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            exitButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
