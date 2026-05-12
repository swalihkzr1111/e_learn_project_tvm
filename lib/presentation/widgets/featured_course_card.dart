import 'package:e_learn/core/widgets/uispace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/course_model.dart';

class FeaturedCourseCard extends StatelessWidget {
  final CourseModel course;

  const FeaturedCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          if (course.isFeatured || course.isNew)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                course.isFeatured ? 'Featured' : 'New',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          UiSpace.vertical(8),
          Text(
            course.title,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          UiSpace.vertical(6),
          Text(
            '${course.studentsCount} students enrolled today',
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
