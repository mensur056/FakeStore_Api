import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/product/padding/page_padding.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});
  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
        child: ListTile(
          title: Image.network(model?.image ?? ''),
          subtitle: Text(model?.description ?? ''),
        ),
      ),
    );
  }
}
