import 'package:e_learn/core/widgets/uispace.dart';
import 'package:e_learn/data/mock/mock_course_data.dart';
import 'package:e_learn/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/home_providers.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${provider.selectedCategory} Courses",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          UiSpace.vertical(10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.filteredCourses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              final course = provider.filteredCourses[index];
              return CourseCard(course: course, index: index);
            },
          ),
        ],
      ),
    );
  }
}
