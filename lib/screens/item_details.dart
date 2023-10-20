import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/consts/consts.dart';
import 'package:liftu_tech_assignment/consts/lists.dart';
import 'package:liftu_tech_assignment/data/models/product_model.dart';
import 'package:liftu_tech_assignment/widgets/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  final ProductModel product;

  const ItemDetails({
    Key? key,
    required this.title,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: darkFontGrey,
            fontFamily: bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Swiper section
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: product.images?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Image.network(
                          product.images?[index] ?? 'fallback_image_url',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    // title and details section
                    Text(
                      product.title ?? 'Product Title',
                      style: const TextStyle(
                        fontSize: 18,
                        color: darkFontGrey,
                        fontFamily: semibold,
                      ),
                    ),
                    10.heightBox,
                    // rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    Text(
                      '\$${product.price ?? 0}',
                      style: const TextStyle(
                        color: redColor,
                        fontFamily: bold,
                        fontSize: 18,
                      ),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Seller',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: semibold,
                                ),
                              ),
                              5.heightBox,
                              Text(
                                product.category?.name ?? 'Category Name',
                                style: const TextStyle(
                                  color: darkFontGrey,
                                  fontFamily: semibold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    // color section
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                'Color: ',
                                style: TextStyle(color: textfieldGrey),
                              ),
                            ),
                            Row(
                              children: product.images?.map((image) {
                                return VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                                    .make();
                              }).toList() ??
                                  [],
                            ),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.all(8))
                            .make(),
                        // Quantity section
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                'Quantity: ',
                                style: TextStyle(color: textfieldGrey),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: darkFontGrey,
                                    fontFamily: bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                10.widthBox,
                                const Text(
                                  '(0 available)',
                                  style: TextStyle(color: textfieldGrey),
                                ),
                              ],
                            ),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.all(8))
                            .make(),
                        // total row
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                'Total: ',
                                style: TextStyle(color: textfieldGrey),
                              ),
                            ),
                            Text(
                              '\$${product.price ?? 0}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: redColor,
                                fontFamily: bold,
                              ),
                            ),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.all(8))
                            .make(),
                      ],
                    )
                        .box
                        .white
                        .shadowSm
                        .make(),
                    10.heightBox,
                    // description section
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: darkFontGrey,
                        fontFamily: semibold,
                      ),
                    ),
                    10.heightBox,
                    Text(
                      product.description ?? 'Product Description',
                      style: const TextStyle(
                        color: darkFontGrey,
                      ),
                    ),
                    10.heightBox,
                    // Buttons section
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailsButtonList.length,
                            (index) => ListTile(
                          title: Text(
                            itemDetailsButtonList[index],
                            style: const TextStyle(
                              fontFamily: semibold,
                              color: darkFontGrey,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    20.heightBox,
                    // Products you may like section
                    const Text(
                      'Products you may like',
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 16,
                        color: darkFontGrey,
                      ),
                    ),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP1,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              const Text(
                                'Laptop 8GB/512GB',
                                style: TextStyle(
                                  fontFamily: semibold,
                                  color: darkFontGrey,
                                ),
                              ),
                              10.heightBox,
                              const Text(
                                '\$600',
                                style: TextStyle(
                                  color: redColor,
                                  fontFamily: bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make();
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: 'Add to cart',
            ),
          ),
        ],
      ),
    );
  }
}
