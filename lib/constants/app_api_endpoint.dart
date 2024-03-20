class AppEndpoints {
  static const _base = 'https://taskmanager3.000webhostapp.com/task_manager_api/api/user/task';

  //************** Create Task *************/
  static const createTask = '$_base/create_task.php';
  
  //************** Update Task *************/
  static const updateTask = '$_base/update_task.php';

  //************** Delete Task *************/
  static const deleteTask = '$_base/delete_task.php';

  //************** Get Task *************/
  static const getTask = '$_base/get_task.php';
}
