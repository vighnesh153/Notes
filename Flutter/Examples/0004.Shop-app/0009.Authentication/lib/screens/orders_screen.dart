import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // We don't use the following now, because, we are using the following in
    // FutureBuilder and if the following changes, the FutureBuilder will be
    // re-created and the orders will be updated and the following will cause
    // to re-build because of update in orders and hence, we will get stuck in an
    // infinite loop. So, we used a 'Consumer' instead.
    // final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataReturnedByFuture) {
          if (dataReturnedByFuture.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (dataReturnedByFuture.error != null) {
            // Do error handling
            return Center(
              child: Text('An error occurred!'),
            );
          }
          return Consumer<Orders>(
            builder: (consumerContext, orderData, child) => ListView.builder(
              itemBuilder: (ctx, index) => OrderItem(
                orderData.orders[index],
              ),
              itemCount: orderData.orders.length,
            ),
          );
        },
      ),
    );
  }
}
