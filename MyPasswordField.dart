import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const MyPasswordField({super.key, required this.controller});

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true;

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
      top: 475,
      left: 40,
      right: 40,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: widget.controller, // استعمال الكنترولر الخارجي
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
          Column(
            children: [
              _buildPasswordCondition(
                'At least 8 characters',
                _hasEightCharacters,
              ),
              _buildPasswordCondition(
                'At least 1 uppercase letter',
                _hasUpperCase,
              ),
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
        Text(text, style: TextStyle(color: Colors.black54, fontSize: 12)),
      ],
    );
  }
}
