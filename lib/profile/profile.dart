import 'package:agrosage/profile/edit_profile.dart';
import 'package:agrosage/profile/settings.dart';
import 'package:agrosage/profile/settingtile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const ProfileScreen({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _email = '';
  String _profileImageUrl = ''; // Add profile image URL

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(_profileImageUrl), // Use stored profile image URL
                  ),
                  const SizedBox(width: 13,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _name, // Use retrieved name
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        _email, // Use retrieved email
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                name: _name,
                                email: _email,
                                profileImageUrl: _profileImageUrl,
                                onUpdateProfileImage: (String imageUrl) {
                                  setState(() {
                                    _profileImageUrl = imageUrl;
                                  });
                                },
                              ),
                            ),
                          ).then((updatedData) {
                            if (kDebugMode) {
                              print("Updated data received: $updatedData");
                            }
                            if (updatedData != null) {
                              setState(() {
                                if (kDebugMode) {
                                  print("Name in EditProfileScreen: $_name");
                                }
                                if (kDebugMode) {
                                  print("Email in EditProfileScreen: $_email");
                                }
                                _name = updatedData['name'] as String;
                                _email = updatedData['email'] as String;
                                // _profileImageUrl = updatedData['profileImageUrl'] as String; // Include profile image URL
                              });
                            }
                          });
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 10.0),
              Column(
                children: List.generate(
                  settings.length,
                  (index) => SettingTile(setting: settings[index]),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Column(
                children: List.generate(
                  settings2.length,
                  (index) => SettingTile(setting: settings2[index]),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: const Icon(Icons.chevron_right),
              ),
              // const SupportCard()
            ],
          ),
        ),
      ),
    );
  }
}
