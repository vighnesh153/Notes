import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import './add_place_screen.dart';
import './place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPlaceScreen.routeName,
              );
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, dataSnapshot) => dataSnapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                builder: (ctx, greatPlaces, child) =>
                    greatPlaces.items.length == 0
                        ? child
                        : ListView.builder(
                            itemBuilder: (listViewCtx, index) {
                              final place = greatPlaces.items[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(place.image),
                                ),
                                title: Text(place.title),
                                subtitle: Text(place.location.address),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    PlaceDetailScreen.routeName,
                                    arguments: place.id,
                                  );
                                },
                              );
                            },
                            itemCount: greatPlaces.items.length,
                          ),
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
              ),
      ),
    );
  }
}
