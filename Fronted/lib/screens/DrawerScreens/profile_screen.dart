import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ✅ Dummy user data (Frontend only)
  String name = "Ankit Sharma";
  String email = "ankitsharma@example.com";
  String phone = "+91 99999 99999";

  File? profileImage;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: source,
      imageQuality: 70,
    );

    if (file != null) {
      setState(() {
        profileImage = File(file.path);
      });
    }
  }

  void editProfile() {
    final nameController = TextEditingController(text: name);
    final phoneController = TextEditingController(text: phone);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      name = nameController.text.trim();
                      phone = phoneController.text.trim();
                    });

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile updated ✅")),
                    );
                  },
                  child: const Text("Save Changes"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ✅ Profile Photo
            Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                  profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null
                      ? const Icon(Icons.person_outline, size: 55)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(18)),
                        ),
                        builder: (_) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text("Camera"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text("Gallery"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ✅ Profile Info
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(email, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 6),
            Text("Phone: $phone"),

            const SizedBox(height: 22),

            // ✅ Only One Button (Edit Profile)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: editProfile,
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
