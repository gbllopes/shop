import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/widgets/auth_card.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(150, 150, 199, 0.5),
                Color.fromRGBO(200, 50, 200, 0.9),
              ], begin: Alignment.bottomLeft)),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade900,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2))
                      ],
                    ),
                    child: Text(
                      'Minha loja',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontFamily: 'Anton'),
                    ),
                  ),
                  AuthCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
