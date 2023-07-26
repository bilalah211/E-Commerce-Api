import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_api/data/response/status.dart';
import 'package:product_api/resources/components/general%20exception/general_exception.dart';
import 'package:product_api/resources/components/internetException/internet_exception.dart';
import 'package:product_api/view%20models/controllers/product_controller.dart';
import 'package:product_api/view/description/description.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ProductsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        centerTitle: true,
        title: Text('P R O D U C T S   L I S T',
            style: TextStyle(color: Colors.amber.shade800)),
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.ERROR:
            if (controller.error.value == 'No internet') {
              return InternetException(
                onPressed: () {
                  controller.loadingProducts();
                },
              );
            } else {
              return GeneralException(
                onPressed: () {
                  controller.loadingProducts();
                },
              );
            }
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: GridView.builder(
                  reverse: false,
                  shrinkWrap: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 5),
                  itemCount: controller.productsList.value.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          Get.to(DescriptionScreen(
                              id: controller.productsList.value[index].id,
                              title: controller.productsList.value[index].title,
                              price: controller.productsList.value[index].price,
                              description: controller
                                  .productsList.value[index].description,
                              category:
                                  controller.productsList.value[index].category,
                              image: controller.productsList.value[index].image,
                              rating:
                                  controller.productsList.value[index].rating));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Image.network(
                                  controller.productsList.value[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                controller.productsList.value[index].title
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.pink.shade50,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.amber.shade900,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_sharp,
                color: Colors.amber.shade900,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.amber.shade900,
              ),
              label: 'Cart')
        ],
      ),
    );
  }
}
