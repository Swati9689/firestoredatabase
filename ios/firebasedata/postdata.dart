import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _form = GlobalKey<FormState>();
  late String title;
  late String name;
  late String email;
  late String city;
  late String address;


  void writeData() async {
    _form.currentState?.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url ="https://eventapp-f22d0-default-rtdb.firebaseio.com/data/-O4U4RA73wY-5ErAV6qj"+"data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(Uri.parse(url),
        body: json.encode({"name": name, "title": title, "email": email}),
        //body:json.encode({"name": name}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RealTime Database',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GeeksforGeeks"),
        ),
        body: Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Title"),
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),


                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Name"),
                  onSaved: (value) {
                    name = value!;
                  },
                ),


                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Mail"),
                  onSaved: (value) {
                    city = value!;
                  },
                ),


                SizedBox(
                  height: 10,
                ),



                ElevatedButton(
                    onPressed: writeData,
                   // co: Colors.green,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






