import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventapp/model/user_task_model.dart';


class FirebaseDbService {
  final database = FirebaseFirestore.instance;
  static const userCollection = "user";

  Future<bool> createDatabaseForUser(String userName) async {
    await database.collection(userCollection).doc(userName).set({});
    return true;
  }

  Future<List<UserTaskModel>> getDataFromDatabase(String userName) async {
    try {
      final data = await database.collection(userCollection).doc(userName).get();
      if (data.data() != null) {
        return UserTaskModel.getUserTaskModelFromMap(data.data()!["UserTask"]);
      }
      return [];
    } catch (e) {
      print("Not found any data $e");
      return [];
    }
  }

  Future<bool> addTaskToDatabase(String userName, UserTaskModel model, {bool fromDelete = false, List<UserTaskModel>? deletedData}) async {
    try {
      if (!fromDelete) {
        List<UserTaskModel> data = await getDataFromDatabase(userName);
        data.add(model);
        await database.collection(userCollection).doc(userName).set({
          "UserTask": UserTaskModel.getMapDataFromUserTaskModel(data)
        });
      } else {
        if (deletedData != null) {
          await database.collection(userCollection).doc(userName).set({
            "UserTask": UserTaskModel.getMapDataFromUserTaskModel(deletedData)
          });
        }
      }
      return true;
    } catch (e) {
      print("Error while adding the data | $e");
      return false;
    }
  }

  Future<void> deleteDataFromDB(UserTaskModel value, int index, String userName) async {
    try {
      List<UserTaskModel> data = await getDataFromDatabase(userName);
      data.removeAt(index);
      await addTaskToDatabase(userName, UserTaskModel(taskName: "From Delete Method", isCompleted: false), fromDelete: true, deletedData: data);
    } catch (e) {
      log("Unable to delete $e");
    }
  }
}

