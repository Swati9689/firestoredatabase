
import 'package:eventapp/model/user_task_model.dart';
import 'package:eventapp/service/firebase_db_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DbHandlerController extends GetxController{

  Rx<List<UserTaskModel>> data = Rx<List<UserTaskModel>>([]);

  final FirebaseDbService _firebaseDbService = FirebaseDbService();

  Future<bool> addTask(String userName, UserTaskModel model) async{
    return await _firebaseDbService.addTaskToDatabase(userName,model);
  }

  Future<void> fetchAllTask(String userName)async{
    data.value= await _firebaseDbService.getDataFromDatabase(userName);
  }

  Future<void>deleteTask(UserTaskModel value, int index,String userName)async {
    await _firebaseDbService.deleteDataFromDB(value,index,userName);
  }
}
