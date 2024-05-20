import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappfluttter/screens/home_screen.dart';
import 'package:ecommerceappfluttter/screens/login_screen.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/widgets/round_gradient_button.dart';
import 'package:ecommerceappfluttter/widgets/round_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection("users");

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isObscure = true;
  bool _isCheck = false;
  final _formKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 23),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: media.width * 0.02),
                  SizedBox(
                    width: media.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: media.width * 0.03,
                        ),
                        const Text(
                          "Dark Skull",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.02,
                        ),
                        const Text(
                          "Criar Conta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  RoundTextField(
                    textEditingController: _firstNameController,
                    hintText: "Nome",
                    icon: "assets/profile.png",
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor coloque seu primeiro nome";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  RoundTextField(
                    textEditingController: _lastNameController,
                    hintText: "Sobrenome",
                    icon: "assets/profile.png",
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor coloque seu sobrenome";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  RoundTextField(
                    textEditingController: _emailController,
                    hintText: "Email",
                    icon: "assets/email.png",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor crie seu email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  RoundTextField(
                    textEditingController: _passController,
                    hintText: "Senha",
                    icon: "assets/cadeado.png",
                    textInputType: TextInputType.text,
                    isObsecureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor crie sua senha";
                      } else if (value.length < 6) {
                        return "Senha deve ter mais que 6 carateres";
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
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isCheck = !_isCheck;
                          });
                        },
                        icon: Icon(
                          _isCheck
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        "Para continuar aceite as Politicas Privadas e\n termos de uso",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  RoundGradientButton(
                    title: "Criar Conta",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_isCheck) {
                          try {
                            UserCredential userCredential =
                                await _auth.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passController.text,
                            );
                            String uid = userCredential.user!.uid;

                            await _users.doc(uid).set({
                              'email': _emailController.text,
                              'firstName': _firstNameController.text,
                              'lastName': _lastNameController.text,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Conta Criada com Sucesso")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayLightColor.withOpacity(0.5),
                        ),
                      ),
                      const Text(
                        "   or    ",
                        style: TextStyle(
                          color: AppColors.grayLightColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayLightColor.withOpacity(0.5),
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
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(text: "Tem conta criada?   "),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
