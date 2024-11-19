
import 'package:eventapp/controller/db_handler_controller.dart';
import 'package:eventapp/model/user_task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      this.user,{
        super.key});

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dbController = Get.put(DbHandlerController());
  final TextEditingController _taskNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbController.fetchAllTask(widget.user.email.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const SizedBox.shrink(),
        title: const Text("TaskMaster"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            Navigator.pop(context);
          }, icon: const Icon(Icons.logout, color: Colors.white,))
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          _showDialog();
        }, label: const Text("Add Task"),),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text("Task", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),),)
            ],
          ),

          const SizedBox(height: 20,),
          Expanded(
              child: Obx(() =>
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: dbController.data.value.length,
                      itemBuilder: (context, index) =>
                          ListTile(
                            trailing: IconButton(
                              onPressed: (){
                                dbController.deleteTask(dbController.data.value[index],index,widget.user.email.toString()).then((_)async{

                                  await dbController.fetchAllTask(widget.user.email.toString());
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            title: Text(
                                dbController.data.value[index].taskName),
                          )
                  ),
              )
          )

        ],
      ),
    );
  }

  _showDialog() {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
                      label: Text("Task Name")),
                ),

                TextButton(onPressed: () {
                  dbController.addTask(widget.user.email.toString(),
                      UserTaskModel(taskName: _taskNameController.text,
                          isCompleted: false)).then((_) async{
                    await dbController.fetchAllTask(widget.user.email.toString());
                    _taskNameController.clear();
                  });
                  Navigator.pop(context);
                }, child: const Text("Add Task"),)

              ],
            )
        ));
  }
}












