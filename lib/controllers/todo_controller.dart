import 'package:get/get.dart';
import 'package:todo_app/apis/api_list.dart';

class TodoController extends GetxController {
  ApiList apiList = ApiList();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
