import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rescue2/screens/colors.dart';

class Forgot extends StatefulWidget {
   Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
   var emailController = TextEditingController();

   var passwordController = TextEditingController();

   var re_passwordController = TextEditingController();

   bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    children: const [
                      Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFF59769E),
                                )
                            )
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Mycolor.teal,
                            ),
                              border: InputBorder.none
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFF59769E),
                                )
                            )
                        ),
                        child: TextField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",

                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure ? Icons.visibility_off : Icons.visibility,
                                  color: Mycolor.teal,),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),

                            prefixIcon: Icon(
                              Icons.lock,
                              color: Mycolor.teal,
                            ),
                              border: InputBorder.none
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFF59769E),
                                )
                            )
                        ),
                        child: TextField(
                          obscureText: _isObscure,
                          controller: re_passwordController,
                          decoration: InputDecoration(
                            hintText: "Retype-Password",

                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure ? Icons.visibility_off : Icons.visibility,
                                  color: Mycolor.teal,),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),

                            prefixIcon: Icon(
                              Icons.lock,
                              color: Mycolor.teal,
                            ),
                              border: InputBorder.none
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Mycolor.red,
                          fixedSize: const Size(300, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'RESET PASSWORD',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
