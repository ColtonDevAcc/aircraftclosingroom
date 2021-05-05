import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/models/homeModel.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:aircraftclosingroom/views/mainView.dart';
import 'package:aircraftclosingroom/widgets/buttonWidgetStyle1.dart';
import 'package:aircraftclosingroom/widgets/textFieldWidgetStyle1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    HomeModel homeModel = new HomeModel();
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
                suffixIconData: homeModel.isValid ? Icons.check : null,
                onTextChanged: (value) => homeModel.setEmailInput = value,
              ),
              SizedBox(height: 10),
              //this column contains the password filed and the forgot password link
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: 'Password',
                    obscure: homeModel.obscurePass,
                    prefixIcon: Icons.vpn_key,
                    suffixIconData: homeModel.obscurePass ? Icons.visibility : Icons.visibility_off,
                    onTextChanged: (value) {}, //TODO: ADD AUTH
                    //sets the pass text to obscure or not obscure
                    onSuffixiconTap: () {
                      homeModel.obscurePass ? homeModel.setObscurePass = false : homeModel.setObscurePass = true;
                    },
                  ),
                  SizedBox(height: 10),
                  //forgot password action

                  GestureDetector(
                    onTap: () {
                      print("OOOOOO man i forgot my pass :(");
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Global.primaryColor,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),
              ButtonWidgetStyle1(
                hasBorder: true,
                buttonTitle: "Login",
                onTapFunction: () {
                  _logIn() ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainView())) : print("");
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

bool _logIn() {
  UserInfo user = new UserInfo();
  user.userLogIn(userEmailAddress: 'cbristow@aictitl.com', userPassword: 'C0lt0n.Brist0w99((');
  return false;
}
