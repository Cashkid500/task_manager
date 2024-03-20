import 'dart:convert';
import 'dart:developer';
import 'package:task_manager/constants/app_api_endpoint.dart';
import 'package:task_manager/core/network/network_request.dart';
import 'package:task_manager/core/network/network_retry.dart';
import 'package:task_manager/data/source/tasks/tasks_abstract.dart';
import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/models/tasks/response/create_task.dart';
import 'package:task_manager/models/tasks/response/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/models/tasks/response/update_task.dart';

//************ Create Task **********
class CreateTaskSourceImpl implements CreateTaskSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  CreateTaskSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<CreateTaskResponse> createTask(
      {required CreateTaskModel payload}) async {
    String url = AppEndpoints.createTask;
    final body = {
      "title": payload.title,
      "description": payload.description,
      "date": payload.date,
    };
    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final CreateTaskResponse responseModel =
            CreateTaskResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final CreateTaskResponse responseModel =
          CreateTaskResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}

//************ Update Task **********
class UpdateTaskSourceImpl implements UpdateTaskSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  UpdateTaskSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<UpdateTaskResponse> updateTask(
      {required UpdateTaskModel payload}) async {
    String url = AppEndpoints.updateTask;
    final body = {
      "trackid": payload.trackid,
      "title": payload.title,
      "description": payload.description,
      "date": payload.date,
    };
    final response = await networkRetry.networkRetry(
      () => networkRequest.put(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final UpdateTaskResponse responseModel =
            UpdateTaskResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final UpdateTaskResponse responseModel =
          UpdateTaskResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}

//************ Delete Task **********
class DeleteTaskSourceImpl implements DeleteTaskSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  DeleteTaskSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<DeleteTaskResponse> deleteTask(
      {required DeleteTaskModel payload}) async {
    String url = AppEndpoints.deleteTask;
    final body = {
      "trackid": payload.trackid,
    };
    final response = await networkRetry.networkRetry(
      () => networkRequest.delete(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final DeleteTaskResponse responseModel =
            DeleteTaskResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final DeleteTaskResponse responseModel =
          DeleteTaskResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}

//************ Get Task **********
class GetTaskSourceImpl implements GetTaskSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  GetTaskSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<GetTaskResponse> getTask() async {
    String url = AppEndpoints.getTask;
    final response = await networkRetry.networkRetry(
      () => networkRequest.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final GetTaskResponse responseModel =
            GetTaskResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final GetTaskResponse responseModel =
          GetTaskResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}
