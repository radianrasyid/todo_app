import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_app/apis/api_list.dart';
import 'package:todo_app/models/todo_model.dart';

class HomeController extends GetxController {
  RxList todoList = <TodoModel>[].obs;
  RxBool loading = true.obs;

  ApiList apiList = ApiList();
  @override
  void onInit() async {
    super.onInit();
    await getAllTodos();
  }

  Future<dynamic> getAllTodos() async {
    loading.value = true;
    update();
    final response = await apiList.getTodoList();

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      final res = jsonResponse.map((e) => TodoModel.fromJson(e)).toList();
      todoList.value = res;
      loading.value = false;
      update();
    } else {
      return Get.snackbar('Failed', 'Failed to connect to api');
    }
  }

  void changeCompelet(int index) async {
    todoList.value[index].completed = !todoList[index].completed;
    update();
  }

  void completeToTrue(int index) async {
    todoList.value[index].completed = true;
    update();
  }

  void selectAllTodo() async {
    final allComplete = todoList.every((element) => element.completed == true);
    for (int i = 0; i < todoList.length; i++) {
      if (allComplete) {
        changeCompelet(i);
        continue;
      } else if (allComplete == false) {
        completeToTrue(i);
        continue;
      }
    }
    update();
  }
}
