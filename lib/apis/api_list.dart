import 'package:http/http.dart' as http;
import 'package:todo_app/utils/constants.dart';

class ApiList {
  Future<dynamic> getTodoList() async {
    http.Response response = await http.get(Uri.parse('$ApiBaseUrl/todos'));

    return response;
  }

  Future<dynamic> getTodoListPerId(int id) async {
    http.Response response = await http.get(Uri.parse('$ApiBaseUrl/todos/$id'));

    return response;
  }
}
