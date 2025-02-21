import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 115, bottom: 60),
              child: Image.asset('images/grocery.png', width: 200, height: 200),
            ),
            // Add a welcome message
            Text(
              'Welcome to grocery shop that delivers to your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45),
            const Text(
              "Fresh items delivered to your door",
              style: TextStyle(fontSize: 13),
            ),
            Spacer(),
            // Add a button to navigate to the home page
            Container(
              margin: const EdgeInsets.all(20),
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.green[500],
                border: Border.all(color: Colors.green, width: 1),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                  print("Done");
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}