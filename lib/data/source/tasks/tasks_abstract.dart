import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/models/tasks/response/create_task.dart';
import 'package:task_manager/models/tasks/response/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/models/tasks/response/update_task.dart';

//************ Create Task **********
abstract class CreateTaskSource {
  Future<CreateTaskResponse> createTask({
    required CreateTaskModel payload,
  });
}

//************ Update Task **********
abstract class UpdateTaskSource {
  Future<UpdateTaskResponse> updateTask({
    required UpdateTaskModel payload,
  });
}

//************ Delete Task **********
abstract class DeleteTaskSource {
  Future<DeleteTaskResponse> deleteTask({
    required DeleteTaskModel payload,
  });
}

//************ Get Task **********
abstract class GetTaskSource {
  Future<GetTaskResponse> getTask();
}
