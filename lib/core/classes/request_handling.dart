import 'package:delivery/connection_state.dart';
import 'package:delivery/core/const/image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ViewHandling extends StatelessWidget {
  final ConectionState request;
  final Widget widget;
  const ViewHandling({super.key, required this.request, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (request == ConectionState.loading) {
      return Center(
        child: Lottie.asset(AppImage.loading),
      );
    } else if (request == ConectionState.offlineFailure) {
      return const Center(
        child: Text("offlineFailure"),
      );
    } else if (request == ConectionState.serverFailure) {
      return Center(
        child: Text("data"),
      );
    } else if (request == ConectionState.failure) {
      return Center(
        child: Lottie.asset(AppImage.fauler),
      );
    } else {
      return widget;
    }
  }
}
