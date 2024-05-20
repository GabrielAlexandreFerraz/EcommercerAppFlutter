import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [Text("Favorite Screen LETS GO")],
                ),
              ),
              //conteudo da tela Aqui
            ],
          ),
        ),
      ),
    );
  }
}
