import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String profileImageUrl;
  final Function(String) onUpdateProfileImage; // Callback function to update profile image URL

  const EditProfileScreen({Key? key, required this.name, required this.email, required this.profileImageUrl, required this.onUpdateProfileImage}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  File? _profileImage;
  bool isLoaderProfile = false;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
  }

  Future<void> imageUpload() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
        uploadFile(_profileImage!);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> uploadFile(File selectedFile) async {
    setState(() {
      isLoaderProfile = true;
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);
    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      widget.onUpdateProfileImage(downloadUrl); // Update profile image URL using callback function
      setState(() {
        isLoaderProfile = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoaderProfile = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("uploadTask Failed"),
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  Future<void> _saveChanges() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    if (!mounted) return;
    Navigator.pop(context, {
      'name': _name,
      'email': _email,
      'profileImageUrl': widget.profileImageUrl,
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
                      onPressed: imageUpload,
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
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
                    _saveChanges();
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
