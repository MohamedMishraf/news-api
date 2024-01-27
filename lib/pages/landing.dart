import 'package:flutter/material.dart';
import 'package:cw1_news_api/pages/homePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "images/shutterstock.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Global News",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Read Everything... Know Everything...",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "Let's Go",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
