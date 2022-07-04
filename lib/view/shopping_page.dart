import 'package:coding_app/controller/cart_controller.dart';
import 'package:coding_app/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return Scrollbar(
                  thumbVisibility: true,
                  thickness: 10,
                  radius: const Radius.circular(5),
                  child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.product[index].productName,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(controller
                                          .product[index].productDescription),
                                    ],
                                  ),
                                  Text(
                                    '\$ ${controller.product[index].price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.addToItem(controller.product[index]);
                                },
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount : \$ ${controller.totalPrice}',
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                );
              }
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              cartController.count.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          }
        ),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
