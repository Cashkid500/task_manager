import 'package:task_manager/core/failures/failures.dart';
import 'package:task_manager/models/tasks/response/create_task.dart';
import 'package:task_manager/models/tasks/response/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/models/tasks/response/update_task.dart';

//************ Create Task State **********
class CreateTaskState {}

class CreateTaskInitial extends CreateTaskState {}

class CreateTaskLoading extends CreateTaskState {}

class CreateTaskFailure extends CreateTaskState {
  final Failure failure;
  CreateTaskFailure({required this.failure});
}

class CreateTaskSuccess extends CreateTaskState {
  final CreateTaskResponse responseData;
  CreateTaskSuccess({required this.responseData});
}

//************ Update Task State **********
class UpdateTaskState {}

class UpdateTaskInitial extends UpdateTaskState {}

class UpdateTaskLoading extends UpdateTaskState {}

class UpdateTaskFailure extends UpdateTaskState {
  final Failure failure;
  UpdateTaskFailure({required this.failure});
}

class UpdateTaskSuccess extends UpdateTaskState {
  final UpdateTaskResponse responseData;
  UpdateTaskSuccess({required this.responseData});
}

//************ Delete Task State **********
class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskFailure extends DeleteTaskState {
  final Failure failure;
  DeleteTaskFailure({required this.failure});
}

class DeleteTaskSuccess extends DeleteTaskState {
  final DeleteTaskResponse responseData;
  DeleteTaskSuccess({required this.responseData});
}

//************ Get Task State **********
class GetTaskState {}

class GetTaskInitial extends GetTaskState {}

class GetTaskLoading extends GetTaskState {}

class GetTaskFailure extends GetTaskState {
  final Failure failure;
  GetTaskFailure({required this.failure});
}

class GetTaskSuccess extends GetTaskState {
  final GetTaskResponse responseData;
  GetTaskSuccess({required this.responseData});
}
