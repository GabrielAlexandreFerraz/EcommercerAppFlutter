import 'package:ecommerceappfluttter/firebase_options.dart';
import 'package:ecommerceappfluttter/provider/cart_provider.dart';
import 'package:ecommerceappfluttter/provider/favorite_provider.dart';
import 'package:ecommerceappfluttter/screens/home_screen.dart';
import 'package:ecommerceappfluttter/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Flutter',
      debugShowCheckedModeBanner: false,
      home: _auth.currentUser != null ? HomeScreen() : LoginScreen(),
    );
  }
}
