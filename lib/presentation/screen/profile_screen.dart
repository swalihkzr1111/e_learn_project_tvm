import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/uispace.dart';
import '../widgets/my_courses_section.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(),
              UiSpace.vertical(18),
              const MyCoursesSection(),
              UiSpace.vertical(18),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: _logoutButton(),
              ),
            ],
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
      title: Text(
        "Profile",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 48.h,

      child: OutlinedButton.icon(
        onPressed: () {},

        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),

        icon: Icon(Icons.logout, color: Colors.red, size: 20.sp),

        label: Text(
          "Logout",
          style: TextStyle(
            color: Colors.red,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
