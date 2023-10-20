import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liftu_tech_assignment/data/repositories/api_services_category.dart';

import '../consts/consts.dart';
import '../consts/lists.dart';
import '../data/models/category_model.dart';
import '../widgets/bg_widget.dart';
import 'category_details.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Category>>(
          future: getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading categories'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No categories available'),
              );
            } else {
              List<Category>? categories = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories![index]; // Extract the category for better null safety
                    return Column(
                      children: [
                        Image.network(
                          category.image ?? 'fallback_image_url', // Use a fallback URL if image is null
                          height: 120,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        10.heightBox,
                        category.name!.text.color(darkFontGrey).align(TextAlign.center).make()
                      ],
                    ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                      Get.to(() => CategoryDetails(title: category.name));
                    });
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
