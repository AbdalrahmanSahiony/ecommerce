import 'package:admin/core/app_routes_string.dart';
import 'package:admin/view/secreen/categories/add.dart';
import 'package:admin/view/secreen/categories/edit.dart';
import 'package:admin/view/secreen/categories/view.dart';
import 'package:admin/view/secreen/home.dart';
import 'package:admin/view/secreen/items/add.dart';
import 'package:admin/view/secreen/orders/details.dart';
import 'package:admin/view/secreen/items/edit.dart';
import 'package:admin/view/secreen/items/view.dart';
import 'package:admin/view/secreen/orders/order.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: AppRoutesString.categorisView,
    page: () => const CategoriesView(),
  ),
  GetPage(
    name: "/",
    page: () => const Home(),
  ),
  GetPage(
    name: AppRoutesString.addcategories,
    page: () => const AddCategories(),
  ),
  GetPage(
    name: AppRoutesString.editCategoris,
    page: () => const Editcategories(),
  ),
  GetPage(
    name: AppRoutesString.itemsView,
    page: () => const ItemsView(),
  ),
  GetPage(
    name: AppRoutesString.itemsEdit,
    page: () => const EditItems(),
  ),
  GetPage(
    name: AppRoutesString.itemsAdd,
    page: () => const AddItems(),
  ),
  GetPage(
    name: AppRoutesString.orders,
    page: () => const Order(),
  ),
  GetPage(
    name: AppRoutesString.details,
    page: () => const OrderDetails(),
  ),
];
