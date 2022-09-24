import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/audio/audio_page.dart';
import 'package:getx_demo/audio2/audio_page2.dart';
import 'package:getx_demo/bottom_navigation/main_bottom_navigation.dart';
import 'package:getx_demo/controllers/tap_controller.dart';
import 'package:getx_demo/first_page.dart';
import 'package:getx_demo/nav2/nav_new2.dart';
import 'package:getx_demo/purcharse/purchase_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TapController tapController = Get.put(TapController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Getx demo"),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GetBuilder<TapController>(builder: (_) => Container(
              height: 40,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("x = ${tapController.x}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
              ),
            )),
            GestureDetector(
              onTap: (){
                tapController.tangX();
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Tang x",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
               Get.to(
                       () => FirstPage(),
                 transition: Transition.leftToRight
               );
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Go to First page",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => MainBottomNavigation());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Test back stack bottom navigation",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => NavigationNew2());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("navi2 ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => TestAudioPage());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Test music service",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => AudioPage2());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Test music service 2",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => PurcharsePage());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("In app purcharse (consumables)",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("In app purcharse (non-consumables)",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
