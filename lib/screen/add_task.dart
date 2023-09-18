import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_exa/controller.dart';

class AddTask extends StatefulWidget {
  final int? index;
  final String? title;

  const AddTask({
    Key? key,
    this.index,
    this.title,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final controller = Get.put<TodoController>(TodoController());
  TextEditingController newtitulo = TextEditingController();
  TextEditingController newTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = controller.modeloUsado;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: newtitulo,
                  maxLines: 2,
                  initialValue: model?.titulo?[widget.index!],
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 6,
                  initialValue: model?.tarefas?[widget.index!],
                  controller: newTask,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: const Text('atualizar'),
                    onPressed: () async {
                      setState(() {
                        controller.loading.value = true;
                     
                      });
                         await controller.editarMensagem(
                            controller.id, newtitulo.text, newTask.text);
                    
                    })
              ],
            )));
  }
}
