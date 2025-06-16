/*
  Componente: Task Model

  Descrição:
  Este arquivo contém a definição do componente task_model. Ele segue o padrão de estrutura e estilo do projeto,
  com comentários explicativos, espaçamento entre blocos de código e responsabilidades bem definidas.
*/


import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String date;
  final Color color;
  String description;
  bool isDone;

  TaskModel({
    required this.title,
    required this.date,
    required this.color,
    this.description = '',
    this.isDone = false,
  });
}
