import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travello/model/product.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  ProductData? productData;
  RxList<String> imageUrls = <String>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://dummyjson.com/products/category/smartphones')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        final List<dynamic>? imagesList = result['images'];

        if (imagesList != null) {
          imageUrls.assignAll(List<String>.from(imagesList));
        } else {
          print('Error: Key "images" not found or is null in API response.');
        }
        productData = ProductData.fromJson(result);
        print('vhc  $result');
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}