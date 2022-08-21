import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/first_controller.dart';
import 'package:getx_demo/controllers/tap_controller.dart';
import 'package:getx_demo/second_page.dart';

class FirstPage extends StatelessWidget {

  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FirstController firstController = Get.put(FirstController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text("First page"),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           GetBuilder<FirstController>(builder: (_) => Container(
             height: 40,
             margin: EdgeInsets.all(16),
             decoration: BoxDecoration(
                 color: Colors.blueAccent,
                 borderRadius: BorderRadius.circular(20)
             ),
             child: Center(
               child: Text("first controller value = ${firstController.firstValue}",
                 style: TextStyle(
                     fontWeight: FontWeight.w500,
                     color: Colors.white
                 ),),
             ),
           )),
            GetBuilder<TapController>(builder: (tapController) => Container(
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
                  ),
                ),
              ),
            )),
            GestureDetector(
              onTap: (){
                Get.find<TapController>().giamX();
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Giam X",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => SecondPage());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Go to Second page",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
               firstController.updateFirstValue();
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Update first value",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
