import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ScreenA1()));
              },
              child: Container(
                width: 100,
                height: 40,
                color: Colors.deepOrangeAccent,
                child: Center(
                  child: Text("gheghe"),
                ),
              ),
            )
          ],
        )
    );
  }
}

class ScreenA1 extends StatelessWidget {
  const ScreenA1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}

