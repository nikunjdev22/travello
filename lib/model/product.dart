import 'package:travello/model/productModel.dart';

class ProductData {
  List<ProductsModel>? products;
  int? total;
  int? skip;
  int? limit;

  ProductData({this.products, this.total, this.skip, this.limit});

  ProductData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductsModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}