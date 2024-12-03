import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final AuthService _authService = AuthService();

  void _handleSignOut() async {
    try {
      await _authService.signOut();
      // Redirect user to the login screen or perform any other necessary actions
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      // Show an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "Profile Settings") {
                // Navigate to Profile Settings
              } else if (value == "Edit Profile") {
                // Navigate to Edit Profile
              } else if (value == "Preferences") {
                // Navigate to Preferences
              }
              else if (value == "Sign Out") {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Sign Out"),
                      content: const Text(
                        "Are you sure you want to sign out from the account?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            // sign-out and redirect to the login page
                            _handleSignOut();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (BuildContext context) {
              return [
              PopupMenuItem(
                value: "Profile Settings",
                child: Row(
                  children: const [
                    Icon(Icons.settings, size: 20, color: Colors.black54),
                    SizedBox(width: 8),
                    Text("Profile Settings"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Edit Profile",
                child: Row(
                  children: const [
                    Icon(Icons.edit, size: 20, color: Colors.black54),
                    SizedBox(width: 8),
                    Text("Edit Profile"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Preferences",
                child: Row(
                  children: const [
                    Icon(Icons.tune, size: 20, color: Colors.black54),
                    SizedBox(width: 8),
                    Text("Preferences"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Sign Out",
                child: Row(
                  children: const [
                    Icon(Icons.logout, size: 20, color: Colors.black54),
                    SizedBox(width: 8),
                    Text("Sign Out"),
                  ],
                ),
              ),
            ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              const SizedBox(height: 16),

              // Username
              Text(
                '@Username',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),

              // Bio
              const SizedBox(height: 8),
              Text(
                '🌿 Living the mellow life! | Explorer | Dreamer',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 24),

              // Metrics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMetric('Followers', '1.2K'),
                  _buildMetric('Following', '526'),
                  _buildMetric('Mellow Coins', '150'),
                ],
              ),

              const SizedBox(height: 24),

              // Interests Section
              _buildInterestsSection(),

              const SizedBox(height: 24),

              // Additional Metrics Section
              _buildAdditionalMetricsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build metric card
  Widget _buildMetric(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Helper widget for saved items
  Widget _buildSavedItem(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFF07D9B),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  // Interests Section
  Widget _buildInterestsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Interests',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSavedItem('Liked Posts', Icons.favorite),
              _buildSavedItem('Liked Profiles', Icons.person),
              _buildSavedItem('Shared Goals', Icons.star),
            ],
          ),
        ],
      ),
    );
  }

  // Additional Metrics Section
  Widget _buildAdditionalMetricsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Additional Metrics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: Icon(Icons.check_circle, color: Color(0xFFF07D9B)),
            title: const Text('Completed Goals'),
            trailing: const Text(
              '15',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Color(0xFFF07D9B)),
            title: const Text('Daily Streak'),
            trailing: const Text(
              '8 days',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.emoji_events, color: Color(0xFFF07D9B)),
            title: const Text('Achievements'),
            trailing: const Text(
              '5',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
