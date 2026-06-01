import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'task_model.dart';

class TaskStorage {
  static const String key = "tasks";

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data =
        tasks.map((task) => jsonEncode(task.toJson())).toList();

    await prefs.setStringList(key, data);
  }

  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(key);

    if (data == null) return [];

    return data.map((e) => Task.fromJson(jsonDecode(e))).toList();
  }
}