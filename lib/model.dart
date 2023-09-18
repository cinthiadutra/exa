import 'dart:convert';

class ModelTodo {
  String? id;
  String? titulo;
  List<String>? tarefas;
  bool isCompleted;
  ModelTodo({
    this.titulo,
    this.tarefas,
    this.id,
    required this.isCompleted,
  });

  @override
  String toString() =>
      'ModelTodo(id: $id,titulo: $titulo, tarefas: $tarefas, isCompleted: $isCompleted)';

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'tarefas': tarefas,
      'isCompleted': isCompleted,
      'id': id
    };
  }

  factory ModelTodo.fromMap(Map<String, dynamic> map) {
    return ModelTodo(
      id: map['id'],
      titulo: map['titulo'],
      tarefas: List<String>.from(map['tarefas']),
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTodo.fromJson(String source) =>
      ModelTodo.fromMap(json.decode(source));
}
