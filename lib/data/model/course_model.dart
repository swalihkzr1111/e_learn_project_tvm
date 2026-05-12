class CourseModel {
  final String title;
  final String category;
  final double price;
  final int studentsCount;
  final bool isFeatured;
  final bool isNew;

  CourseModel({
    required this.title,
    required this.category,
    required this.price,
    required this.studentsCount,
    this.isFeatured = false,
    this.isNew = false,
  });
}
