import 'package:flutter/material.dart';
import '../models/course_model.dart';

class HomeProvider extends ChangeNotifier {
  List<CourseCategory> _categories = [];
  List<Course> _allCourses = []; // Master list
  List<Course> _filteredCourses = []; // List shown to UI
  List<Course> _featuredCourses = [];

  String _searchQuery = '';
  String _selectedCategoryTitle = 'All';

  List<CourseCategory> get categories => [
        CourseCategory(id: '0', title: 'All', iconType: 'code'), // Add "All" option
        ..._categories
      ];
  List<Course> get allCourses => _filteredCourses;
  List<Course> get featuredCourses => _featuredCourses;

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategoryTitle;

  HomeProvider() {
    _loadDummyData();
  }

  void filterCourses({String? query, String? categoryTitle}) {
    if (query != null) {
      _searchQuery = query.toLowerCase();
    }
    if (categoryTitle != null) {
      _selectedCategoryTitle = categoryTitle;
    }

    _filteredCourses = _allCourses.where((course) {
      final matchesSearch = course.title.toLowerCase().contains(_searchQuery) ||
          course.categoryTitle.toLowerCase().contains(_searchQuery);

      final matchesCategory = _selectedCategoryTitle == 'All' ||
          course.categoryTitle == _selectedCategoryTitle;

      return matchesSearch && matchesCategory;
    }).toList();

    notifyListeners();
  }

  void _loadDummyData() {
    _categories = [
      CourseCategory(id: '1', title: 'Programming', iconType: 'code'),
      CourseCategory(id: '2', title: 'Design', iconType: 'design'),
      CourseCategory(id: '3', title: 'Business', iconType: 'business'),
      CourseCategory(id: '4', title: 'Marketing', iconType: 'business'),
      CourseCategory(id: '5', title: 'Photography', iconType: 'design'),
    ];

    _allCourses = [
      Course(
        id: '1',
        title: 'Complete Web Development Bootcamp',
        categoryTitle: 'Programming',
        price: 2999,
      ),
      Course(
        id: '2',
        title: 'Digital Marketing Masterclass',
        categoryTitle: 'Marketing',
        price: 1999,
      ),
      Course(
        id: '3',
        title: 'UI/UX Design for Beginners',
        categoryTitle: 'Design',
        price: 1499,
      ),
      Course(
        id: '4',
        title: 'Data Analytics 101',
        categoryTitle: 'Data',
        price: 2499,
      ),
      Course(
        id: '5',
        title: 'Advanced Flutter Apps',
        categoryTitle: 'Programming',
        price: 3999,
      ),
      Course(
        id: '6',
        title: 'Financial Analysis',
        categoryTitle: 'Business',
        price: 1599,
      ),
    ];

    _featuredCourses = [
      Course(
        id: 'f1',
        title: 'Mastering AI in 2024',
        categoryTitle: 'AI & ML',
        price: 4999,
        isFeatured: true,
        studentsCount: "2,400+",
      ),
      Course(
        id: 'f2',
        title: 'Full Stack Development',
        categoryTitle: 'Programming',
        price: 3499,
        isNew: true,
        studentsCount: "1,200+",
      ),
      Course(
        id: 'f3',
        title: 'Product Management UI',
        categoryTitle: 'Business',
        price: 2999,
        isFeatured: true,
        studentsCount: "800+",
      ),
    ];

    _filteredCourses = List.from(_allCourses);

    notifyListeners();
  }
}
