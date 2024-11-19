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

Yes, I implemented a theme in the application. Here’s how the theme is set up:
- Primary Color: The app uses Colors.deepPurple as the primary color, which is applied to the AppBar and other elements like buttons.
- Secondary Color: A custom secondary color is set using Colors.deepPurple[400] for consistency.

## How do you manage navigation in a multi-page Flutter application?

For simple navigation between pages, you can use Navigator.push to go to a new page and Navigator.pop to return, which is effective for linear navigation flows.

</details>

<details>
<Summary><b>ASSIGNMENT 9</b></summary>

## Explain why we need to create a model to retrieve or send JSON data. Will an error occur if we don't create a model first?
Creating models for handling JSON data in Django and Flutter/Dart is not just a best practice but a necessity for building robust, maintainable, and scalable applications. Models provide structure, enforce data integrity, facilitate seamless data exchange between the backend and frontend, and significantly reduce the likelihood of errors. Skipping the creation of models can lead to a fragile codebase, increased bugs, and a more challenging development process

## Explain the function of the http library that you implemented for this task.
The http library in Flutter/Dart facilitates communication with servers by handling HTTP requests and responses. It supports methods like GET (fetch data), POST (send data).

## Explain the function of CookieRequest and why it’s necessary to share the CookieRequest instance with all components in the Flutter app.
CookieRequest is essential for managing sessions, cookies, and stateful communication in a Flutter app. Sharing a single instance ensures consistent, secure, and seamless interaction with the backend while reducing complexity and avoiding duplicate sessions. It is critical for apps requiring authenticated user flows or personalized features.

## Explain the mechanism of data transmission, from input to display in Flutter.
When a user interacts with the Flutter app, such as by submitting a form or clicking a button, the app sends a network request (e.g., GET or POST) to the Django backend using the http or CookieRequest library. Django handles the request by retrieving or updating data and responds with a JSON response. Flutter then converts the JSON into Dart objects using a model for easier data handling. The processed data is displayed on the user interface through widgets like ListView or FutureBuilder.

## Explain the authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django’s completion of the authentication process and display of the menu in Flutter.
During registration, Flutter sends user data to Django, which validates it and creates an account. For login, Flutter submits credentials to Django, which verifies them and returns a session cookie or token for authentication. Flutter stores this securely and includes it in subsequent requests to access protected resources. Logout involves Flutter requesting Django to invalidate the session or token, after which Flutter clears stored credentials and redirects the user to the login screen. Django handles validation and session management, while Flutter ensures smooth user interaction.

## Explain how you implement the checklist above step by step! (not just following the tutorial)
- Setting up the authentication for the flutter project
    - In the django project create a new app called authentication.
    - Create a function for login, register and log out in the views.py.
        ```
        from django.contrib.auth import authenticate, login as auth_login
        from django.http import JsonResponse
        from django.views.decorators.csrf import csrf_exempt
        from django.contrib.auth.models import User
        import json
        from django.contrib.auth import logout as auth_logout


        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    # Successful login status.
                    return JsonResponse({
                        "username": user.username,
                        "status": True,
                        "message": "Login successful!"
                        # Add other data if you want to send data to Flutter.
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login failed, account disabled."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login failed, check email or password again."
                }, status=401)
            
        @csrf_exempt
        def register(request):
            if request.method == 'POST':
                data = json.loads(request.body)
                username = data['username']
                password1 = data['password1']
                password2 = data['password2']

                # Check if the passwords match
                if password1 != password2:
                    return JsonResponse({
                        "status": False,
                        "message": "Passwords do not match."
                    }, status=400)

                # Check if the username is already taken
                if User.objects.filter(username=username).exists():
                    return JsonResponse({
                        "status": False,
                        "message": "Username already exists."
                    }, status=400)

                # Create the new user
                user = User.objects.create_user(username=username, password=password1)
                user.save()

                return JsonResponse({
                    "username": user.username,
                    "status": 'success',
                    "message": "User created successfully!"
                }, status=200)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Invalid request method."
                }, status=400)
            
        @csrf_exempt
        def logout(request):
            username = request.user.username

            try:
                auth_logout(request)
                return JsonResponse({
                    "username": username,
                    "status": True,
                    "message": "Logged out successfully!"
                }, status=200)
            except:
                return JsonResponse({
                "status": False,
                "message": "Logout failed."
                }, status=401)
        ```
    - Add URL routing to the function created.
        ```
        from django.urls import path
        from authentication.views import login, register
        from authentication.views import logout

        app_name = 'authentication'

        urlpatterns = [
            path('login/', login, name='login'),
            path('register/', register, name='register'),
            path('logout/', logout, name='logout'),

        ]
        ```
    - Add path('auth/', include('authentication.urls')), in the skibishop/urls.py.

- Integrate Authentication System in Flutter
    - Install the package provided by the teaching assistant team by running the following commands in the Terminal.
        ```
        flutter pub add provider
        flutter pub add pbp_django_auth
        ```
    - Modify the root widget in the main.dart.
        ```
        class MyApp extends StatelessWidget {
        const MyApp({super.key});

        @override
        Widget build(BuildContext context) {
            return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Mental Health Tracker',
                theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.deepPurple,
                ).copyWith(secondary: Colors.deepPurple[400]),
                ),
                home: MyHomePage(),
            ),
            );
        }
        } 
        ```
    - Create a new file in the screens folder named login.dart and register.dart.
    - Add the following code to the login.dart file
        ```
        import 'package:skibishop/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:skibishop/screens/register.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        // TODO: Import RegisterPage later

        void main() {
        runApp(const LoginApp());
        }
        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
                ).copyWith(secondary: Colors.deepPurple[400]),
            ),
            home: const LoginPage(),
            );
        }
        }
        class LoginPage extends StatefulWidget {
        const LoginPage({super.key});
        @override
        State<LoginPage> createState() => _LoginPageState();
        }
        class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();
        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Center(
                child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        const Text(
                            'Login',
                            style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;
                // Check credentials
                // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
                // To connect the Android emulator to Django on localhost,
                // use the URL http://10.0.2.2/
                            final response = await request
                                .login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                            });
                            if (request.loggedIn) {
                                String message = response['message'];
                                String uname = response['username'];
                                if (context.mounted) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                );
                                ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("$message Welcome, $uname.")),
                                    );
                                }
                            } else {
                                if (context.mounted) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                    title: const Text('Login Failed'),
                                    content: Text(response['message']),
                                    actions: [
                                        TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                            Navigator.pop(context);
                                        },
                                        ),
                                    ],
                                    ),
                                );
                                }
                            }
                            },
                            style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text('Login'),
                        ),
                        const SizedBox(height: 36.0),
                        GestureDetector(
                            onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                            );
                            },
                            child: Text(
                            'Don\'t have an account? Register',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16.0,
                            ),
                            ),
                        ),
                        ],
                    ),
                    ),
                ),
                ),
            ),
            );
        }
        }

        ```
    - Add the following code to register.dart:
        ```
        import 'dart:convert';
        import 'package:flutter/material.dart';
        import 'package:skibishop/screens/login.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        class RegisterPage extends StatefulWidget {
        const RegisterPage({super.key});

        @override
        State<RegisterPage> createState() => _RegisterPageState();
        }

        class _RegisterPageState extends State<RegisterPage> {
        final _usernameController = TextEditingController();
        final _passwordController = TextEditingController();
        final _confirmPasswordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Register'),
                leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                },
                ),
            ),
            body: Center(
                child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                        const Text(
                            'Register',
                            style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 30.0),
                        TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            ),
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            ),
                            obscureText: true,
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            ),
                            obscureText: true,
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                            String username = _usernameController.text;
                            String password1 = _passwordController.text;
                            String password2 = _confirmPasswordController.text;

                            // Check credentials
                            // TODO: Change the url, don't forget to add a slash (/) inthe end of the URL!
                            // To connect Android emulator with Django on localhost,
                            // use the URL http://10.0.2.2/
                            final response = await request.postJson(
                                "http://127.0.0.1:8000/auth/register/",
                                jsonEncode({
                                    "username": username,
                                    "password1": password1,
                                    "password2": password2,
                                }));
                            if (context.mounted) {
                                if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                    content: Text('Successfully registered!'),
                                    ),
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                );
                                } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                    content: Text('Failed to register!'),
                                    ),
                                );
                                }
                            }
                            },
                            style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text('Register'),
                        ),
                        ],
                    ),
                    ),
                ),
                ),
            ),
            );
        }
        }
        ```

- Create a custom model according to the Django application project.
    - Create a new file under the models/ folder in the subdirectory lib/ with the name food_entry.dart, fill it with this code
        ```
        // To parse this JSON data, do
        //
        //     final moodEntry = moodEntryFromJson(jsonString);

        import 'dart:convert';

        List<FoodEntry> foodEntryFromJson(String str) => List<FoodEntry>.from(json.decode(str).map((x) => FoodEntry.fromJson(x)));

        String foodEntryToJson(List<FoodEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
        
        class FoodEntry {
            String model;
            String pk;
            Fields fields;

            FoodEntry({
                required this.model,
                required this.pk,
                required this.fields,
            });

            factory FoodEntry.fromJson(Map<String, dynamic> json) => FoodEntry(
                model: json["model"],
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

            Map<String, dynamic> toJson() => {
                "model": model,
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
            int user;
            String name;
            String description;
            int price;

            Fields({
                required this.user,
                required this.name,
                required this.description,
                required this.price,
            });

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                description: json["description"],
                price: json["price"],
            );

            Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "description": description,
                "price": price,
            };
        }
        ```        
- Fetch Data from Django and Show Data in the Flutter App
    - Run flutter pub add http in the Flutter project
    - In the file android/app/src/main/AndroidManifest.xml, add this code to allow your Flutter app to access the internet.
        ```
        ...
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
        ...
        ```
    - Create a new file in the lib/screens directory with name list_foodentry.dart and fill it with this code
        ```
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        import 'package:skibishop/models/food_entry.dart';
        import 'package:skibishop/widgets/left_drawer.dart';
        import 'package:skibishop/widgets/food_details.dart';

        class FoodEntryPage extends StatefulWidget {
        const FoodEntryPage({super.key});

        @override
        State<FoodEntryPage> createState() => _FoodEntryPageState();
        }

        class _FoodEntryPageState extends State<FoodEntryPage> {
        Future<List<FoodEntry>> fetchFood(CookieRequest request) async {
            // TODO: Don't forget to add the trailing slash (/) at the end of the URL!
            final response = await request.get('http://127.0.0.1:8000/json/');
            
            // Decoding the response into JSON
            var data = response;
            
            // Convert json data to a Product object
            List<FoodEntry> listFood = [];
            for (var d in data) {
            if (d != null) {
                listFood.add(FoodEntry.fromJson(d));
            }
            }
            return listFood;
        }
        
        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Food List'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchFood(request),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            'There is no product data in SKIBISHOP',
                            style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                        final foodEntry = snapshot.data![index];
                        return InkWell(
                            onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => FoodDetailsPage(foodEntry: foodEntry),
                                ),
                            );
                            },
                            child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Container(
                                decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, // Color of the border
                                    width: 1, // Width of the border
                                ),
                                borderRadius: BorderRadius.circular(12), // Border radius of the container
                                ),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.description}"),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                ],
                                ),
                            ),
                            ),
                        );
                        },
                    );
                    }
                }
                },
            ),
            );
        }
        }
        ```
- Create a detail page for each item listed on the Product list page.
    - Create a new dart file named food_details in lib/widgets/
    - Add the following code to the file
        ```
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
        ```
 </details>
