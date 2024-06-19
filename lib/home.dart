import 'package:flutter/material.dart';
import 'package:tiagors09_github_io/projects.dart';
import 'package:tiagors09_github_io/training_and_experience.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIdex = 0;

  final screens = [
    const HomeScreen(),
    const TrainingAndExperience(),
    const Projects(),
  ];

  final items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Experiência e Formação',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Projetos',
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: screens[_currentIdex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIdex,
        items: items,
        onTap: _onTap,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenLeft = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenHeight * 0.5,
          color: Colors.amber,
        ),
        Positioned(
          top: (screenHeight * 0.5) - 150,
          left: (screenLeft * 0.25) - 150,
          right: (screenLeft * 0.25) - 150,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(360),
                ),
                child: Image.asset(
                  'assets/images/profile_pic.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Text(
                      'Tiago Rodrigues Sousa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Desenvolvedor de Aplicações Móveis | Dart & Flutter',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
