import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/midlewhere/my_midlewhere.dart';
import 'package:flutter_application_19/view/secreens/address/edit_address.dart';
import 'package:flutter_application_19/view/secreens/address/view_address.dart';
import 'package:flutter_application_19/view/secreens/address/add_address.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/forget_password.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/succes_reset_password.dart';
import 'package:flutter_application_19/view/secreens/auth/logIn.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/reset_password.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/verfiy_code.dart';
import 'package:flutter_application_19/view/secreens/auth/succes_sinup.dart';
import 'package:flutter_application_19/view/secreens/auth/verfiycode_signup.dart';
import 'package:flutter_application_19/view/secreens/cart.dart';
import 'package:flutter_application_19/view/secreens/checkout.dart';
import 'package:flutter_application_19/view/secreens/chose_language.dart';
import 'package:flutter_application_19/view/secreens/favourite.dart';
import 'package:flutter_application_19/view/secreens/home.dart';
import 'package:flutter_application_19/view/secreens/home_secreen.dart';
import 'package:flutter_application_19/view/secreens/items.dart';
import 'package:flutter_application_19/view/secreens/items_details.dart';
import 'package:flutter_application_19/view/secreens/onBording.dart';
import 'package:flutter_application_19/view/secreens/auth/signUp.dart';
import 'package:flutter_application_19/view/secreens/orders/order_details.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/view/secreens/orders/archive.dart';
import 'package:flutter_application_19/view/secreens/orders/pinding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.logIn, page: () => const LogIn()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.onBording, page: () => const OnBording()),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verfieyCod,
    page: () => const VerfieyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.succsesRestPassword,
    page: () => const SuccesResetPassword(),
  ),
  GetPage(
    name: AppRoutes.succsesSignup,
    page: () => const SuccesSignup(),
  ),
  GetPage(
    name: AppRoutes.verfieyCodSignup,
    page: () => const VerfieyCodeSignup(),
  ),
  GetPage(name: '/', page: () => const ChoseLanguage(), middlewares: [
    MyMiddleWhere(),
  ]),
  GetPage(
    name: "/home",
    page: () => const Home(),
  ),
  GetPage(
    name: "/homeSecreen",
    page: () => const HomeSecreen(),
  ),
  GetPage(
    name: "/items",
    page: () => const Item(),
  ),
  GetPage(
    name: "/itemsDetails",
    page: () => const ItemsDetails(),
  ),
  GetPage(
    name: "/favourite",
    page: () => const FavouriteSecreen(),
  ),
  GetPage(
    name: "/cart",
    page: () => const Cart(),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => const AddAddress(),
  ),
  GetPage(
    name: AppRoutes.viewAddress,
    page: () => const ViewAddress(),
  ),
  GetPage(
    name: AppRoutes.editAddress,
    page: () => const EditAddress(),
  ),
  GetPage(
    name: AppRoutes.checkout,
    page: () => const Checkout(),
  ),
  GetPage(
    name: AppRoutes.pindingOrders,
    page: () => const PindingOrders(),
  ),
  GetPage(
    name: AppRoutes.archiveOrders,
    page: () => const ArchiveOrders(),
  ),
  GetPage(
    name: AppRoutes.orderDetails,
    page: () => const OrderDetails(),
  ),
];
/*Map<String, Widget Function(BuildContext)> routes = {
  //AppRoutes.logIn: (context) => const LogIn(),
 // AppRoutes.onBording: (context) => const OnBording(),
 // AppRoutes.signUp: (context) => const SignUp(),
 // AppRoutes.forgetPassword: (context) => const ForgetPassword(),
 // AppRoutes.verfieyCod: (context) => const VerfieyCode(),
  //AppRoutes.resetPassword: (context) => const ResetPassword(),
  AppRoutes.succsesRestPassword: (context) => const SuccesResetPassword(),
  AppRoutes.succsesSignup: (context) => const SuccesSignup(),
  AppRoutes.verfieyCodSignup: (context) => const VerfieyCodeSignup(),
};*/
