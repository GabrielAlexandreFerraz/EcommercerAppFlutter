import 'package:ecommerceappfluttter/screens/cart_screen.dart';
import 'package:ecommerceappfluttter/screens/favorite_screen.dart';
import 'package:ecommerceappfluttter/screens/login_screen.dart';
import 'package:ecommerceappfluttter/screens/main_content.dart';
import 'package:ecommerceappfluttter/screens/profile_screen.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/widgets/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  User? user;
  int currentIndex = 1; // Index para a MainContentScreen
  FocusNode searchFocusNode = FocusNode();
  PageController _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
    checkUserAuth();
    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  Future<void> checkUserAuth() async {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void navigateToIndex(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.exit_to_app, color: Colors.white),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          FavoriteScreen(),
          MainContentScreen(), // Tela principal da Home
          CartScreen(pageController: _pageController),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: navigateToIndex,
      ),
    );
  }
}
