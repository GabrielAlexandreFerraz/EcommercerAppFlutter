import 'package:ecommerceappfluttter/screens/login_screen.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  bool on = true;

  @override
  void initState() {
    super.initState();
    checkUserAuth();
  }

  Future<void> checkUserAuth() async {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Se o usuário não estiver autenticado, redireciona para a tela de login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScree()),
      );
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.grayMediumColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Logado com email: ${user?.email ?? "Usuário Não Logado"}',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScree()),
                );
              },
              icon: Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ));
  }
}
