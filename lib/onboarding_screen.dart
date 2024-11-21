import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {'animation': 'assets/animation1.json', 'text': 'Welcome to Commerception!'},
    {'animation': 'assets/animation2.json', 'text': 'Discover great products!'},
    {'animation': 'assets/animation3.json', 'text': 'Start shopping now!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(_onboardingData[_currentPage]['animation']!, height: 300),
          SizedBox(height: 20),
          Text(
            _onboardingData[_currentPage]['text']!,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPage--;
                    });
                  },
                  child: Text('Previous'),
                ),
              if (_currentPage < _onboardingData.length - 1)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                  },
                  child: Text('Next'),
                ),
              if (_currentPage == _onboardingData.length - 1)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  },
                  child: Text('Done'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
