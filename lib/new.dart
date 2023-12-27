import 'package:flutter/material.dart';
import 'package:flutter_application_1/StepOne.dart';

class CurvedDividerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height); // Start from bottom-left corner

    // Create a curved line
    path.quadraticBezierTo(
        size.width / 2, size.height - 20, size.width, size.height);

    // Close the path to form a complete shape
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: CurvedDividerClipper(),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Image.asset(
                    'assets/1.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity, // Expand width to match container
                    height: double.infinity, // Expand height to match container
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 20,
            child: CustomPaint(
              painter: CurvedLinePainter(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: 0.0,
                left: 30.0,
                right: 30.0,
                bottom: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Elevate Your Well-Being',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Regular fitness enhances both physical and mental health. It boosts energy levels, improves mood, and reduces the risk of various health conditions, empowering you to lead a more vibrant life.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          left: 50,
          right: 50,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // Navigation logic to skip action
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Step1View()));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: FloatingActionButton(
                onPressed: () {
                  // Navigation logic to the next screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen2()));
                },
                backgroundColor: Colors.blue,
                child: Transform.scale(
                  scale: 1.2,
                  child: Icon(Icons.arrow_forward),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Color of the curved line
      ..style = PaintingStyle.fill;

    // Create a curved line with more rounded edges
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height + 40, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: CurvedDividerClipper(),
              child: Container(
                color: Colors
                    .blue, // Set your desired background color for the image section
                child: Center(
                  child: Image.asset(
                    'assets/2.jpg', // Replace with your image asset
                    fit: BoxFit.fill,
                    width: double.infinity, // Expand width to match container
                    height: double.infinity, // Expand height to match container
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 20, // Height of the curved line
            child: CustomPaint(
              painter: CurvedLinePainter(), // CustomPainter for the curved line
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors
                  .white, // Set your desired background color for the text section
              padding: EdgeInsets.only(
                top: 0.0, // Adjust the top padding for the text content
                left: 30.0,
                right: 30.0,
                bottom: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Unlock Your Potential',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Fitness isnt just about exercise; its about tapping into your potential. It fosters discipline, resilience, and determination, enabling you to achieve personal and professional goals while optimizing your overall performance.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          left: 40,
          right: 40,
          bottom: 30,
        ), // Adjust the bottom padding
        child: Transform.scale(
          scale: 1.2, // Increase the size of the arrow
          child: FloatingActionButton(
            onPressed: () {
              // Navigation logic to the next screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen3()));
            },
            backgroundColor: Colors.blue, // Set button background color
            child: Transform.scale(
              scale: 1.2, // Increase the size of the icon
              child: Icon(Icons.arrow_forward),
            ),
            elevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: CurvedDividerClipper(),
              child: Container(
                color: Colors
                    .blue, // Set your desired background color for the image section
                child: Center(
                  child: Image.asset(
                    'assets/3.jpg', // Replace with your image asset
                    fit: BoxFit.fill,
                    width: double.infinity, // Expand width to match container
                    height: double.infinity, // Expand height to match container
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 20, // Height of the curved line
            child: CustomPaint(
              painter: CurvedLinePainter(), // CustomPainter for the curved line
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors
                  .white, // Set your desired background color for the text section
              padding: EdgeInsets.only(
                top: 0.0, // Adjust the top padding for the text content
                left: 30.0,
                right: 30.0,
                bottom: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Revitalize Your Lifestyle',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Embracing fitness is a commitment to a fulfilling lifestyle. It cultivates habits that promote longevity, enhances quality of life, and allows you to savor each moment with vitality and vigor.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          left: 40,
          right: 40,
          bottom: 30,
        ), // Adjust the bottom padding
        child: Transform.scale(
          scale: 1.2, // Increase the size of the arrow
          child: FloatingActionButton(
            onPressed: () {
              // Navigation logic to the next screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Step1View()));
            },
            backgroundColor: Colors.blue, // Set button background color
            child: Transform.scale(
              scale: 1.2, // Increase the size of the icon
              child: Icon(Icons.arrow_forward),
            ),
            elevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
