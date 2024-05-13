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
    titleLarge: TextStyle(color: Colors.white, fontSize: 20),  // For AppBar titles
    bodyMedium: TextStyle(color: Colors.black, fontSize: 18),  // Main body text
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
    double iconSize = 35;  // Adjusted icon size

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/moi_final.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top -5 ,  // Adjust for better positioning
            left: 275,  // Aligning the icon on the right side
            child: IconButton(
              icon: Image.asset('assets/images/logo2.png', width: iconSize, height: iconSize),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NafdeekPage()),
                );
              },
            ),
          ),
          // Other widgets can be added here if needed
        ],
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


class VolunteerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example data - in a real app, this should come from a data source or state management
    int numberOfTasksCompleted = 42;  // Example number of tasks completed
    int volunteerPoints = 1230;       // Example points earned by the volunteer

    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Profile"),
        backgroundColor: Color(0xFF013A6B), // Consistent theme color
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement action, for example, navigate to edit profile page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/volunteer.png'), // Example profile image
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ayman Marzouk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.verified, color: Color(0xFF013A6B)), // Verified icon next to the name
              ],
            ),
            Text(
              'Certified Volunteer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.assignment_turned_in, color: Color(0xFF013A6B)),
                SizedBox(width: 10),
                Text('Tasks Completed: $numberOfTasksCompleted'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_events, color: Color(0xFF013A6B)),
                SizedBox(width: 10),
                Text('Points: $volunteerPoints'),
              ],
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: Color(0xFF013A6B)),
                title: Text('amarzouk@student.42abudhabi.ae'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF013A6B)),
                title: Text('+971 52 4802292'),
              ),
            ),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: ListTile(
            //     leading: Icon(Icons.verified_user, color: Color(0xFF013A6B)),
            //     title: Text('Certified Volunteer'),
            //   ),
            // ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add_circle_outline, color: Colors.white),
              label: Text('Start New Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF013A6B), // Button background color
                foregroundColor: Colors.white, // Button text and icon color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: () {
                // Implement action to start a new task
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


class NafdeekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAFDEEK Service"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF013A6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RequestServicePage()),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/logo2.png', width: 60, height: 60),
                      SizedBox(height: 10),
                      Text('Request for NAFDEEK', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20), // Space between the buttons
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF013A6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VolunteerProfilePage()),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/icon.png', width: 60, height: 60),
                      SizedBox(height: 10),
                      Text('Volunteer Page', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    List<Map<String, dynamic>> volunteers = [
      {
        'name': 'Amna Alnaqbi',
        'rating': 5,
        'distance': '1 km away',
        'verified': true,
        'image': 'assets/images/volunteer1.png',
      },
      {
        'name': 'Mahmod Sayed',
        'rating': 5,
        'distance': '1.5 km away',
        'verified': true,
        'image': 'assets/images/volunteer2.png',
      },
      {
        'name': 'Ahmed Alshafy',
        'rating': 3,
        'distance': '1 km away',
        'verified': true,
        'image': 'assets/images/volunteer.png',
      },
      {
        'name': 'Sumyah Helal',
        'rating': 5,
        'distance': '2.75 km away',
        'verified': true,
        'image': 'assets/images/volunteer4.png',
      },
      {
        'name': 'Ali Alshamsi',
        'rating': 5,
        'distance': '4 km away',
        'verified': true,
        'image': 'assets/images/volunteer5.png',
      },
      {
        'name': 'Sara Almazrouei',
        'rating': 4,
        'distance': '4 km away',
        'verified': true,
        'image': 'assets/images/volunteer4.png',
      },
      {
        'name': 'Khalid Alhammadi',
        'rating': 4,
        'distance': '4 km away',
        'verified': true,
        'image': 'assets/images/volunteer5.png',
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Request Service"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: ListView.separated(
        itemCount: volunteers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(volunteers[index]['image']),
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      volunteers[index]['name'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),  // Adjusted font size for the name
                    ),
                  ),
                  if (volunteers[index]['verified'])
                    Icon(Icons.verified, color: Color(0xFF013A6B), size: 14),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    ...List.generate(5, (i) => Icon(
                      i < volunteers[index]['rating'] ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,  // Adjusted star size
                    )),
                    SizedBox(width: 10),
                    Text(
                      volunteers[index]['distance'],
                      style: TextStyle(fontSize: 12),  // Reduced font size for distance
                    ),
                  ],
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Action to send a request to this volunteer
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013A6B),  // Button background
                  foregroundColor: Colors.white,  // Button foreground
                ),
                child: Text('Send a Request', style: TextStyle(fontSize: 12)),  // Adjusted font size
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),  // Space between each card
      ),
    );
  }
}