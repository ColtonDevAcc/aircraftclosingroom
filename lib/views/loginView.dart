import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/models/homeModel.dart';
import 'package:aircraftclosingroom/widgets/buttonWidgetStyle1.dart';
import 'package:aircraftclosingroom/widgets/textFieldWidgetStyle1.dart';
import 'package:aircraftclosingroom/widgets/waveWidget.dart';
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
    final homeModel = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //this controls the color of the animation
            Container(
              height: size.height - 600,
              color: Global.primaryColor,
            ),
            Image.asset('assets/images/AIC_white_swoosh.png'),
            //this controls the movment of the animation when the keyboard is used
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ),

            Padding(
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
                        suffixIconData: homeModel.obscurePass
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTextChanged: (value) {}, //TODO: ADD AUTH
                        //sets the pass text to obscure or not obscure
                        onSuffixiconTap: () {
                          homeModel.obscurePass
                              ? homeModel.setObscurePass = false
                              : homeModel.setObscurePass = true;
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

                  SizedBox(height: 20),
                  ButtonWidgetStyle1(
                    hasBorder: true,
                    buttonTitle: "Login",
                    onTapFunction: () => print("pressed"),
                  ),
                  SizedBox(height: 230),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
