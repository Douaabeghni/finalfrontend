import 'package:flutter/material.dart';

class Join extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 40,  // Positionnement vertical pour l'icône X (proche du coin supérieur gauche)
            left: 10,  // Positionnement horizontal (proche du bord gauche)
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black, size: 30),  // Icône X (croix)
              onPressed: () {
                // Action pour revenir à l'interface précédente
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 100,  // Positionnement vertical (à 100 pixels du haut)
            left: 45,  // Positionnement horizontal (à 100 pixels de la gauche)
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/6b/49/86/6b4986f547140e2bf32db210f301059a.jpg',
              ),
            ),
          ),
          Positioned(
            top: 215,  // Positionnement vertical du texte
            left: 35,  // Positionnement horizontal du texte
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
            top: 280,  // Positionnement vertical du texte
            left: 35,  // Positionnement horizontal du texte
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
            top: 340,  // Positionnement vertical du champ de texte (barre d'inscription)
            left: 40,  // Positionnement horizontal du champ de texte
            right: 40, // Pour une largeur de champ égale de chaque côté
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,  // Positionnement vertical du champ de texte (barre d'inscription)
            left: 40,  // Positionnement horizontal du champ de texte
            right: 40, // Pour une largeur de champ égale de chaque côté
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'public username',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          Positioned(
            top: 450,  // Positionnement vertical du texte
            left: 45,  // Positionnement horizontal du texte
            child: Text(
              'you cant change your username so choose wisely',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 600,  // Positionnement vertical du bouton
            left: 50,  // Positionnement horizontal du bouton
            right: 50, // Pour que le bouton soit centré
            child: ElevatedButton(
              onPressed: () {
                // Action lorsque le bouton est pressé
                print("Inscription terminée");
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), // Forme ovale
                padding: EdgeInsets.symmetric(vertical: 13), // Hauteur du bouton
                backgroundColor: Colors.blue[300], // Couleur de fond du bouton
              ),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MyPasswordField(),
          Positioned(
            top: 670,  // Positionnement vertical du bouton Google
            left: 50,  // Positionnement horizontal du bouton
            right: 200, // Pour que le bouton soit centré
            child: ElevatedButton.icon(
              onPressed: () {
                // Action pour s'inscrire avec Google
                print("Inscription avec Google");
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.white, // Fond blanc
                side: BorderSide(color: Colors.blue.shade300), // Bordure bleue
              ),
              icon: Icon(Icons.account_circle, color: Colors.grey),
              label: Text(
                'Google',
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 670,  // Positionnement vertical du bouton Facebook
            left: 200,  // Positionnement horizontal du bouton
            right: 50, // Pour que le bouton soit centré
            child: ElevatedButton.icon(
              onPressed: () {
                // Action pour s'inscrire avec Facebook
                print("Inscription avec Facebook");
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue.shade300),// Fond bleu
              ),
              icon: Icon(Icons.facebook, color: Colors.blue),
              label: Text(
                'Facebook',
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),// Ajout du champ de mot de passe ici
        ],
      ),
    );
  }
}

class MyPasswordField extends StatefulWidget {
  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true;
  TextEditingController _passwordController = TextEditingController();

  bool _hasUpperCase = false;
  bool _hasNumber = false;
  bool _hasEightCharacters = false;

  void _checkPasswordConditions(String password) {
    setState(() {
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasEightCharacters = password.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 475,  // Positionnement vertical du champ de texte (barre d'inscription)
      left: 40,  // Positionnement horizontal du champ de texte
      right: 40, // Pour une largeur de champ égale de chaque côté
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black54),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: _checkPasswordConditions,
            ),
          ),
          SizedBox(height: 10),
          // Liste des conditions de mot de passe
          Column(
            children: [
              _buildPasswordCondition(
                  'At least 8 characters', _hasEightCharacters),
              _buildPasswordCondition(
                  'At least 1 uppercase letter', _hasUpperCase),
              _buildPasswordCondition('At least 1 number', _hasNumber),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCondition(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 16,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}


