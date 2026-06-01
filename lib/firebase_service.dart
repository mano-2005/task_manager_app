import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_model.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collection = "tasks";

  // ADD TASK
  static Future<void> addTask(Task task) async {
    await _db.collection(collection).add(task.toJson());
  }

  // DELETE TASK
  static Future<void> deleteTask(String id) async {
    await _db.collection(collection).doc(id).delete();
  }

  // UPDATE TASK
  static Future<void> updateTask(String id, bool isDone) async {
    await _db.collection(collection).doc(id).update({
      "isDone": isDone,
    });
  }

  // GET STREAM (REALTIME)
  static Stream<QuerySnapshot> getTasks() {
    return _db.collection(collection).snapshots();
  }
}