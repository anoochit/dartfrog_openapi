//Generated code

part of 'openapi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$Openapi extends Openapi {
  _$Openapi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Openapi;

  @override
  Future<Response<List<Todos>>> _todosGet() {
    final Uri $url = Uri.parse('/todos');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Todos>, Todos>($request);
  }

  @override
  Future<Response<dynamic>> _todosPost({required Todos? body}) {
    final Uri $url = Uri.parse('/todos');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Todos>> _todosIdGet({required String? id}) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Todos, Todos>($request);
  }

  @override
  Future<Response<Todos>> _todosIdPut({
    required String? id,
    required Todos? body,
  }) {
    final Uri $url = Uri.parse('/todos/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Todos, Todos>($request);
  }

  @override
  Future<Response<dynamic>> _todosIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
