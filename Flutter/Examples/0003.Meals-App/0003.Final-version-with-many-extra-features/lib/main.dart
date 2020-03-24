import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'vegetarian': false,
    'vegan': false,
    'lactose-free': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where(
            (meal) {
          if (_filters['gluten-free'] && meal.isGlutenFree == false) {
            return false;
          }
          if (_filters['vegetarian'] && meal.isVegetarian == false) {
            return false;
          }
          if (_filters['vegan'] && meal.isVegan == false) {
            return false;
          }
          if (_filters['lactose-free'] && meal.isLactoseFree == false) {
            return false;
          }

          return true;
        },
      ).toList();
    });
  }

  void _toggleFavourites(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere(
          (meal) => meal.id == mealId,
    );

    if (existingIndex == -1) {
      // meal doesn't exists in favourite, so add
      setState(() {
        _favouriteMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId,));
      });
      return;
    }

    setState(() {
      _favouriteMeals.removeAt(existingIndex);
    });
  }

  bool _isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => mealId == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
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
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourites, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),

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
