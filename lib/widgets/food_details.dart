import 'package:flutter/material.dart'; 
import 'package:skibishop/models/food_entry.dart'; 

class FoodDetailsPage extends StatelessWidget {
  final FoodEntry foodEntry;
  const FoodDetailsPage({super.key, required this.foodEntry});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodEntry.fields.name), 
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context), 
          ),
        ], // Widget[]
      ), // AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodEntry.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text("Description: ${foodEntry.fields.description}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Price: ${foodEntry.fields.price}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}