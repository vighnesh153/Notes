import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 'Products' comes from the providers/products.dart
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider(
          create: (_) => loadedProducts[index],
          child: ProductItem(), // Data can be accessed by the state
        );
      },
      itemCount: loadedProducts.length,
    );
  }
}