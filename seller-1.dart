import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Seller extends StatefulWidget {
  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  File? _profileImage;
  String? selectedCategory;
  String? selectedService;

  final Map<String, List<String>> categoryServices = {
    'Graphique Design': ['Logo Design', 'UI/UX Design', 'Banner Design'],
    'Programmation': ['developpement mobile', 'Developpment web', 'jeux et Gaming','intelligence artificiel et machine learning','cybersecurite et hacking'],
    'Degital marketing': ['SEO', 'Social Media Ads', 'Email Campaigns'],
    'Architecture': ['2D Plans', '3D Modeling', 'Interior Design'],
    'AI service':['AI content writing','chatbot development','AI image generation'],
  };

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentServices =
    selectedCategory != null ? categoryServices[selectedCategory!] ?? [] : [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.black, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Become a seller',
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Tell us a bit about yourself...',
                style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // Full name
              Text('Full Name', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'First Name', border: InputBorder.none),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Last Name', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Display name
              Text('Display Name', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Type your display name', border: InputBorder.none),
                ),
              ),
              SizedBox(height: 30),

              // Profile picture
              Text('Profile Picture', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[400]!, width: 3),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
                    image: _profileImage != null
                        ? DecorationImage(image: FileImage(_profileImage!), fit: BoxFit.cover)
                        : null,
                  ),
                  child: _profileImage == null
                      ? Center(child: Icon(Icons.add_a_photo, color: Colors.black54, size: 30))
                      : null,
                ),
              ),
              SizedBox(height: 30),

              // Description
              Text('Description', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Share a bit about your work',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Category
              Text('Category', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: InputBorder.none),
                  hint: Text("Select Category", style: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                  value: selectedCategory,
                  items: categoryServices.keys.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                      selectedService = null; // reset service
                    });
                  },
                ),
              ),
              SizedBox(height: 30),

              // Service
              Text('Service', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: InputBorder.none),
                  hint: Text("Select Service", style: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                  value: selectedService,
                  items: currentServices.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedService = newValue;
                    });
                  },
                ),
              ),
              SizedBox(height: 40),

              // Continue
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => print("Inscription terminée"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue[300],
                  ),
                  child: Text('Continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}