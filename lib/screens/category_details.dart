import 'package:get/get.dart';
import 'package:liftu_tech_assignment/data/models/product_model.dart';

import '../consts/consts.dart';
import '../data/repositories/api_services_product.dart';
import '../widgets/bg_widget.dart';
import 'item_details.dart';


class CategoryDetails extends StatefulWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: widget.title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              20.heightBox,
              // Items Container
              Expanded(
                child: FutureBuilder<List<ProductModel>>(
                  future: getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading products'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No products available'),
                      );
                    } else {
                      List<ProductModel>? products = snapshot.data;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products?.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final product = products![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.images?[0] ?? 'fallback_image_url',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              product.title!.text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              '\$${product.price}'.text.color(redColor).fontFamily(bold).size(16).make()
                            ],
                          )
                              .box
                              .white
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .roundedSM
                              .outerShadowSm
                              .padding(const EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                            Get.to(() => ItemDetails(title: product.title! ,product: product));
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
