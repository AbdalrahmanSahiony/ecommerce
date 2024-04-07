import 'package:admin/core/constant/app_link.dart';
import 'package:admin/data/model/items_model.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final ItemsModel itemsModel;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;
  const CardItem(
      {super.key,
      required this.itemsModel,
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
              child: Image.network(
                  height: 100,
                  "${AppLink.itemsImage}/${itemsModel.itemsImage}")),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    itemsModel.itemsName.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(itemsModel.itemsDate.toString())
                ],
              )),
          IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(Icons.delete_outline)),
          IconButton(onPressed: onPressedEdit, icon: const Icon(Icons.edit)),
          if (itemsModel.itemsActive == 0) const Icon(Icons.hide_source),
        ],
      ),
    );
  }
}
