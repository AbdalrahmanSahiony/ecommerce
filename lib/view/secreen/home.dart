import 'package:admin/controller/home_controller.dart';
import 'package:admin/view/widget/home_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeConroller controller = Get.put(HomeConroller());
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => HomeGrid(
                onTap: () {
                  controller.goToPage(controller.home[index]["route"]);
                },
                imgUrl: controller.home[index]["image"],
                text: controller.home[index]["text"]),
          ),
        ));
  }
}
