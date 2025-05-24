import 'package:flutter/material.dart';
import 'package:my_ap/screen/profile.dart';
import 'package:my_ap/screen/les_profiles.dart';

void main() {
  runApp(Apkmobil());
}

class Apkmobil extends StatefulWidget {
  const Apkmobil({super.key});

  @override
  State<Apkmobil> createState() => _ApkmobilState();
}

class _ApkmobilState extends State<Apkmobil> {
  List<String> firsttexts = [
    "programmation",
    "Graphic desine",
    "architecture",
    "Four",
    "Five",
    "AI service",
    "bklkj",
  ];

  List<Widget> pages = [
    Apkmobil(),
  ];

  String selectedCategory = "All";

  List<Map<String, dynamic>> profiles = [
    {
      "name": "Ahmed",
      "category": "Jeux et gaming",
      "Image": "assets/pic1.jpeg",
      "stars": 4,
      "bio": "I will script java python bot c cpp sql database coding programming project developer",
    },
    {
      "name": "Sara",
      "category": "Développement Mobile",
      "Image": "assets/pic2.jpeg",
      "stars": 4,
      "bio": "I will create custom python program",
    },
    {
      "name": "Ali",
      "category": "Développement  web",
      "Image": "assets/pic3.jpeg",
      "stars": 5,
      "bio": "I will tutor java, python, cpp, r , c, c sharp and web programming teacher",
    },
    {
      "name": "Nour",
      "category": "Cybersécurité et Hacking Éthique",
      "Image": "assets/pic8.jpeg",
      "stars": 3,
      "bio": "I will create web app ai ml java python coding programming  project",
    },
    {
      "name": "Lina",
      "category": "Jeux et gaming",
      "Image": "assets/pic4.jpeg",
      "stars": 4,
      "bio": "I will do data structures and algorithms, python programming, java programming, cpp oop",
    },
    {
      "name": "Omar",
      "category": "Développement Logiciel",
      "Image": "assets/pic5.jpeg",
      "stars": 2,
      "bio": "I will script java python bot c cpp sql database coding programming project developer",
    },
    {
      "name": "mohammed",
      "category": "Jeux et gaming",
      "Image": "assets/pic3.jpeg",
      "stars": 2,
      "bio": "I will write java program, java coding java programming assignments",
    },
    {
      "name": "wassim",
      "category": "Cybersécurité et Hacking Éthique",
      "Image": "assets/pic7.jpeg",
      "stars": 3,
      "bio": "I will script java python bot c cpp sql database coding programming project developer",
    },
    {
      "name": "fatima",
      "category": "Développement Mobile",
      "Image": "assets/pic6.jpeg",
      "stars": 5,
      "bio": "I will do python programming, scripting, automation tasks and web scraping",
    },
    {
      "name": "Aya",
      "category": "Intelligence Artificielle et Machine Learning",
      "Image": "assets/pic1.jpeg",
      "stars": 2,
      "bio": "I will develop online course content, training course, coaching program, course slides",
    },
    {
      "name": "Ayoub",
      "category": "Intelligence Artificielle et Machine Learning",
      "Image": "assets/pic2.jpeg",
      "stars": 5,
      "bio": "I will do python, java and cpp programming projects or review code",
    },
  ];

  List<String> categories = [
    "All",
    "Développement Mobile",
    "Développement Logiciel",
    "Développement  web",
    "Jeux et gaming",
    "Intelligence Artificielle et Machine Learning",
    "Cybersécurité et Hacking Éthique",
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProfiles = selectedCategory == "All"
        ? profiles
        : profiles.where((p) => p["category"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 239, 235, 240),
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('my app'),
        iconTheme: IconThemeData(color: Colors.black, size: 35.0),
        actions: [
          IconButton(
            icon: Icon(Icons.language, size: 25),
            onPressed: () {
              print("تغيير اللغة");
            },
          ),
          IconButton(
            icon: Icon(Icons.login, size: 25),
            onPressed: () {
              print('Log in');
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add, size: 25),
            onPressed: () {
              print('sign in');
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10, bottom: 5.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                firsttexts.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(252, 239, 235, 240),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: 160,
                      child: Center(
                        child: Text(
                          firsttexts[index],
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Programmation ',
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'Découvrez une sélection de freelances qualifiés prêts à donner vie à votre projet. Comparez les profils, discutez de vos besoins et engagez le talent parfait en toute simplicité ',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCategory == category
                            ? const Color.fromARGB(255, 201, 195, 195)
                            : Colors.blue[300],
                      ),
                      onPressed: () {
                        if (selectedCategory != category) {
                          setState(() {
                            selectedCategory = category;
                          });
                        }
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: filteredProfiles.map((profile) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 2),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: profile["Image"] != null &&
                                  profile["Image"]!.isNotEmpty
                                  ? AssetImage(profile["Image"]!)
                                  : AssetImage("assets/default_profile.jpg"),
                            ),
                          ),
                        ),
                        title: Text(profile["name"]!),
                        subtitle: profile["bio"] != null
                            ? Text(
                          profile["bio"]!,
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        )
                            : Text(
                          "لا يوجد نبذة",
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(
                              width: 5,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${profile["stars"]}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

