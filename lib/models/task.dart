class Task {
  final String title;
  final String description;
  final String priority; // "High", "Medium", "Normal"
  final int hours; // Number of hours dedicated to the task

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.hours,
  });
}
