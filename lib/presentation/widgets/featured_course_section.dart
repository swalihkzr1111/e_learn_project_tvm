import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/mock/mock_course_data.dart';
import 'featured_course_card.dart';

class FeaturedCourseSection extends StatelessWidget {
  const FeaturedCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: mockCourses.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final course = mockCourses[index];

          return FeaturedCourseCard(course: course);
        },
      ),
    );
  }
}
