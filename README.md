<details>
<Summary><b>ASSIGNMENT 7</b></summary>

## Explain what are stateless widgets and stateful widgets, and explain the difference between them.
Stateless widgets and stateful widgets are two types of widgets used to build user interfaces. Stateless widgets, such as Text or Icon, are immutable and display content that doesn’t change over time. They are useful for static UI elements that don’t respond to user interactions or updates, as they lack any internal state. In contrast, stateful widgets, like Checkbox or TextField, maintain a State object that holds mutable data, allowing the widget to rebuild and update its appearance in response to interactions or data changes. Stateful widgets use the setState() method to trigger UI updates, making them ideal for dynamic content that reacts to user input or ongoing events.

## Mention the widgets that you have used for this project and its uses.
The MaterialApp widget serves as the root of the application, providing material design and theming. The Scaffold widget creates the basic layout, including an AppBar for the title and a body section for content. Within the body, a Column widget arranges items vertically, while a GridView.count organizes menu items in a responsive grid format. Each menu item is represented by an ItemCard that includes an Icon and Text, with InkWell making the cards interactive, and SnackBar providing feedback to users when they tap on the cards.

## What is the use-case for setState()? Explain the variable that can be affected by setState().
setState() is used in stateful widgets to refresh the screen when a variable in the widget changes. For example, if you have a counter starting at 0 that increases each time a button is pressed, calling setState(() { counter++; }) lets Flutter know to rebuild just that part of the screen and display the new counter value. This function is essential for making interactive elements, like changing colors, showing or hiding items, or updating lists in response to user actions. By calling setState(), you can ensure the app reflects these updates immediately without needing to rebuild the entire screen.

## Explain the difference between const and final keyword.
Const and final are used to declare variables that won’t change, but they have different uses. The final keyword means the variable can only be set once and after it’s assigned, its value can’t change, but it is assigned at runtime when the code runs. For example, you can have a final variable called myName that is set to "Alice" once, and it stays that way. On the other hand, const is stricter because it is used for values that are determined and fixed at compile-time before the code runs, so const variables are deeply immutable. For instance, you can have a const variable called pi that is set to the number 3.14159, which means pi is established as that exact number forever and is known before the code even runs. You can use const when the value is truly unchanging and should always stay the same across your app, while final is used for values that may be computed or decided during runtime but still don’t change afterward.

## Explain how you implemented the checklist above step-by-step.
- Install dart and flutter extension in VS Code
- Create a new directory named SKIBISHOP
- Create a new flutter project with the name skibishop then enter the project directory
    ```
    flutter create skibishop
    cd skibishop
    ```
- Create a new file named menu.dart in the skibishop/lib directory. On the first line of the file, add the following code:
    ```
    import 'package:flutter/material.dart';
    ```
- From the main.dart file, cut the lines from line 39 to the end that contains the two classes below:
    ```
    class MyHomePage ... {
    ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
    to the file menu.dart that you just created.

- You will see that in the main.dart file, there will be an error on line 34. Add the following code at the beginning of the file.
    ```
    import 'package:skibishop/menu.dart';
    ```

- Building the MyApp Class
    - Inside main.dart, I created the MyApp class as a StatelessWidget. This is where I set up the app’s title and theme using MaterialApp. I chose a nice color scheme with ColorScheme.fromSwatch() to give my app a polished look. Finally, I set the home property to MyHomePage, which is the main screen users will see when they open the app.

- Building the MyHomePage Class
    - In menu.dart, I defined the MyHomePage class as a StatelessWidget. I started by declaring some constants for user information,like NPM, name, and class. I also created a list of ItemHomepage objects to represent the menu items, such as “View Product List,” “Add Product,” and “Logout.”
    - Next, I wrote the build method for MyHomePage. I used a Scaffold widget to create the main structure of the app, including an AppBar for the title and a body section for the content. I made sure to set a nice title and background color for the AppBar.

- Building the User Info Row
    - For the body layout, I added some padding for spacing and used a Column widget to arrange everything vertically. I included a Row widget to display the user information side by side, creating three InfoCard widgets to show details like NPM, name, and class.
    - Next, I defined the InfoCard class as a StatelessWidget. This part was fun because I created a visually appealing card for each piece of user info using the Card widget. Inside each card, I set up a Column to neatly display the title and content.

- Creating the ItemHomepage Class
    - Then, I created the ItemHomepage class, which is quite simple. It holds the name and icon for each menu item, making it easy to manage them later.
    - I added some flair by changing the background color of each card based on its name. I also used the InkWell widget to make the cards interactive. When a user taps on a card, a SnackBar pops up to give feedback, confirming which action they’ve taken.

- The final code should look like this
    ```
    main.dart

    import 'package:flutter/material.dart';
    import 'package:skibishop/menu.dart';


    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'SKIBISHOP',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
    ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: MyHomePage(),
        );
    }
    }
    ```
    ```
    menu.dart
    import 'package:flutter/material.dart';

    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
        final String npm = '2306256236'; // NPM
        final String name = 'Anindiyo Banu Prabasworo'; // Name
        final String className = 'PBP KKI'; // Class
        final List<ItemHomepage> items = [
        ItemHomepage("View Product List", Icons.list),
        ItemHomepage("Add Product", Icons.add),
        ItemHomepage("Logout", Icons.logout),
        ];
    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".


    @override
    @override
    Widget build(BuildContext context) {
        // Scaffold provides the basic structure of the page with the AppBar and body.
        return Scaffold(
        // AppBar is the top part of the page that displays the title.
        appBar: AppBar(
            title: const Text(
            'SKIBISHOP',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
            ),
            // The background color of the AppBar is obtained from the application theme color scheme.
            backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        // Body of the page with paddings around it.
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            // Place the widget vertically in a column.
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                // Row to display 3 InfoCard horizontally.
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: name),
                    InfoCard(title: 'Class', content: className),
                ],
                ),

                // Give a vertical space of 16 units.
                const SizedBox(height: 16.0),

                // Place the following widget in the center of the page.
                Center(
                child: Column(
                    // Place the text and grid item vertically.

                    children: [
                    // Display the welcome message with bold font and size 18.
                    const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                        'Welcome to SKIBISHOP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                        ),
                        ),
                    ),

                    // Grid to display ItemCard in a 3 column grid.
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // To ensure that the grid fits its height.
                        shrinkWrap: true,

                        // Display ItemCard for each item in the items list.
                        children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }


    class InfoCard extends StatelessWidget {
    // Card information that displays the title and content.

    final String title;  // Card title.
    final String content;  // Card content.

    const InfoCard({super.key, required this.title, required this.content});

    @override
    Widget build(BuildContext context) {
        return Card(
        // Create a card box with a shadow.
        elevation: 2.0,
        child: Container(
            // Set the size and spacing within the card.
            width: MediaQuery.of(context).size.width / 3.5, // Adjust with the width of the device used.
            padding: const EdgeInsets.all(16.0),
            // Place the title and content vertically.
            child: Column(
            children: [
                Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
            ],
            ),
        ),
        );
    }
    }


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
        } else if (item.name == "Add Product") {
        backgroundColor = Colors.lightGreen;
        } else if (item.name == "Logout") {
        backgroundColor = Colors.orange;
        } else {
        backgroundColor = Theme.of(context).colorScheme.secondary;
        }

        return Material(
        color: backgroundColor, // Apply the background color
        borderRadius: BorderRadius.circular(12),
        
        child: InkWell(
            onTap: () {
            // Display the SnackBar message when the card is pressed.
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                SnackBar(content: Text("You have pressed the ${item.name} button!"))
                );
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
    ```
</details>

<details>
<Summary><b>ASSIGNMENT 8</b></summary>

## What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?

Const is used to mark widgets or values as unchanging, meaning they’re created once and can’t be modified. Using const improves performance by preventing Flutter from rebuilding widgets that stay the same, which helps the app run faster and saves memory by reusing these constant widgets. We use const for widgets that don’t change, like static text, icons, or decorations, because it optimizes the code’s efficiency. However, avoid using const if the widget needs to display dynamic content or update based on user actions, as it would restrict necessary changes.

## Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!

Column and Row are used to arrange widgets in different directions: Column stacks them vertically, while Row lines them up horizontally. Both widgets have alignment options; mainAxisAlignment positions widgets along the main direction (up and down in Column, left to right in Row), and crossAxisAlignment positions them across the main direction (side-to-side in Column, top to bottom in Row). For example, using mainAxisAlignment.center and crossAxisAlignment.center in a Column centers text or icons both vertically and horizontally, while in a Row, mainAxisAlignment.spaceBetween spreads widgets evenly across the screen for a neat, side-by-side layout.


## List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!

Input elements used: 
- TextFormField: used for food, description, and price field

Input elements not used:
- DropdownButton and DropdownButtonFormField:

    Allow users to select a single option from a dropdown list. DropdownButtonFormField integrates easily with forms, providing built-in validation.
- Checkbox:

    A simple checkable box, often used for yes/no or agree/disagree options. Used within lists or forms where multiple items may need individual confirmation
- Radio:

    A circular button for selecting one option out of a set of mutually exclusive options. Typically used for choices like gender or specific categories.
- Switch:

    A toggle switch for binary choices, such as enabling/disabling notifications or toggling settings. Displays as a sliding switch for simple on/off input.
- Slider:

    Allows users to select a value within a range by sliding. Often used for selecting numeric values like volume, brightness, or quantity.
- DatePicker and TimePicker:

    DatePicker shows a calendar for selecting dates, while TimePicker shows a clock for selecting times. Useful for scheduling or setting deadlines.
- Stepper:

    A control that allows users to incrementally increase or decrease a value by tapping "+" or "-". Useful for number-based fields like selecting a quantity or rating.

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?

Yes, I implemented a theme in your application. Here’s how the theme is set up:
- Primary Color: The app uses Colors.deepPurple as the primary color, which is applied to the AppBar and other elements like buttons.
- Secondary Color: A custom secondary color is set using Colors.deepPurple[400] for consistency.

## How do you manage navigation in a multi-page Flutter application?

For simple navigation between pages, you can use Navigator.push to go to a new page and Navigator.pop to return, which is effective for linear navigation flows.


</details>