import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/failures/failures.dart';
import 'package:task_manager/core/network/network_info.dart';
import 'package:task_manager/core/runner/service.dart';
import 'package:task_manager/data/repository/tasks/tasks_abstract.dart';
import 'package:task_manager/data/source/tasks/tasks_abstract.dart';
import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/models/tasks/response/create_task.dart';
import 'package:task_manager/models/tasks/response/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/models/tasks/response/update_task.dart';
import 'package:task_manager/providers/network_provider.dart';
import 'package:task_manager/providers/source_provider.dart';


//************ Create Task ************/
class CreateTaskRepoImpl implements CreateTaskRepo {
  final NetworkInfo create;
  final CreateTaskSource task;

  CreateTaskRepoImpl({required Ref ref})
      : task = ref.read(createTaskSourceProvider),
        create = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, CreateTaskResponse>> createTask({
    required CreateTaskModel payload,
    }) async {
        ServiceRunner<Failure, CreateTaskResponse> sR = ServiceRunner(create);

        return sR.tryRemoteandCatch(
          call: task.createTask(payload: payload),
          errorTitle: "Task Not Created",
        );
    }
}
  
//************ Update Task ************/
class UpdateTaskRepoImpl implements UpdateTaskRepo {
  final NetworkInfo update;
  final UpdateTaskSource task;

  UpdateTaskRepoImpl({required Ref ref})
      : task = ref.read(updateTaskSourceProvider),
        update = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, UpdateTaskResponse>> updateTask({
    required UpdateTaskModel payload,
    }) async {
        ServiceRunner<Failure, UpdateTaskResponse> sR = ServiceRunner(update);

        return sR.tryRemoteandCatch(
          call: task.updateTask(payload: payload),
          errorTitle: "Task Not Updated",
        );
    }
}


//************ Delete Task ************/
class DeleteTaskRepoImpl implements DeleteTaskRepo {
  final NetworkInfo delete;
  final DeleteTaskSource task;

  DeleteTaskRepoImpl({required Ref ref})
      : task = ref.read(deleteTaskSourceProvider),
        delete = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, DeleteTaskResponse>> deleteTask({
    required DeleteTaskModel payload,
    }) async {
        ServiceRunner<Failure, DeleteTaskResponse> sR = ServiceRunner(delete);

        return sR.tryRemoteandCatch(
          call: task.deleteTask(payload: payload),
          errorTitle: "Task Not Deleted",
        );
    }
}

//************ Get Task ************/
class GetTaskRepoImpl implements GetTaskRepo {
  final NetworkInfo fetch;
  final GetTaskSource task;

  GetTaskRepoImpl({required Ref ref})
      : task = ref.read(getTaskSourceProvider),
        fetch = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, GetTaskResponse>> getTask() async {
    ServiceRunner<Failure, GetTaskResponse> sR = ServiceRunner(fetch);

    return sR.tryRemoteandCatch(
      call: task.getTask(),
      errorTitle: "Task Not Fetched",
    );
  }
}
