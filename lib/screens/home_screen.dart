import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../models/course_model.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: (screenHeight * 0.025)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: (screenHeight * 0.012)),
              _buildSearchBar(),
              SizedBox(height: (screenHeight * 0.025)),
              _buildFeaturedSection(),
              SizedBox(height: (screenHeight * 0.030)),
              _buildCategoriesSection(),
              SizedBox(height: (screenHeight * 0.030)),
              _buildAllCoursesSection(),
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
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all((screenWidth * 0.016)),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.school,
              color: Colors.white,
              size: (screenWidth * 0.053),
            ),
          ),
          SizedBox(width: (screenWidth * 0.021)),
          Text(
            'LearnHub',
            style: TextStyle(
              color: Colors.black,
              fontSize: (screenWidth * 0.053),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.bell, color: Colors.black87),
              onPressed: () {},
            ),
            Positioned(
              right: (screenWidth * 0.032),
              top: (screenHeight * 0.015),
              child: Container(
                width: (screenWidth * 0.021),
                height: (screenHeight * 0.010),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            CupertinoIcons.ellipsis_vertical,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        SizedBox(width: (screenWidth * 0.021)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.053)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: (screenWidth * 0.043),
          vertical: (screenHeight * 0.002),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          onChanged: (value) {
            Provider.of<HomeProvider>(
              context,
              listen: false,
            ).filterCourses(query: value);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Here...',
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: (screenWidth * 0.037),
            ),
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.grey[500],
              size: (screenWidth * 0.053),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    final homeProvider = Provider.of<HomeProvider>(context);
    final featuredList = homeProvider.featuredCourses;

    if (featuredList.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: (screenHeight * 0.222),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.053)),
        itemCount: featuredList.length,
        itemBuilder: (context, index) {
          final course = featuredList[index];
          return Container(
            width: (screenWidth * 0.800),
            margin: EdgeInsets.only(right: (screenWidth * 0.043)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.all((screenWidth * 0.053)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (course.isFeatured || course.isNew)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth * 0.021),
                      vertical: (screenHeight * 0.005),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      course.isNew ? 'NEW' : 'FEATURED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (screenWidth * 0.027),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const Spacer(),
                Text(
                  course.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (screenWidth * 0.048),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: (screenHeight * 0.010)),
                Text(
                  'Join ${course.studentsCount} students today',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: (screenWidth * 0.032),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final homeProvider = Provider.of<HomeProvider>(context);
    final categories = homeProvider.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.053)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: (screenWidth * 0.048),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: (screenWidth * 0.037),
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: (screenHeight * 0.020)),
        SizedBox(
          height: (screenHeight * 0.049),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.053)),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected =
                  category.title == homeProvider.selectedCategory;

              IconData iconData = Icons.category;
              if (category.iconType == 'code') iconData = Icons.code;
              if (category.iconType == 'design') {
                iconData = Icons.palette_outlined;
              }
              if (category.iconType == 'business') {
                iconData = Icons.business_center_outlined;
              }

              return GestureDetector(
                onTap: () {
                  homeProvider.filterCourses(categoryTitle: category.title);
                },
                child: Container(
                  margin: EdgeInsets.only(right: (screenWidth * 0.032)),
                  padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth * 0.043),
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        iconData,
                        size: (screenWidth * 0.043),
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                      SizedBox(width: (screenWidth * 0.021)),
                      Text(
                        category.title,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: (screenWidth * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllCoursesSection() {
    final homeProvider = Provider.of<HomeProvider>(context);
    final courses = homeProvider.allCourses;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.053)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Courses',
            style: TextStyle(
              fontSize: (screenWidth * 0.048),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: (screenHeight * 0.020)),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: (screenWidth * 0.043),
              mainAxisSpacing: (screenHeight * 0.020),
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final course = courses[index];
              return _buildCourseCard(course, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Course course, int index) {
    final gradients = [
      const [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
      const [Color(0xFFfd746c), Color(0xFFff9068)],
      const [Color(0xFF2193b0), Color(0xFF6dd5ed)],
      const [Color(0xFF11998e), Color(0xFF38ef7d)],
    ];
    final gradient = gradients[index % gradients.length];

    return Container(
      height: (screenHeight * 0.2),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: (screenHeight * 0.15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SizedBox(height: (screenHeight * 0.010)),
          Text(
            course.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (screenWidth * 0.035),
              color: Colors.black87,
            ),
          ),
          SizedBox(height: (screenHeight * 0.005)),
          Text(
            course.categoryTitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: (screenWidth * 0.029),
            ),
          ),
          SizedBox(height: (screenHeight * 0.005)),
          Text(
            '₹${course.price.toInt()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (screenWidth * 0.037),
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
