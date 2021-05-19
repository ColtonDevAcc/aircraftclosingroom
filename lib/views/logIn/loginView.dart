import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:aircraftclosingroom/views/mainView.dart';
import 'package:aircraftclosingroom/widgets/buttonWidgetStyle1.dart';
import 'package:aircraftclosingroom/widgets/textFieldWidgetStyle1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final emailTextController = new TextEditingController();
    final passwordTextController = new TextEditingController();

    UserInfo _user = UserInfo();

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    Future<bool> _logIn() async {
      await _user.userLogIn(userEmailAddress: emailTextController.text, userPassword: passwordTextController.text);
      if (_user.getCustomerName != 'empty') {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Aic_login_Page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // this sets all the email fields to what ever the user specifys
            children: [
              TextFieldWidget(
                hintText: 'Email',
                obscure: false,
                prefixIcon: Icons.email,
                controller: emailTextController,
                suffixIconData: themeProvider.isValid ? Icons.check : null,
                onTextChanged: (value) {},
              ),
              SizedBox(height: 10),
              //this column contains the password filed and the forgot password link
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: 'Password',
                    obscure: themeProvider.obscurePass,
                    prefixIcon: Icons.vpn_key,
                    suffixIconData: themeProvider.obscurePass ? Icons.visibility : Icons.visibility_off,
                    onTextChanged: (value) {},
                    controller: passwordTextController,
                    onSuffixiconTap: () {
                      themeProvider.obscurePass ? themeProvider.setObscurePass = false : themeProvider.setObscurePass = true;
                      print('pressed');
                    },
                  ),
                  SizedBox(height: 10),
                  //forgot password action

                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: ThemeProvider.primaryColor,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),
              ButtonWidgetStyle1(
                hasBorder: true,
                buttonTitle: "Login",
                userLoggingIn: themeProvider.getIsLoading,
                onTapFunction: () async {
                  themeProvider.setIsLoading(true);
                  bool userlogedin = await _logIn();
                  if (userlogedin == true) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainView()));
                  } else {
                    themeProvider.setIsLoading(false);
                    badLoginDialogBox();
                  }
                },
              ),

              SizedBox(height: 180),
            ],
          ),
        ),
      ),
    );
  }
}

AlertDialog badLoginDialogBox() {
  return AlertDialog(
    title: Text('Your email or password was incorrect'),
    content: Text('Okay :('),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text('okay :('),
      )
    ],
  );
}
