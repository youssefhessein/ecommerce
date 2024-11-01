import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'flutter_commerce/presentation/manager/HomeCubit.dart';
import 'flutter_commerce/presentation/pages/HomeScreen.dart';


void main (){
  runApp(const MyApp()) ;
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark() ,
     home:  BlocProvider(create: (context) => HomeCubit() ,
    child: HomeScreen()),

    );
  }
}
