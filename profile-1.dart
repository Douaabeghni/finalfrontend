import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:my_ap/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? _profileImage;
  File? _additionalImage;

  Future<void> _pickImage(bool isProfileImage) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isProfileImage) {
          _profileImage = File(pickedFile.path);
        } else {
          _additionalImage = File(pickedFile.path);
        }
      });
    }
  }

  String selectedOption = 'Basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[300],  // <-- ici modifié
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(true),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                  image: _profileImage != null
                      ? DecorationImage(image: FileImage(_profileImage!), fit: BoxFit.cover)
                      : null,
                ),
                child: _profileImage == null
                    ? Center(
                  child: Icon(Icons.person_add_alt_1, size: 50, color: Colors.white),
                )
                    : null,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Full Name",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  buildPriceOption('Basic', '10\$', 'Offre de base'),
                  SizedBox(width: 5),
                  buildPriceOption('Standard', '30\$', 'Meilleure valeur'),
                  SizedBox(width: 5),
                  buildPriceOption('Premium', '60\$', 'Offre complète'),
                  SizedBox(width: 10),
                ],
              ),
            ),
            buildDropdownMenu(selectedOption),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _pickImage(false),
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  image: _additionalImage != null
                      ? DecorationImage(image: FileImage(_additionalImage!), fit: BoxFit.cover)
                      : null,
                ),
                child: _additionalImage == null
                    ? Center(
                  child: Icon(Icons.add_photo_alternate, size: 50, color: Colors.white),
                )
                    : null,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],  // <-- ici modifié
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sélectionner une photo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildPriceOption(String title, String price, String description) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedOption = title;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownMenu(String title) {
    List<String> options = [
      "Revision",
      "Delivery Day",
      "Number of concepts included",
      "Logo transparency",
      "Vector file",
      "Pintable file",
      "3D mokup",
      "Source file",
      "Social media kit"
    ];

    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 375,
      height: 345,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: options.asMap().entries.map((entry) {
          return buildMenuItem(
              entry.value,
              entry.key == 0
                  ? "Unlimited"
                  : entry.key == 1
                  ? "24hours"
                  : entry.key == 2
                  ? (title == 'Basic'
                  ? "1"
                  : title == 'Standard'
                  ? "2"
                  : "3")
                  : "",
              showCheckIcon: title == 'Premium' ||
                  (title == 'Standard' ? entry.key < 7 : entry.key != 3 && entry.key != 5));
        }).toList(),
      ),
    );
  }

  Widget buildMenuItem(String text, String label, {bool showCheckIcon = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[300],  // <-- ici modifié
              ),
            )
          else
            Icon(showCheckIcon ? Icons.check : Icons.close,
                color: showCheckIcon ? Colors.green : Colors.red),
        ],
      ),
    );
  }
}













