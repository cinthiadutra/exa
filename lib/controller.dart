import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_exa/model.dart';
import 'package:todo_exa/utils/utils.dart';

class TodoController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final taskController = TextEditingController();
  final postController = TextEditingController();
  ModelTodo? modeloUsado;
  String post = '';
  String? task = '';
  List<ModelTodo> listaTodoGeral = [];
  final List<String> ListTask = [];
  Rx<bool> loading = false.obs;
  final _auth = FirebaseAuth.instance;
  final String id = DateTime.now().millisecondsSinceEpoch.toString();

  Future addTodo() async {
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    loading.value = true;

    await databaseRef.child(id).set({
      'user': _auth.currentUser?.email,
      'title': post,
      'task': task,
      'id': id
    }).then((value) {
      modeloUsado =
          ModelTodo(isCompleted: false, titulo: post, tarefas: ListTask);
      Utils().toastMessage('Conteudo Adicionado');
      Navigator.pop(Get.context!);
      postController.clear();
      taskController.clear();
      loading.value = false;
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());

      loading.value = false;
    });
  }

  Future editarMensagem(String id, String novoTitulo, String novaTarefa) async {
    await databaseRef.child(id).update({
      "title": novoTitulo,
    }).then((_) {
      print("Mensagem editada com sucesso");
    }).catchError((error) {
      print("Erro ao editar mensagem: $error");
    });
    await databaseRef.child(id).update({
      "task": novaTarefa,
    }).then((_) {
      print("Mensagem editada com sucesso");
    }).catchError((error) {
      print("Erro ao editar mensagem: $error");
    });
    Navigator.pop(Get.context!);
    Navigator.pop(Get.context!);
  }

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  void atualizarBancoDeDadosEEnviarNotificacao() {
    // Atualize o banco de dados Firebase Realtime
    // ...

    // Envie uma notificação por meio do FCM
    FirebaseMessaging.instance.subscribeToTopic('atualizacao_banco');
    FirebaseMessaging.instance.sendMessage(data: {
      'title': 'Atualização no banco de dados',
      'body': 'Seu banco de dados foi atualizado!',
    });
  }

  removeList(String id) {
    loading.value = true;

    databaseRef.child(id).remove().then((value) {
      Utils().toastMessage('Lista Apagada');
      Navigator.pop(Get.context!);
      loading.value = false;
      refresh();
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());

      loading.value = false;
    });
  }
}

  // void addTask() {
  //   final String id = DateTime.now().millisecondsSinceEpoch.toString();
  //   databaseRef.child(id).set({
  //     'id': id,
  //     'task': taskController.text,
  //   }).then((value) {
  //     ListTask.add(taskController.text);
  //     Utils().toastMessage('Task Adicionada');

  //     loading.value = true;
  //     Navigator.pop(Get.context!);
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());

  //     loading.value = false;
  //   });
  // }

  // Future addList() async {
  //   final String id = DateTime.now().millisecondsSinceEpoch.toString();
  //   loading.value = true;

  //   await databaseRef
  //       .child(id)
  //       .set({'user': _auth.currentUser?.email, 'title': post}).then((value) {
  //     ListTask.assign(taskController.text);
  //     Utils().toastMessage('Lista Adicionada');
  //     Navigator.pop(Get.context!);
  //     postController.clear();
  //     loading.value = false;
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());

  //     loading.value = false;
  //   });
  // }


//    addTask() {
//     var title = postController.text;
//     loading.value = true;

//     final String id = _auth.currentUser!.uid.toString();
//     databaseRef.child(id).child(title).set({
//       'task': taskController.text.toString(),
//     }).then((value) {
//       ListTask.add(taskController.text);
//       Utils().toastMessage('Lista Adicionada');

//       loading.value = false;
//     }).onError((error, stackTrace) {
//       Utils().toastMessage(error.toString());

//       loading.value = false;
//     });
//   }
// }
