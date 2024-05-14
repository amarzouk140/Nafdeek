import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF013A6B),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Color(0xFF013A6B),
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF013A6B),
    textTheme: ButtonTextTheme.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF013A6B),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Setup',
      theme: appTheme,
      home: MainApplicationScreen(),
    );
  }
}

class MainApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double iconSize = 35;

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
            top: MediaQuery.of(context).padding.top - 5,
            left: 275,
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
        ],
      ),
    );
  }
}

class VolunteerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfTasksCompleted = 42;
    int volunteerPoints = 1230;

    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Profile"),
        backgroundColor: Color(0xFF013A6B),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/volunteer.png'),
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
                Icon(Icons.verified, color: Color(0xFF013A6B)),
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
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add_circle_outline, color: Colors.white),
              label: Text('Start New Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF013A6B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: () {},
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
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
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
                  if (_showButtons)
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
                        SizedBox(width: 20),
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
                  label: Text('Virtual Assistance for PODs'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VirtualAssistancePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF013A6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 25),
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
                    backgroundColor: Colors.green,
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
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013A6B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'The volunteer will contact you within the next few minutes.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013A6B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: Text('OK', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 20),
              Text(
                'Note: All communication is monitored by the Ministry of Interior (MOI).',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Arial',
                ),
                textAlign: TextAlign.center,
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
