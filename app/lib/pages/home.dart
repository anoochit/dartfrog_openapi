import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder(
        future: TodoService().getTodos(),
        builder: (context, AsyncSnapshot<Response<List<Todos>>> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          if (snapshot.hasData) {
            final todos = snapshot.data?.body ?? [];

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  title: Text('${todos[index].title}'),
                  value: todos[index].completed,
                  onChanged: (bool? value) {
                    // update
                  },
                );
              },
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add todo
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final todoController = TextEditingController();
              final formKey = GlobalKey<FormState>();

              return AlertDialog(
                title: const Text('Add task'),
                content: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: todoController,
                    decoration: const InputDecoration(hintText: 'task...'),
                    validator: (value) {
                      if ((value == null) || (value.isEmpty)) {
                        return 'Enter task';
                      }

                      return null;
                    },
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      //save todo
                      if (formKey.currentState!.validate()) {
                        final result = await TodoService()
                            .createTodo(title: todoController.text);
                        log('$result');

                        // then pop
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
