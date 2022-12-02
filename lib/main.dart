import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/home_screen.dart';
import 'package:wetherapp/provider_class.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (context)=>HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
        },
      ),
    )
  );
}