import 'package:eventapp/controller/auth_controller.dart';
import 'package:eventapp/screens/home_screen.dart';
import 'package:eventapp/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body:SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login View",style:TextStyle(fontSize: 30,color: Colors.black)),
              const SizedBox(height: 50,),
              Container(
                margin: const EdgeInsets.all(20),
                child: Form(

                    key: _formkey,

                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val){
                            if (val!.isEmpty){
                              return "Username should not be Empty";
                            }
                            return null;
                          },

                          controller: _username,
                          decoration: InputDecoration(
                              hintText: "UserName",
                              label: const Text("UserName"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),



                        const SizedBox(height: 20,),
                        TextFormField(
                          obscureText: passwordVisible,
                          controller: _password,
                          validator: (val){
                            if (val!.isEmpty){
                              return "Password should not be Empty";
                            }
                            return null;
                          },


                          decoration: InputDecoration(
                              suffixIcon: IconButton(icon: Icon(passwordVisible?Icons.visibility_off:Icons.visibility),
                                onPressed: (){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },),
                              hintText: "Password",
                              label: const Text("Password"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(height:30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15))
                  ),
                  onPressed: ()async{

                    if(_formkey.currentState!.validate()) {
                      final User? user = (await _authController.loginUser(
                          _username.text, _password.text)) as User?;
                      if (user != null) {
                        _navigateToHomeScreen(user);
                      } else {
                        _showSnackBar();
                      }
                    }
                    //_authController.authUser(_username.text, _password.text);
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen("Unknown")));
                  }, child: const Text("Login",style: TextStyle(fontSize: 15,color: Colors.black),)),

              const SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(child: const Text("Not Registered?"),onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                  },
                  )
                ],
              )

            ],
          ),
        ) );
  }
  _navigateToHomeScreen(User user){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(user)));
  }
  _showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Not Registered"),TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RegisterScreen()));
        },
            child: const Text("Register"))
      ],
    ),));
  }
}











