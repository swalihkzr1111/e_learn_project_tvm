import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final int index;

  const CourseCard({super.key, required this.course, required this.index});

  @override
  Widget build(BuildContext context) {
    final gradients = [
      const [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
      const [Color(0xFFfd746c), Color(0xFFff9068)],
      const [Color(0xFF2193b0), Color(0xFF6dd5ed)],
      const [Color(0xFF11998e), Color(0xFF38ef7d)],
    ];

    final gradient = gradients[index % gradients.length];

    return Container(
      padding: EdgeInsets.all(08.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),

              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          SizedBox(
            height: 38.h,
            child: Text(
              course.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black87,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            course.category,

            style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
          ),

          SizedBox(height: 4.h),

          Text(
            '₹${course.price.toInt()}',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
