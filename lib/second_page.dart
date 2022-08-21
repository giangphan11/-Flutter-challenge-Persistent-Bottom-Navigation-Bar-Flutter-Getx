import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/first_controller.dart';
import 'package:getx_demo/home_page.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Second page"),
      ),
      backgroundColor: Colors.amberAccent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GetBuilder<FirstController>(builder: (firstController) => Container(
              height: 40,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("First value= ${firstController.firstValue}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
              ),
            ),),

            GestureDetector(
              onTap: (){
                Get.find<FirstController>().updateFirstValue();
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("update first value",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.offAll(() => MyHomePage());
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Go to Root",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
