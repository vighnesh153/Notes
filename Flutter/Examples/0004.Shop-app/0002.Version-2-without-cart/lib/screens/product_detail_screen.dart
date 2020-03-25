import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = (ModalRoute.of(context).settings.arguments as String);
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    // default for 'listen' is true and this widget will re-build if the
    // notifyListeners is called. But here, we only want to get the item
    // and not re-build if the notifyListeners is called. So, we set 'listen'
    // to false.

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
