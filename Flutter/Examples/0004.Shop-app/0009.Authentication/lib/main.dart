import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),

        // The following depends on the Auth Provider.
        // When creating for the first time, we initialize
        // the Products with some data.
        // Then, when Auth is updates, the following is
        // also updated because the following depends on
        // Auth. And as its will be updated, in-order to not
        // lose the previous data, we get the previous data
        // (items) in this case, and use it while re-creating the
        // Products provider instance.
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(null, null, []) ,
          update: (ctx, authData, previousProductsData) =>
              Products(authData.token, authData.userId, previousProductsData.items),
        ),

        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, []) ,
          update: (ctx, authData, previousOrdersData) =>
              Orders(authData.token, previousOrdersData.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (consumerAuthContext, authData, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: authData.isLoggedIn ? ProductsOverviewScreen() : AuthScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          );
        },
      ),
    );
  }
}
