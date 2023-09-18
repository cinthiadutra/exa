import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_exa/auth/login_screen.dart';
import 'package:todo_exa/controller.dart';
import 'package:todo_exa/screen/add_List.dart';
import 'package:todo_exa/screen/page_tasks.dart';
import 'package:todo_exa/utils/utils.dart';
import 'package:todo_exa/widget/cards_todo.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  final auth = FirebaseAuth.instance;

  bool loading = false;
  final controller = Get.put<TodoController>(TodoController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'TODO List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
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
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: controller.databaseRef,
                defaultChild: const Text('Loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('title').value.toString();
                  final tarefa = snapshot.child('task').value.toString();

                  return ListTile(
                    title: CardTodo(
                      title: snapshot.child('title').value.toString(),
                      taks: snapshot.child('task').value.toString(),
                      user: snapshot.child('user').value.toString(),
                      id: snapshot.child('id').value.toString(),
                    ),
                    trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  leading: const Icon(Icons.edit),
                                  title: const Text('Editar'),
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PageTask(
                                                index: index,
                                                titulo: title,
                                                tarefa: tarefa,
                                              ))),
                                ),
                              ),
                              PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    leading: const Icon(Icons.delete),
                                    title: const Text('Excluir'),
                                    onTap: () {
                                      controller.removeList(snapshot
                                          .child('id')
                                          .value
                                          .toString());
                                    },
                                  )),
                            ]),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddList()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
