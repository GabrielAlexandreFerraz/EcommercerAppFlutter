import 'package:ecommerceappfluttter/screens/home_screen.dart';
import 'package:ecommerceappfluttter/screens/sign_screen.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/widgets/round_gradient_button.dart';
import 'package:ecommerceappfluttter/widgets/round_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScree extends StatefulWidget {
  const LoginScree({super.key});

  @override
  State<LoginScree> createState() => _LoginScreeState();
}

class _LoginScreeState extends State<LoginScree> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  Future<User?> _signIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = userCredential.user;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Falha no Login, Confira seu email e senha"),
        ),
      );
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: media.height * 0.02),
                SizedBox(
                  width: media.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      const Text(
                        "Bem vindo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.04,
                      ),
                      const Text(
                        "Ecommerce Dark Skull",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.05,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/trevo.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit
                                .cover, // Ajuste da imagem para cobrir o container
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.06,
                      ),
                      RoundTextField(
                        textEditingController: _emailController,
                        hintText: "Email",
                        icon: "assets/email.png",
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor coloque seu email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      RoundTextField(
                        textEditingController: _passController,
                        hintText: "Senha",
                        icon: "assets/cadeado.png",
                        textInputType: TextInputType.text,
                        isObsecureText: _isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor coloque sua Senha";
                          } else if (value.length < 6) {
                            return "Senha com menos de 6 characters";
                          }
                          return null;
                        },
                        rightIcon: TextButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              _isObscure
                                  ? "assets/olhoFechado.png"
                                  : "assets/olhoAberto.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              color: AppColors.grayDarkColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      RoundGradientButton(
                        title: "Login",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signIn(context, _emailController.text,
                                _passController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              height: 1,
                              color: AppColors.grayMediumColor.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            "   or    ",
                            style: TextStyle(
                              color: AppColors.grayMediumColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              height: 1,
                              color: AppColors.grayMediumColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/google.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/facebook.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              color: AppColors.grayMediumColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(text: "Don't have an account?   "),
                              TextSpan(
                                text: "Register",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
