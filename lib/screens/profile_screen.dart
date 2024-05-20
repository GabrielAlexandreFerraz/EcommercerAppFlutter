import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [Text("Profile Screen LET'S GOooooooooooooo")],
                ),
              ),
              // Conteúdo da tela aqui
            ],
          ),
        ),
      ),
    );
  }
}
