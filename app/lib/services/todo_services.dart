import 'package:chopper/chopper.dart';
import 'package:package/package.dart';

class TodoService {
  final url = Uri.parse("http://10.0.2.2:8080");

  // get todos
  Future<Response<List<Todos>>> getTodos() {
    return Openapi.create(baseUrl: url).todosGet();
  }

  Future<Response<dynamic>> createTodo({required String title}) async {
    return await Openapi.create(baseUrl: url)
        .todosPost(body: Todos(title: title, completed: false));
  }
}
