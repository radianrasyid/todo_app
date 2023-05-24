// import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:todo_app/apis/api_list.dart';
import 'package:todo_app/models/album_model.dart';
import 'package:todo_app/utils/constants.dart';

class Controller extends GetxController {
  // ApiList apiList = ApiList();
  // RxList photoList = <UserList>[].obs;
  // RxBool isLoading = true.obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   await fetchUpcomingMovies();
  // }

  // Future<void> fetchUpcomingMovies() async {
  //   isLoading.value = true;
  //   final response = await apiList.getAlbumData();
  //   print(response.body[0]);
  //   if (response.statusCode == 200) {
  //     List jsonResponse = jsonDecode(response.body);
  //     var result = jsonResponse.map((e) => UserList.fromJson(e)).toList();
  //     result.map((e) => photoList.add(e));
  //     photoList.value = result;
  //     isLoading.value = false;
  //   } else {
  //     Get.snackbar('Error on loading data',
  //         'Server Responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
  //   }
  // }
}
