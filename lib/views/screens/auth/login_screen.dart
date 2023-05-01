import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/views/widgets/text_input_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // this is used to create the controller for the input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passdwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              // thi sis used to set hte alignment of the elements
              alignment: Alignment.center,
              child: Column(
                // this is used to set the main axis alignment at the center
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tiktok Clone',
                      // this is used to set the style of the text
                      style: TextStyle(
                          // this is used to set the fontsize of the text
                          fontSize: 35,
                          // thsi is used to setht ecolor of the text
                          color: buttonColor,
                          // this is used to set the fontWeight of the text
                          fontWeight: FontWeight.w900)),
                  const Text('Login',
                      // this is used to set style of the text
                      style: TextStyle(
                          fontSize: 25,
                          // this is used to set the font Weight of the text
                          fontWeight: FontWeight.w700)),
                  // this is used to give a spacing in between the lements
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      // this is used to take all the available width
                      width: MediaQuery.of(context).size.width,
                      // this is used to set the margin
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                          controller: _emailController,
                          labelText: 'Email',
                          icon: Icons.email)),
                  // this is used to give a spacing in between the lements
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      // this is used to take all the available width
                      width: MediaQuery.of(context).size.width,
                      // this is used to set the margin
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                          controller: _passdwordController,
                          labelText: 'Password',
                          isObscure: true,
                          icon: Icons.lock)),
                  // this is used to give a spaing in between the elemtns
                  const SizedBox(height: 10),
                  Container(
                      // this is used to take all the available width
                      width: MediaQuery.of(context).size.width - 20,
                      // this is used to set the hieght of the container
                      height: 35,
                      // this is used to set the decoration of the contáiner
                      decoration: BoxDecoration(
                          // this is used to setht color
                          color: buttonColor,
                          // this is used to set the bporder radius
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: InkWell(
                        onTap: () => authController.loginUser(_emailController.text, _passdwordController.text),
                        child: const Center(
                            child: Text('Login',
                                // this is used to set the style of the text
                                style: TextStyle(
                                    // this is used to set the font size of the text
                                    fontSize: 20,
                                    // this is used to set the font weight of the tet
                                    fontWeight: FontWeight.w700))),
                      )),
                  // this is used to give a spacing in between the elements
                  const SizedBox(height: 15),
                  Row(
                      // this is used to set the nmain axis alignment of the property
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? ',
                            // this is used to set the style of the text
                            style: TextStyle(
                                // this is used to seth the font size of the text
                                fontSize: 20)),
                        InkWell(
                            onTap: () {
                              print('Register pressed');
                            },
                            child: Text('Register',
                                // this is used to set the style of the text
                                style:
                                    TextStyle(fontSize: 20, color: buttonColor)))
                      ])
                ],
              )),
        ));
  }
}
