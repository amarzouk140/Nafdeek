import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF013A6B),  // Adjusted to a deep navy blue
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Color(0xFF013A6B),  // Deep navy blue for AppBar background
    foregroundColor: Colors.white,  // Text and icons in AppBar are white
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF013A6B),  // Button background color
    textTheme: ButtonTextTheme.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,  // Correct property for text color
      backgroundColor: Color(0xFF013A6B),  // Background color for TextButtons
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.white, fontSize: 20),  // For AppBar titles
    bodyText2: TextStyle(color: Colors.black, fontSize: 18),  // Main body text
  ),
  iconTheme: IconThemeData(
    color: Colors.white,  // AppBar icon color
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Setup',
      theme: appTheme,
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moi_start.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              Text(
                'To enhance your experience we need to build a profile for you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,  // Bright, clear color for better readability
                  fontWeight: FontWeight.bold,  // Increases the weight of the font
                  shadows: [
                    Shadow( // Text shadow for better legibility
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black,
                      blurRadius: 1,
                    ),
                    Shadow(
                      offset: Offset(1.5, -1.5),
                      color: Colors.black,
                      blurRadius: 1,
                    ),
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      color: Colors.black,
                      blurRadius: 1,
                    ),
                    Shadow(
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black,
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionOne()),
                ),
                child: Text('Start', style: TextStyle(fontSize: 20)),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}


class MainApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Ensure it fills the width
        height: MediaQuery.of(context).size.height, // Ensure it fills the height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moi_final.jpg'),
            fit: BoxFit.cover, // This ensures the image covers the full screen
          ),
        ),
      ),
    );
  }
}

class QuestionOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 1'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Are you a person of determination?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // If "Yes", proceed to QuestionTwo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionTwo()),
                );
              },
              child: Text('Yes', style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              onPressed: () {
                // If "No", go directly to CustomizedPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomizedPage(category: "Non-Determination")),
                );
              },
              child: Text('No', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 2'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'From which of the following categories?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            categoryButton(context, '  Physical Disability  '),
            categoryButton(context, '  Intellectual Disability'),
            categoryButton(context, '    Impaired Hearing     '),
            categoryButton(context, '   Visual Impairment       '),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(BuildContext context, String category) {
    return ElevatedButton(
      onPressed: () {
        saveProfile(category);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomizedPage(category: category)),
        );
      },
      child: Text(category, style: TextStyle(fontSize: 20)),
    );
  }

  void saveProfile(String category) {
    print("Profile saved with category: $category");
  }
}

class CustomizedPage extends StatelessWidget {
  final String category;

  CustomizedPage({required this.category});

  @override
  Widget build(BuildContext context) {
    String message = "All set! Customized features have been added to the app based on your profile to enhance your experience.";
    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Features"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainApplicationScreen()),
                  ModalRoute.withName('/'),
                ),
                child: Text('Start the App', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

