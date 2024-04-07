class AppLink {
  static const String sever = "https://aboodnote.000webhostapp.com/shop";
  static const String test = "$sever/test.php";
  static const String home = "$sever/home.php";
  //----------------------- items ---------------------
  static const String item = "$sever/item/item.php";
  static const String searchItem = "$sever/item/search.php";
  static const String itemTopSelling = "$sever/item/top_selling.php";
  //---------------------- auth --------------------------------
  static const String signup = "$sever/auth/signup.php";
  static const String veryfieycode = "$sever/auth/veryfieycode.php";
  static const String login = "$sever/auth/login.php";
  //------------------------forgetPassword--------------------
  static const String checkEmail = "$sever/auth/forgetpassword/check_email.php";
  static const String resetPassword =
      "$sever/auth/forgetpassword/reset_password.php";
  static const String veryfieycodeForgetPassword =
      "$sever/auth/forgetpassword/veryfieycode_forget_password.php";
  static const String resendVeryfieycode = "$sever/resondVerifiyCode.php";
  //-----------------------------image--------------------------
  static const String image = "$sever/upload";
  static const String categoriesImage = "$sever/upload/categories";
  static const String itemsImage = "$sever/upload/items";
  //------------------------------ favourite ----------------------------------
  static const addFavourite = "$sever/favourite/addFavourite.php";
  static const removeFavourite = "$sever/favourite/deleteFavourite.php";
  static const viewFavourite = "$sever/favourite/favouriteView.php";
  static const deleteFavId = "$sever/favourite/deleteFavouriteId.php";
//------------------------------------ cart ----------------------------
  static const addCart = "$sever/cart/add_cart.php";
  static const deleteCart = "$sever/cart/delete.php";
  static const viewCart = "$sever/cart/cart_view.php";
  static const viewAllCart = "$sever/cart/cart_all_view.php";
  //----------------------------- address --------------------------
  static const addAdress = "$sever/address/add.php";
  static const viewAdress = "$sever/address/view.php";
  static const deleteAdress = "$sever/address/delete.php";
  static const editAdress = "$sever/address/edit.php";
  //------------------------------- coupon ---------------
  static const checkCoupon = "$sever/coupon/check_coupon.php";
  //-------------------------------- orders -------------------
  static const checkout = "$sever/orders/add.php";
  static const pindingOrders = "$sever/orders/pending.php";
  static const archiveOrders = "$sever/orders/archive.php";
  static const notificationView = "$sever/orders/notification_view.php";
  static const orderDetailsView = "$sever/orders/order_details_view.php";
  static const orderDelete = "$sever/orders/delete.php";
  static const orderRating = "$sever/orders/order_rating.php";
  //------------------------------ offers -----------------------------
  static const offersView = "$sever/offers_view.php";
}
