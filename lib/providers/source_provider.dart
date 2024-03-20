import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/source/tasks/tasks_abstract.dart';
import 'package:task_manager/data/source/tasks/tasks_source.dart';
import 'package:task_manager/providers/network_provider.dart';

//************ Create Task Source Provider **********
final createTaskSourceProvider = Provider<CreateTaskSource>(
  (ref) => CreateTaskSourceImpl(
    networkRequest: ref.read(networkRequestProvider), 
    networkRetry: ref.read(networkRetryProvider),
    ),
  );

//************ Update Task Source Provider **********
final updateTaskSourceProvider = Provider<UpdateTaskSource>(
  (ref) => UpdateTaskSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
    ),
  );

//************ Delete Task Source Provider **********
final deleteTaskSourceProvider = Provider<DeleteTaskSource>(
  (ref) => DeleteTaskSourceImpl(
    networkRequest: ref.read(networkRequestProvider), 
    networkRetry: ref.read(networkRetryProvider),
    ),
  );

//************ Get Task Source Provider **********
final getTaskSourceProvider = Provider<GetTaskSource>(
  (ref) => GetTaskSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
