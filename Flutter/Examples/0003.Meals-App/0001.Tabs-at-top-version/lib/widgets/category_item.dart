import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // Display is stack-of-screens based. The page which
    // is at the top of the stack, is displayed to the user.
    // So, we use the following way to push a widget on
    // top of the stack. This also automatically gives
    // a 'back' button on the AppBar to pop this widget
    // from the top of the stack.
//    Navigator.of(ctx).push(MaterialPageRoute(
//      builder: (_) => CategoryMealsScreen(
//        id,
//        title,
//      ),
//    ));

    // Using NamedRoutes. This need a route table in the
    // main.dart file as a property in material app
    // This is a bit complicated than the above approach, but
    // for big apps, this a better and more maintainable.
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // InkWell is similar to GestureDetector but
    // it fires a ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
