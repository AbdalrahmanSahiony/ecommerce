import 'package:admin/core/constant/app_link.dart';
import 'package:admin/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cardcategories extends StatelessWidget {
  final CategorisModel categorisModel;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;
  const Cardcategories(
      {super.key,
      required this.categorisModel,
      this.onPressedDelete,
      this.onPressedEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 1,
              child: SvgPicture.network(
                  height: 100,
                  "${AppLink.catImage}/${categorisModel.categoriesImage}")),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    categorisModel.categoriesName.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(categorisModel.categoriesDateCreate.toString())
                ],
              )),
          IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(Icons.delete_outline)),
          IconButton(
              onPressed: onPressedEdit, icon: const Icon(Icons.edit_outlined))
        ],
      ),
    );
  }
}
