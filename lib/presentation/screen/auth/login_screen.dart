import 'package:e_learn/core/widgets/uispace.dart';
import 'package:e_learn/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiSpace.vertical(30),

              Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    UiSpace.vertical(8),

                    Text(
                      "Sign in to continue learning",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              UiSpace.vertical(40),

              Text(
                "Email Address",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),

              UiSpace.vertical(10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",

                  prefixIcon: Icon(Icons.mail_outline, size: 20.sp),

                  contentPadding: EdgeInsets.symmetric(vertical: 16.h),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),

              UiSpace.vertical(16),

              Text(
                "Password",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),

              UiSpace.vertical(10),

              TextField(
                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Enter your password",

                  prefixIcon: Icon(Icons.lock_outline, size: 20.sp),

                  contentPadding: EdgeInsets.symmetric(vertical: 16.h),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),

              UiSpace.vertical(08),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},

                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              UiSpace.vertical(18),

              SizedBox(
                width: double.infinity,
                height: 40.h,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),

                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              UiSpace.vertical(24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                  ),

                  TextButton(
                    onPressed: () {},

                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              UiSpace.vertical(20),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "or continue with",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ),

                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              UiSpace.vertical(24),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata,
                            size: 28.sp,
                            color: Colors.red,
                          ),

                          UiSpace.horizontal(6),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  UiSpace.horizontal(14),
                  Expanded(
                    child: Container(
                      height: 45.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook, size: 22.sp, color: Colors.blue),

                          UiSpace.horizontal(6),
                          Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
