import 'package:flutter/material.dart';
import 'package:skibishop/screens/foodentry_form.dart';
import 'package:skibishop/screens/list_foodentry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:skibishop/screens/login.dart';

class ItemHomepage {
    final String name;
    final IconData icon;

    ItemHomepage(this.name, this.icon);
}


class ItemCard extends StatelessWidget {
  // Display the card with an icon and name.

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    // Set color based on the item name
    Color backgroundColor;
    if (item.name == "View Product List") {
      backgroundColor = Colors.teal;
    } else if (item.name == "Add Food") {
      backgroundColor = Colors.lightGreen;
    } else if (item.name == "Logout") {
      backgroundColor = Colors.orange;
    } else {
      backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    final request = context.watch<CookieRequest>();
    return Material(
      color: backgroundColor, // Apply the background color
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        onTap: () async {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
          if (item.name == "Add Food") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FoodEntryFormPage(),
              ),
            );
          }
          else if (item.name == "View Product List") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FoodEntryPage()
                ),
            );
          }
          else if (item.name == "Logout") {
              final response = await request.logout(
                  // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                  "http://127.0.0.1:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Goodbye, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

