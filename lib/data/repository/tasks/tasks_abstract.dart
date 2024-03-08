import 'package:dartz/dartz.dart';
import 'package:task_manager/core/failures/failures.dart';
import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/models/tasks/response/create_task.dart';
import 'package:task_manager/models/tasks/response/delete_task.dart';
import 'package:task_manager/models/tasks/response/update_task.dart';

//************ Create Task **********
abstract class CreateTaskRepo {
  Future<Either<Failure, CreateTaskResponse>> createTask({
    required CreateTaskModel payload,
  });
}

//************ Update Task **********
abstract class UpdateTaskRepo {
  Future<Either<Failure, UpdateTaskResponse>> updateTask({
    required UpdateTaskModel payload,
  });
}

//************ Delete Task **********
abstract class DeleteTaskRepo {
  Future<Either<Failure, DeleteTaskResponse>> deleteTask({
    required DeleteTaskModel payload,
  });
}