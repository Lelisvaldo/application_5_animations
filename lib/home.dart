import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
          child: AnimatedContainer(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 800),
            height: 80,
            width: isLoading ? 80 : 350,
            color: Colors.red,
            alignment: Alignment.center,
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Padding (
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
              secondChild: Text(
                "ENTRAR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              crossFadeState: isLoading
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
      ),
    );
  }
}
