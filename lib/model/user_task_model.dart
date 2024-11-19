
import 'dart:convert';
class UserTaskModel {
  final String taskName;
  final bool isCompleted;

  UserTaskModel({required this.taskName, required this.isCompleted});

  factory UserTaskModel.fromMap(Map<String, dynamic> map) {
    return UserTaskModel(
      taskName: map['taskName'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'isCompleted': isCompleted,
    };
  }
  static List<Map<String, dynamic>> getMapDataFromUserTaskModel(List<UserTaskModel> data) {
    return data.map((task) => task.toMap()).toList();
  }
  static List<UserTaskModel> getUserTaskModelFromString(String data) {
    return List<UserTaskModel>.from(
      jsonDecode(data).map((x) => UserTaskModel.fromMap(x as Map<String, dynamic>)),
    );
  }
  static List<UserTaskModel> getUserTaskModelFromMap(List<dynamic> data) {
    return data.map((task) => UserTaskModel.fromMap(task as Map<String, dynamic>)).toList();
  }
}

