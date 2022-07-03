import 'package:coding_app/model/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var product = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    var productData = <Product>[
      Product(id: 1, price: 30, productDescription: 'some description about product', productName: 'Mouse'),
      Product(id: 2, price: 40, productDescription: 'some description about product', productName: 'Keyboard'),
      Product(id: 3, price: 620, productDescription: 'some description about product', productName: 'Monitor'),
      Product(id: 4, price: 80, productDescription: 'some description about product', productName: 'Ram'),
      Product(id: 5, price: 120.5, productDescription: 'some description about product', productName: 'Speaker'),
    ];
    product.assignAll(productData);
  }
}