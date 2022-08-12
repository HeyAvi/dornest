import 'package:dornest/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/ColorConstants.dart';
import '../Panels/SinglePanel.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SubCategoriesScreen(categoryId: categoryModel.id),
          ),
        );
      },
      child: Padding(
          padding:
              EdgeInsets.only(left: 0.w, top: 10.h, bottom: 0.h, right: 0.h),
          child: Container(
              height: 115.h,
              width: MediaQuery.of(context).size.width.w,
              padding: EdgeInsets.all(0.h),
              decoration: BoxDecoration(
                color: ColorConstants.colorGrey,
                borderRadius: BorderRadius.circular(5.h),
                image: DecorationImage(
                  image: categoryModel.image.isNotEmpty
                      ? NetworkImage(categoryModel.image)
                      : const AssetImage("assets/images/singlepannel.png")
                          as ImageProvider,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      SizedBox(
                        height: 110.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(flex: 1, child: Text("")),
                            Text(
                              categoryModel.category,
                              style: TextStyle(
                                  color: ColorConstants.colortextColor,
                                  fontFamily: 'RoMedium',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Expanded(flex: 1, child: Text("")),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
