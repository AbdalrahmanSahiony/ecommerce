import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/favourite_view.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/costtum_appbar.dart';
import 'package:flutter_application_19/view/widgets/my_favourite_grid.dart';

class FavouriteSecreen extends StatelessWidget {
  const FavouriteSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavouritViewControllerImp());
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: CostuumAppBar(
            title: 'find products',
            onPressedSearch: () {},
            onPressedIcon: () {},
            onPressedFavourite: () {},
          ),
        ),
        GetBuilder<FavouritViewControllerImp>(
            builder: (controller) => RequestHandling(
                request: controller.stateRequest,
                widget: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemCount: controller.myFavourite.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        FavouriteGrid(controller.myFavourite[index]),
                  ),
                )))
      ],
    ));
  }
}
