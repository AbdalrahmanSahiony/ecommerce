import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController id;
  final String title;
  final List<SelectedListItem> dropDownListItems;
  const DropDownList(
      {super.key,
      required this.name,
      required this.id,
      required this.title,
      required this.dropDownListItems});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  void showDropLis() {
    DropDownState(
      DropDown(
        data: widget.dropDownListItems,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.name.text = selectedListItem.name;
          widget.id.text = selectedListItem.value!;
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.name,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropLis();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          hintText: widget.title,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ));
  }
}
