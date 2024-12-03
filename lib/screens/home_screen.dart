import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Tabs' widgets
  final List<Widget> _tabs = [
    const ContentsTab(),
    const ChatTab(),
    const SetGoalsTab(),
    const MentalExerciseTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mellow",
              style: GoogleFonts.calligraffitti(
                textStyle: const TextStyle(
                  letterSpacing: 1.75,
                  fontSize: 28,
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },
                child: const CircleAvatar(radius: 22.0,backgroundColor: AppColors.background,)
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Contents",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "Set Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: "Exercise",
          ),
        ],
      ),
    );
  }
}

// Placeholder for Contents Tab
class ContentsTab extends StatelessWidget {
  const ContentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Contents Tab: Explore Fitness, Yoga, and Mental Health Content",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

// Placeholder for Chat Tab
class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Chat Tab: Share what you feel! Connect with the perfect chat mate.",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

// Placeholder for Set Goals Tab
class SetGoalsTab extends StatelessWidget {
  const SetGoalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Set Goals Tab: Define and track your motivational goals.",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

// Placeholder for Mental Exercise Tab
class MentalExerciseTab extends StatelessWidget {
  const MentalExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Mental Exercise Tab: Engage in 5-minute daily exercises.",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
