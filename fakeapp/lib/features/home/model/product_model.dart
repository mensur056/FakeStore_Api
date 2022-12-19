import "package:json_annotation/json_annotation.dart";
import 'package:vexana/vexana.dart';

part "product_model.g.dart";

@JsonSerializable()
class ProductModel extends INetworkModel<ProductModel> {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ProductModelToJson(this);
  }
}

@JsonSerializable()
class Rating {
  final double? rate;
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }
}
