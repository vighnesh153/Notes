import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Don't listen to updates because title, imageUrl
    // won't change. Only the isFavourite boolean will
    // change.
    final product = Provider.of<Product>(context, listen: false);

    // Now here, only the widget which is wrapped in
    // 'Consumer' will re-build on changes, in this case,
    // the favouriteIcon
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            // If we have a widget that doesn't need to
            // be re-built in the consumer's builder,
            // then we pass it as a value to 'child'
            // property besides 'builder', and then
            // in the builder's value, the function's
            // 3rd parameter will be that child property
            // which can be used to build the widget
            builder: (ctx, product, child) {
              return IconButton(
                icon: Icon(product.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavouriteStatus();
                },
                color: Theme.of(context).accentColor,
              );
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
