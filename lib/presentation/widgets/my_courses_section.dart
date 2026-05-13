import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/uispace.dart';

class MyCoursesSection extends StatelessWidget {
  const MyCoursesSection({super.key});

  final List<Map<String, String>> enrolledCourses = const [
    {
      "title": "Flutter Development Bootcamp",
      "category": "Programming",
      "price": "₹2999",
    },

    {
      "title": "Digital Marketing Masterclass",
      "category": "Marketing",
      "price": "₹1999",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "My Courses",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        UiSpace.vertical(12),
        ListView.separated(
          separatorBuilder: (_, __) => UiSpace.vertical(12),
          itemCount: enrolledCourses.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final course = enrolledCourses[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course["title"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  UiSpace.vertical(4),
                  Text(
                    course["category"]!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  UiSpace.vertical(8),
                  Text(
                    course["price"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
