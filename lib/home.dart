import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIdex = 0;

  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Sobre'),
    ),
    const Center(
      child: Text('Formação e Experiência'),
    ),
    const Center(
      child: Text('Habilidades'),
    ),
  ];

  final items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Sobre',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Formação e Experiência',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Habilidades',
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
        currentIndex: _currentIdex,
        items: items,
        onTap: _onTap,
      ),
    );
  }
}
