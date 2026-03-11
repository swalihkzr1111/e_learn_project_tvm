class CourseCategory {
  final String id;
  final String title;
  final String iconType;

  CourseCategory({
    required this.id,
    required this.title,
    required this.iconType,
  });
}

class Course {
  final String id;
  final String title;
  final String categoryTitle;
  final double price;
  final bool isFeatured;
  final bool isNew;
  final String studentsCount;

  Course({
    required this.id,
    required this.title,
    required this.categoryTitle,
    required this.price,
    this.isFeatured = false,
    this.isNew = false,
    this.studentsCount = "0",
  });
}
