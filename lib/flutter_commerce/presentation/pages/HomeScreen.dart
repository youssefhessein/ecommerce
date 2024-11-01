import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/models/Product Model.dart';
import '../manager/CategoryCubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.dehaze)),
            SizedBox(width: 260,),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
          ],
        ),

      body: DefaultTabController(
        length: 5, // Number of categories + 1 for "All"
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'PS5'),
                Tab(text: 'PS4'),
                Tab(text: 'Xbox One'),
                Tab(text: 'Xbox One X'),
              ],
            ),
          ), // AppBar
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.white),
                      suffixIcon: Icon(Icons.filter_list, color: Colors.white),
                    ),
                    onChanged: (value) {
                      // Logic to filter products based on search term
                    },
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocProvider(
                      create: (context) => CategoryCubit('ALL'),
                      child: ProductListScreen(category: 'ALL'),
                    ),
                    BlocProvider(
                      create: (context) => CategoryCubit('PS5'),
                      child: ProductListScreen(category: 'PS5'),
                    ),
                    BlocProvider(
                      create: (context) => CategoryCubit('PS4'),
                      child: ProductListScreen(category: 'PS4'),
                    ),
                    BlocProvider(
                      create: (context) => CategoryCubit('Xbox One'),
                      child: ProductListScreen(category: 'Xbox One'),
                    ),
                    BlocProvider(
                      create: (context) => CategoryCubit('Xbox One X'),
                      child: ProductListScreen(category: 'Xbox One X'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[900],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white54,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: 0, // Use a variable to manage the selected index
            onTap: (index) {
              // Handle navigation between different screens
            },
          ),
        ), // Scaffold
      )
    );


       // DefaultTabController
  }
}