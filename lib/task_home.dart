import 'package:flutter/material.dart';
import 'firebase_service.dart';
import 'task_model.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  final TextEditingController controller = TextEditingController();

  void addTask(String title) {
    FirebaseService.addTask(Task(title: title));
  }

  void deleteTask(String id) {
    FirebaseService.deleteTask(id);
  }

  void toggleTask(Task task) {
    FirebaseService.updateTask(task.id!, !task.isDone);
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Task"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter task"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                addTask(controller.text);
                controller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager (Firebase)"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: showAddDialog,
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseService.getTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;

          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks available"));
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final doc = tasks[index];
              final data = doc.data() as Map<String, dynamic>;

              final task = Task.fromMap(doc.id, data);

              return ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (_) => toggleTask(task),
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration:
                        task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTask(task.id!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}