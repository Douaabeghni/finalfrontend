import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ap/screen/message-1.dart';

class MessagesPage extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      'name': 'Alice (Seller)',
      'message': 'Bonjour ! Avez-vous reçu le colis ?',
      'time': '14:30',
      'avatar': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'name': 'Bob (Client)',
      'message': 'Oui merci beaucoup !',
      'time': '13:10',
      'avatar': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'name': 'Charlie (Seller)',
      'message': 'Votre commande est prête.',
      'time': '11:00',
      'avatar': 'https://i.pravatar.cc/150?img=3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final msg = messages[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Colors.white,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(msg['avatar']!),
              radius: 25,
            ),
            title: Text(
              msg['name']!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              msg['message']!,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              msg['time']!,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500]),
            ),
            onTap: () {
              // Naviguer vers la page de chat
              // Navigator.push(...)
            },
          );
        },
      ),
    );
  }
}
