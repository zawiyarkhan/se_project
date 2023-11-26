// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:se_pro/Controllers/google_signIn_provider.dart';
import 'package:se_pro/main.dart';
import 'package:se_pro/models/user_model.dart';
import 'package:se_pro/pages/Home.dart';


final user = FirebaseAuth.instance.currentUser;

class GoogleRegister extends StatefulWidget {
  const GoogleRegister({super.key});

  @override
  State<GoogleRegister> createState() => _GoogleRegisterState();
}

class _GoogleRegisterState extends State<GoogleRegister> {
  List<String> list_uid = [];
  void makeNewUser() async {
    if (list_uid.contains(user!.uid)) {
      return;
    } else {
      final newUser = UserQ(
        name: user!.displayName,
        id: user!.uid,
        profilePic: user!.photoURL,
      );
      bool create = await newUser.createUser();
      list_uid.add(user!.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              makeNewUser();
              return Home(
                user: user,
              );
            } else if (snapshot.hasError) {
              Text("something went wrong");
            }
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Quixlet",
                        style: GoogleFonts.satisfy(
                            fontSize: 60, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "SignIn with your Google account to continue",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(width / 2, 60),
                        side: BorderSide(color: Colors.black, width: 1.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      label: Text(
                        "Google",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}