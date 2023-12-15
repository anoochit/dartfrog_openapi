import 'dart:io';

import 'package:backend/services/todos_services.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final req = context.request;
  switch (req.method) {
    case HttpMethod.get:
      {
        try {
          final todo = TodoService().getTodo(id);
          return Response.json(body: todo.toJson());
        } catch (e) {
          return Response(statusCode: HttpStatus.badRequest);
        }
      }
    case HttpMethod.delete:
      {
        try {
          TodoService().deleteTodo(id: id);
          return Response(statusCode: HttpStatus.ok);
        } catch (e) {
          return Response(statusCode: HttpStatus.badRequest);
        }
      }

    case HttpMethod.put:
      {
        try {
          final todo = await req.json();
          final result = TodoService().updateTodo(todo: todo, id: id);
          return Response.json(body: result.toJson());
        } catch (e) {
          return Response(statusCode: HttpStatus.badRequest);
        }
      }
    default:
      return Response(statusCode: HttpStatus.badRequest);
  }
}
