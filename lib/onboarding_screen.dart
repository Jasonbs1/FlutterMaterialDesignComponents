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

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(_onboardingData[index]['animation']!,
                        height: 300),
                    SizedBox(height: 20),
                    Text(
                      _onboardingData[index]['text']!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 10.0,
                width: _currentPage == index ? 20.0 : 10.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: Text('Previous'),
                ),
              if (_currentPage < _onboardingData.length - 1)
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
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
