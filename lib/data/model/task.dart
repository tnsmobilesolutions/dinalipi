
import 'package:get/get.dart';

class Task extends GetxController {
  var taskName = ''.obs;
  var startTime = ''.obs;
  var endTime = ''.obs;

  void addDinacharyaTask(var _taskName, var _startTime, var _endTime) {
    taskName.value = _taskName;
    startTime.value = _startTime;
    endTime.value = _endTime;

    update();
  }

  

  
}
