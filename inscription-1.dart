import 'package:flutter/material.dart';
import 'package:my_ap/screen/api_service.dart';
import 'package:my_ap/screen/MyPasswordField.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 100,
            left: 45,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/6b/49/86/6b4986f547140e2bf32db210f301059a.jpg',
              ),
            ),
          ),
          Positioned(
            top: 215,
            left: 35,
            child: Text(
              'Welcome to my app',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 35,
            child: Text(
              'Please enter your information',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 340,
            left: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'email',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'public username',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 45,
            child: Text(
              'you can\'t change your username so choose wisely',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MyPasswordField(controller: passwordController),
          Positioned(
            top: 600,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () async {
                final username = usernameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                print(
                  'username: $username, email: $email, password: $password',
                );

                if (username.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('المرجو ملء جميع الحقول')),
                  );
                  return;
                }

                final success = await api.signup(username, email, password);

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
                  );
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'فشل في إنشاء الحساب، تأكد من صحة البيانات',
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



