import 'package:e_learn/core/widgets/uispace.dart';
import 'package:e_learn/presentation/widgets/course_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/category_section.dart';
import '../widgets/featured_course_section.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UiSpace.vertical(14),
                _buildSearchBar(),
                UiSpace.vertical(14),
                const FeaturedCourseSection(),
                UiSpace.vertical(18),
                const CategorySection(),
                UiSpace.vertical(18),
                CourseSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.school, color: Colors.white, size: 20.sp),
          ),
          UiSpace.horizontal(6.w),
          Text(
            'LearnHub',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.bell,
                color: Colors.black87,
                size: 22.sp,
              ),
              onPressed: () {},
            ),
            Positioned(
              right: 14.w,
              top: 9.h,
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.ellipsis_vertical,
            color: Colors.black87,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        UiSpace.horizontal(6.w),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Here...',
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.grey[500],
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
