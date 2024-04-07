import 'package:delivery/core/app_routes_string.dart';
import 'package:delivery/core/midlewhere/my_midle_where.dart';
import 'package:delivery/view/secreen/home_secreen.dart';
import 'package:delivery/view/secreen/login.dart';
import 'package:delivery/view/secreen/order_details.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const LogIn(), middlewares: [MyMiddleWhere()]),
  GetPage(
    name: AppRoutesString.home,
    page: () => const HomeSecreen(),
  ),
  GetPage(name: AppRoutesString.orderDetails, page: () => const OrderDetails()),
];
