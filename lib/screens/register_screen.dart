
import 'package:eventapp/controller/auth_controller.dart';
import 'package:eventapp/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body:SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register View",style:TextStyle(fontSize: 30,color: Colors.black)),
              const SizedBox(height: 50,),
              Container(
                margin: const EdgeInsets.all(20),
                child: Form(child: Column(
                  children: [
                    TextFormField(
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
                      controller: _password,
                      decoration: InputDecoration(
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
                    await  _authController.registerUser(_username.text,_password.text).then((user){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Registered")));
                    });
                    //_authController.authUser(_username.text, _password.text);
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen("Unknown")));
                  }, child: const Text("Register",style: TextStyle(fontSize: 15,color: Colors.black),)),

              const SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(child:const Text("Already Registered?"),onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  },
                  )
                ],
              )

            ],
          ),
        ) );
  }
}













