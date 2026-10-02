class TaskModel {
  final String id;
  final String title;
  final String category;
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    this.isCompleted = false,
  });
}