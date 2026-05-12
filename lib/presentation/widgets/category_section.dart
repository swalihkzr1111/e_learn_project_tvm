import 'package:e_learn/core/widgets/uispace.dart';
import 'package:e_learn/data/mock/mock_category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/home_providers.dart';
import 'category_chip.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        UiSpace.vertical(6),
        SizedBox(
          height: 30.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: mockCategories.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final category = mockCategories[index];

              return CategoryChip(
                category: category,
                isSelected: provider.selectedCategoryIndex == index,

                onTap: () {
                  provider.selectCategory(index, category.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
