import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/CategoryCubit.dart';
import 'CartScreen.dart';
import 'FavoritesScreen.dart';
import 'ProductListScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    CategoryCubit cubit = CategoryCubit.get(context);
    return Scaffold(appBar: AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.dehaze)),
        const SizedBox(width: 260) ,
        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))]
    ),
     body:   DefaultTabController(
      length: 5, // Number of categories + 1 for "All"
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: const InputDecoration(
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
                    child: const ProductListScreen(category: 'ALL'),
                  ),
                  BlocProvider(
                    create: (context) => CategoryCubit('PS5'),
                    child: const ProductListScreen(category: 'PS5'),
                  ),
                  BlocProvider(
                    create: (context) => CategoryCubit('PS4'),
                    child: const ProductListScreen(category: 'PS4'),
                  ),
                  BlocProvider(
                    create: (context) => CategoryCubit('Xbox One'),
                    child: const ProductListScreen(category: 'Xbox One'),
                  ),
                  BlocProvider(
                    create: (context) => CategoryCubit('Xbox One X'),
                    child: const ProductListScreen(category: 'Xbox One X'),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
          onTap: (index) {
            if (cubit.changeIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            } else if (cubit.changeIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            }
            // Handle other navigation between different screens
          },
        ),
      ), // Scaffold
    )
    );// DefaultTabController
  }
}