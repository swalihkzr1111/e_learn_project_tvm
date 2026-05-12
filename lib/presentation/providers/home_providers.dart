import 'package:flutter/material.dart';

import '../../data/mock/mock_course_data.dart';
import '../../data/model/course_model.dart';

class HomeProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;

  String selectedCategory = "All";

  List<CourseModel> get filteredCourses {
    if (selectedCategory == "All") {
      return mockCourses;
    }

    return mockCourses
        .where((course) => course.category == selectedCategory)
        .toList();
  }

  void selectCategory(int index, String category) {
    selectedCategoryIndex = index;
    selectedCategory = category;

    notifyListeners();
  }
}
