import 'package:flutter/material.dart';
import 'package:my_ap/inscription.dart';
import 'package:my_ap/join.dart';
import 'package:my_ap/screen/Seller.dart';
import 'package:my_ap/screen/first.dart';
import 'package:my_ap/screen/les_messages.dart';
import 'package:my_ap/screen/les_profiles.dart';
import 'package:my_ap/screen/profile.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showProfileBox = false;

  @override
  Widget build(BuildContext context) {
    const buttonSize = Size(300, 50);
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue[200]!),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      elevation: MaterialStatePropertyAll<double>(5),
      shadowColor: MaterialStatePropertyAll<Color>(Colors.black),
      minimumSize: MaterialStatePropertyAll<Size>(buttonSize),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            setState(() {
              showProfileBox = !showProfileBox;
            });
          },
          icon: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[700]),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Join()),
              );
            },
            icon: Icon(Icons.person_add, size: 28, color: Colors.grey[700]),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inscription()),
              );
            },
            icon: Icon(Icons.login, size: 28, color: Colors.grey[700]),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Seller()),
              );
            },
            icon: Icon(Icons.add_business, size: 28, color: Colors.grey[700]),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesPage()),
              );
            },
            icon: Icon(Icons.message, size: 28, color: Colors.grey[700]),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommandesPage()),
              );
            },
            icon: Icon(Icons.shopping_bag, size: 28, color: Colors.grey[700]),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 25,
            top: 60,
            child: Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/736x/e7/00/5b/e7005b7ab2cf7d9ed4f7b97a95fa3f0f.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 250,
            child: Container(
              width: 300,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 80,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: Text(
                'Professional workspace with freelancers',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: 360,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Apkmobil()),
                    );
                  },
                  style: buttonStyle,
                  child: Text(
                    'Programming',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: Text(
                    'Graphics Design',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: Text(
                    'Digital Marketing',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: Text(
                    'Architecture',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: Text(
                    'AI Services',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (showProfileBox) ...[
            AnimatedOpacity(
              opacity: 0.5,
              duration: Duration(milliseconds: 300),
              child: Container(color: Colors.black),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 260,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showProfileBox = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text('Déconnecter'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// صفحة الطلبات (CommandesPage)
class CommandesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les commandes'),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(child: Text('Voici la liste des commandes.')),
    );
  }
}
