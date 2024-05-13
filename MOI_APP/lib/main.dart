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
        backgroundColor: Color(0xFF013A6B),  // Consistent theme color for AppBar
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // This aligns the column to the center vertically
            children: <Widget>[
              Text(
                'Are you a person of determination?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,  // Increase font size for better readability
                  fontWeight: FontWeight.bold,  // Make the text bold
                  color: Color(0xFF013A6B),  // Use theme color for text
                ),
              ),
              SizedBox(height: 40),  // Add more space before the buttons
              ElevatedButton(
                onPressed: () {
                  // If "Yes", proceed to QuestionTwo
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionTwo()),
                  );
                },
                child: Text('Yes', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013A6B),  // Use theme color for button background
                  foregroundColor: Colors.white,  // Text color on button
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),  // Padding for better touch area
                ),
              ),
              SizedBox(height: 20),  // Space between buttons
              ElevatedButton(
                onPressed: () {
                  // If "No", go directly to NormalUser page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NormalUser()),
                  );
                },
                child: Text('No', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,  // Different color for 'No' option
                  foregroundColor: Colors.white,  // Text color on button
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),  // Padding
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Categories for disabilities
    List<Map<String, dynamic>> categories = [
      {
        'text': 'Physical Disability',
        'icon': Icons.accessible_forward,
      },
      {
        'text': 'Intellectual Disability',
        'icon': Icons.psychology,
      },
      {
        'text': 'Impaired Hearing',
        'icon': Icons.hearing,
      },
      {
        'text': 'Visual Impairment',
        'icon': Icons.visibility_off,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question 2'),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns content vertically to the center
            children: <Widget>[
              Text(
                'From which of the following categories?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013A6B),
                ),
              ),
              SizedBox(height: 40),
              Flexible( // Use Flexible to handle layout more gracefully when available space is limited
                child: GridView.builder(
                  shrinkWrap: true, // Ensures the grid does not fill all available space
                  physics: NeverScrollableScrollPhysics(), // Disables scrolling within the GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        saveProfile(categories[index]['text']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CustomizedPage(category: categories[index]['text'])),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF013A6B),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(categories[index]['icon'], size: 40, color: Colors.white),
                          SizedBox(height: 10),
                          Text(categories[index]['text'], style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveProfile(String category) {
    // Placeholder for save profile logic
    print("Profile saved with category: $category");
  }
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


class CustomizedPage extends StatelessWidget {
  final String category;

  CustomizedPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customization Complete"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.white,  // Maintain a clean, white background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Color(0xFF013A6B),
            ),
            SizedBox(height: 30),
            Text(
              "Your app has been customized with features suited for your needs.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF013A6B),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Thank you for providing your preferences. Enjoy a personalized experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainApplicationScreen()),
                  ModalRoute.withName('/MainApplicationScreen'),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF013A6B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Start the App', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}


class NormalUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Update Successful"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.white,  // Set the background to white
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 120,
              color: Color(0xFF013A6B),
            ),
            SizedBox(height: 30),
            Text(
              "Profile Successfully Updated!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,  // Slightly smaller font size
                fontWeight: FontWeight.bold,
                color: Color(0xFF013A6B),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainApplicationScreen()),
                  ModalRoute.withName('/MainApplicationScreen'),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF013A6B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Start the App', style: TextStyle(fontSize: 20)),
            ),
          ],
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


class NafdeekPage extends StatefulWidget {
  @override
  _NafdeekPageState createState() => _NafdeekPageState();
}

class _NafdeekPageState extends State<NafdeekPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut)
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showButtons = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAFDEEK Portal"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset('assets/images/logo1.png', width: 300, height: 300),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (_showButtons) ...[
                    Row(
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
                              MaterialPageRoute(builder: (context) => RequestNafdeekServicePage()),
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
                                Icon(Icons.person, size: 60, color: Colors.white),
                                SizedBox(height: 10),
                                Text('Volunteer Page', textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class RequestNafdeekServicePage extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.location_on, size: 40),
                  label: Text('Connect with Local Volunteers'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttentionPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF013A6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Flexible(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.video_call, size: 40),
                  label: Text('Virtual Assistance    '),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VirtualAssistancePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF013A6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 50),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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




class AttentionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Permission"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_searching,
              color: Color(0xFF013A6B),
              size: 100,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "To use this service, you need to share your location with the Ministry of Interior.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We respect your privacy and ensure that your data is handled with the highest security and confidentiality.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Accept button in green
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RequestServicePage()),
                  ),
                  child: Text('Accept & Share Location'),
                ),
                SizedBox(width: 20), // Space between buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Deny button in red
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Deny'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class RequestServicePage extends StatefulWidget {
  @override
  _RequestServicePageState createState() => _RequestServicePageState();
}

class _RequestServicePageState extends State<RequestServicePage> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Map<String, dynamic>> volunteers = [];
  List<Map<String, dynamic>> initialVolunteers = [
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

  late AnimationController _controller;
  late Animation<double> _animation;
  bool isSearching = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    // Simulate a network call delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isSearching = false;
      });
      for (int i = 0; i < initialVolunteers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 300), () {
          _listKey.currentState?.insertItem(i);
          volunteers.add(initialVolunteers[i]);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locate Nearby Help"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: isSearching
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF013A6B),
                      size: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Searching for available volunteers...',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : AnimatedList(
              key: _listKey,
              initialItemCount: volunteers.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(volunteers[index], animation);
              },
            ),
    );
  }

  Widget _buildItem(Map<String, dynamic> volunteer, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(volunteer['image']),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  volunteer['name'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (volunteer['verified'])
                Icon(Icons.verified, color: Color(0xFF013A6B), size: 14),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: <Widget>[
                ...List.generate(
                  5,
                  (i) => Icon(
                    i < volunteer['rating'] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  volunteer['distance'],
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SendRequestPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF013A6B),
              foregroundColor: Colors.white,
            ),
            child: Text('Send a Request', style: TextStyle(fontSize: 12)),
          ),
        ),
      ),
    );
  }
}



class SendRequestPage extends StatefulWidget {
  @override
  _SendRequestPageState createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Sent"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your request has been sent to the volunteer.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'The volunteer will contact you within the next few minutes.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013A6B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: Text('OK', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class VirtualAssistancePage extends StatefulWidget {
  @override
  _VirtualAssistancePageState createState() => _VirtualAssistancePageState();
}

class _VirtualAssistancePageState extends State<VirtualAssistancePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virtual Assistance"),
        backgroundColor: Color(0xFF013A6B),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.video_call,
                color: Color(0xFF013A6B),
                size: 100,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Connecting to Virtual Assistance...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF013A6B),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Please wait while we connect you to a specialized volunteer.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}