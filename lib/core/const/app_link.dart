class AppLink {
  static const String sever = "https://aboodnote.000webhostapp.com/shop";
  static const String login = "$sever/delivery/auth/login.php";
  //order
  static const String approve = "$sever/delivery/orders/approved.php";
  static const String archiveOrders = "$sever/delivery/orders/archive.php";
  static const String doneOrders = "$sever/delivery/orders/done.php";
  static const String waitingOrders =
      "$sever/delivery/orders/order_waiting_view.php";
  static const String approvedOrdersView =
      "$sever/delivery/orders/approver_view.php";
  static const orderDetailsView = "$sever/orders/order_details_view.php";
}
