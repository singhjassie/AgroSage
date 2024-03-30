import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // for image selection

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String profileImageUrl;

  const EditProfileScreen({super.key, required this.name, required this.email, required this.profileImageUrl});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String _name = '';
  String _email = '';
  File? _profileImage; // Added for storing selected image file

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _profileImage = File(pickedFile.path));
    }
  }

  // Placeholder function to simulate saving changes (replace with actual API call)
   Future<void> _saveChanges() async {
    // Implement your logic to save changes to a backend or user storage
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    if (!mounted) return;
    Navigator.pop(context, {
  'name': _name,
  'email': _email,
  'profileImageUrl': _profileImage?.path, // Include updated profile image URL
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile picture editing
              Stack(
                children: [
                  _profileImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.file(_profileImage!),
                        )
                      : CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(widget.profileImageUrl),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              // Name editing
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
                onSaved: (newValue) => setState(() => _name = newValue!),
              ),

              const SizedBox(height: 10.0),

              // Email editing
              TextFormField(
                initialValue: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  } 
                  return null;
                },
                onSaved: (newValue) => setState(() => _email = newValue!),
              ),

              const SizedBox(height: 20.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _saveChanges(); // Call the placeholder save function
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

