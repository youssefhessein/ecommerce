import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/FavoritesCubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favoriteItems.isEmpty) {
            return const Center(
              child: Text('No favorite items'),
            );
          }
          return ListView.builder(
            itemCount: state.favoriteItems.length,
            itemBuilder: (context, index) {
              final product = state.favoriteItems[index];
              return ListTile(
                leading: Image.asset(product['image'], width: 50, height: 50),
                title: Text(product['name']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    BlocProvider.of<FavoritesCubit>(context).removeFavorite(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
