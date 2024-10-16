import 'package:flutter/material.dart';
import 'package:swish/Auth/auth.dart';

class StackBlock extends StatelessWidget {
  final String title;
  final Widget screen;
  final double height;
  final double width;
  final Color blockColor;
  final Color textColor;
  final bool isAuth;

  const StackBlock({super.key, required this.title, required this.screen, required this.blockColor, required this.textColor, required this.isAuth, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isAuth) {
          final user = await Auth().loginwithGoogle();
                if (user != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
                }
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        }
      },
      child: SizedBox(
        height: 100,
        width: 300,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 20,
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: blockColor,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16,color: textColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
