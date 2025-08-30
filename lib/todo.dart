
class Todo{
  final String id;
  final String name;
  final String dpt;
  final String title;
  final String status;
  final String description;

  final DateTime createdDate;

  Todo(
      {required this.id,
        required this.name,
        required this.dpt,
        required this.title,
        required this.description,
        required this.status,
        required this.createdDate,});

}