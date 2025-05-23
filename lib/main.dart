import 'package:flu_new/profile_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
// import 'search_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 107, 215, 53)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 238, 240, 238)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomePage(),
            UserProfileScreen(),
          ],
        ),
        bottomNavigationBar: Material(
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.white,
          child: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Listing'),
              // Tab(icon: Icon(Icons.add), text: 'Add'),
              Tab(icon: Icon(Icons.person), text: 'Profile')
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.lightGreen,
            indicatorColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

