import 'dart:io';

import 'package:backend/services/todos_services.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final req = context.request;

  switch (req.method) {
    case HttpMethod.get:
      {
        final todos = TodoService().getTodos();
        return Response.json(body: todos.toList());
      }

    case HttpMethod.post:
      {
        final body = await req.json() as Map<String, dynamic>;
        TodoService().addTodo(todo: body);
        return Response.json(body: body);
      }

    default:
      return Response(statusCode: HttpStatus.badRequest);
  }
}
