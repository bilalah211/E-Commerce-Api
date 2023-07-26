import 'package:get/get.dart';
import 'package:product_api/models/model.dart';
import 'package:product_api/repository/products%20repository/product_repository.dart';

import '../../data/response/status.dart';

class ProductsController extends GetxController {
  final _myRepo = ProductRepository();
  final productsList = <ProductModel>[].obs;
  final rxRequestStatus = Status.LOADING.obs;
  final error = Status.ERROR.obs;

  void RxsetRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  getProducts() {
    _myRepo.productsApi().then((value) {
      RxsetRequestStatus(Status.COMPLETED);
      productsList.addAll(value);
    }).onError((error, stackTrace) {
      RxsetRequestStatus(Status.ERROR);
    });
  }

  loadingProducts() {
    RxsetRequestStatus(Status.LOADING);
    _myRepo.productsApi().then((value) {
      RxsetRequestStatus(Status.COMPLETED);
      productsList.addAll(value);
    }).onError((error, stackTrace) {
      RxsetRequestStatus(Status.ERROR);
    });
  }
}
