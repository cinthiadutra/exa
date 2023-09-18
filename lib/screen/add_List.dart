import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_exa/controller.dart';

class AddList extends StatefulWidget {
  const AddList({Key? key}) : super(key: key);

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final postController = TextEditingController();
  final taskController = TextEditingController();
  final controller = Get.put<TodoController>(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 2,
                controller: postController,
                decoration: const InputDecoration(
                    hintText: 'Insira o titulo da Lista',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 6,
                controller: taskController,
                decoration: const InputDecoration(
                    hintText: 'Insira as tarefas aqui',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  child: const Text('Adicionar'),
                  onPressed: () async {
                    setState(() {
                      controller.loading.value = true;
                      controller.post = postController.text;
                      controller.task = taskController.text;
                      controller.ListTask.assign(taskController.text);
                    });
                    await controller.addTodo();
                  })
            ],
          ),
        ),
      ),
    );
  }

  // void AddList() {
  //   setState(() {
  //     loading = true;
  //   });

  //   String id = DateTime.now().millisecondsSinceEpoch.toString();
  //   databaseRef.child(id).set({
  //     'title': postController.text.toString(),
  //     'id': DateTime.now().millisecondsSinceEpoch.toString(),
  //     'task': task.text.toString(),
  //   }).then((value) {
  //     Utils().toastMessage('Lista Adicionada');
  //     setState(() {
  //       loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }
  // void RemoveList() {
  //   setState(() {
  //     loading = true;
  //   });

  //   String id = DateTime.now().millisecondsSinceEpoch.toString();
  //   databaseRef.child(id).remove().then((value) {
  //     Utils().toastMessage('Lista Apagada');
  //     setState(() {
  //       loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }

  //   void AddTask() {
  //   setState(() {
  //     loading = true;
  //   });

  //   String id = DateTime.now().millisecondsSinceEpoch.toString();
  //   databaseRef.child(id).update({
  //     'task': task.text.toString(),
  //   }).then((value) {
  //     Utils().toastMessage('Lista Adicionada');
  //     setState(() {
  //       loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }
}
