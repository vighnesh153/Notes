import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
//      home: CategoriesScreen(),
      initialRoute: '/',
      // default is '/'
      routes: {
        // Default route for 'home' property above. We can use
        // either of the 2
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()

        // it is common to mis-spell the route. So,
        // common practice is to have a static const field
        // on the class and use that instead
      },
      // onGenerateRoute function is triggered when no route
      // registered in the routes table matches the route,
      // we are headed to. But it should be used for dynamically
      // generated routes.
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // route name
        switch (settings.name) {
          // handle dynamically generated routes
        }
        return null;
      },
      // this function is similar to onGenerateRoute, but it
      // is triggered when no route matches, onGenerateRoute
      // doesn't takes care of possibly dynamically generated route.
      // This is the last resort, flutter takes into consideration,
      // before throwing an error. If this function is not defined
      // or doesn't handle the route, then error is thrown.
      // It acts like not-found component I create in Angular.
      onUnknownRoute: (settings) {
        // Home page as a default fallback
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
