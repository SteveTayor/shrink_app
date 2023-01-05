import 'package:flutter/material.dart';

import '../widgets/recipe_card.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const RecipeCard(
            title: 'My Recipe',
            rating: '5.35',
            cookTime: '50 mins',
            thumbnailUrl:
                'assets/images/travel-concept-close-up-portrait-young-beautiful-attractive-redhair-girl-wtih-t.png',
          );
        },
      ),
    );
  }
}
