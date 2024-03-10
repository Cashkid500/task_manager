import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/tasks/tasks_abstract.dart';
import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/providers/repo_provider.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

class CreateTaskStateNotifier extends StateNotifier<CreateTaskState> {
  final CreateTaskRepo _createTaskRepository;

  CreateTaskStateNotifier(Ref ref)
      : _createTaskRepository = ref.read(createTaskRepositoryProvider),
        super(CreateTaskInitial());

  Future<void> createTask({
    required CreateTaskModel payload,
  }) async {
    state = CreateTaskLoading();

    final userTransactionListOrError =
        await _createTaskRepository.createTask(payload: payload);
    print(userTransactionListOrError.all);
    state = userTransactionListOrError.fold(
      (l) => CreateTaskFailure(failure:l),
      (r) => CreateTaskSuccess(responseData:r),
    );

    if (state is CreateTaskFailure) {
      final failureState = state as CreateTaskFailure;
    } else if (state is CreateTaskSuccess) {
      
    }
  }
  void resetState() {
    state = CreateTaskInitial();
  }
}

//************ Update Task State Notifier ************
class UpdateTaskStateNotifier extends StateNotifier<UpdateTaskState> {
  final UpdateTaskRepo _updateTaskRepository;

  UpdateTaskStateNotifier(Ref ref)
      : _updateTaskRepository = ref.read(updateTaskRepositoryProvider),
        super(UpdateTaskInitial());

  Future<void> updateTask({
    required UpdateTaskModel payload,
  }) async {
    state = UpdateTaskLoading();

    final userTransactionListOrError =
        await _updateTaskRepository.updateTask(payload: payload);
    print(userTransactionListOrError.all);
    state = userTransactionListOrError.fold(
      (l) => UpdateTaskFailure(failure: l),
      (r) => UpdateTaskSuccess(responseData: r),
    );

    if (state is UpdateTaskFailure) {
      final failureState = state as UpdateTaskFailure;
    } else if (state is UpdateTaskSuccess) {}
  }

  void resetState() {
    state = UpdateTaskInitial();
  }
}

//************ Delete Task State Notifier ************
class DeleteTaskStateNotifier extends StateNotifier<DeleteTaskState> {
  final DeleteTaskRepo _deleteTaskRepository;

  DeleteTaskStateNotifier(Ref ref)
      : _deleteTaskRepository = ref.read(deleteTaskRepositoryProvider),
        super(DeleteTaskInitial());

  Future<void> deleteTask({
    required DeleteTaskModel payload,
  }) async {
    state = DeleteTaskLoading();

    final userTransactionListOrError =
        await _deleteTaskRepository.deleteTask(payload: payload);
    print(userTransactionListOrError.all);
    state = userTransactionListOrError.fold(
      (l) => DeleteTaskFailure(failure: l),
      (r) => DeleteTaskSuccess(responseData: r),
    );

    if (state is DeleteTaskFailure) {
      final failureState = state as DeleteTaskFailure;
    } else if (state is DeleteTaskSuccess) {}
  }

  void resetState() {
    state = DeleteTaskInitial();
  }
}
