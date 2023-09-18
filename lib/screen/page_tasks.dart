import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_exa/auth/login_screen.dart';
import 'package:todo_exa/controller.dart';
import 'package:todo_exa/utils/utils.dart';

class PageTask extends StatefulWidget {
  final int? index;
  String? titulo;
  String? tarefa;
  PageTask({
    Key? key,
    this.index,
    this.titulo,
    this.tarefa,
  }) : super(key: key);

  @override
  State<PageTask> createState() => _PageTaskState();
}

class _PageTaskState extends State<PageTask> {
  final auth = FirebaseAuth.instance;

  final controller = Get.put<TodoController>(TodoController());
  @override
  void initState() {
    super.initState();
  }

  final editControntroller = TextEditingController();
  final editTaskControntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    editControntroller.text = widget.titulo!;
    editTaskControntroller.text = widget.tarefa!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO Task'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: editControntroller,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: editTaskControntroller,
              decoration: const InputDecoration(
                  hintMaxLines: 4, border: OutlineInputBorder()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.editarMensagem(controller.id, editControntroller.text,
              editTaskControntroller.text);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
