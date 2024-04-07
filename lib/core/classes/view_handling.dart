import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/image_assets.dart';

class ViewHandling extends StatelessWidget {
  final ConectionState request;
  final Widget widget;
  const ViewHandling({super.key, required this.request, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (request == ConectionState.loading) {
      return Center(
        child: Lottie.asset(AppImageAssets.loadingLotie),
      );
    } else if (request == ConectionState.offlineFailure) {
      return const Center(
        child: Text("offlineFailure"),
      );
    } else if (request == ConectionState.serverFailure) {
      return Center(
        child: Lottie.asset(AppImageAssets.offlineLottie),
      );
    } else if (request == ConectionState.failure) {
      return Center(
        child: Lottie.asset(AppImageAssets.nodataLottie),
      );
    } else {
      return widget;
    }
  }
}

class RequestHandling extends StatelessWidget {
  final ConectionState request;
  final Widget widget;
  const RequestHandling(
      {super.key, required this.request, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (request == ConectionState.loading) {
      return Center(
        child: Lottie.asset(AppImageAssets.loadingLotie),
      );
    } else if (request == ConectionState.offlineFailure) {
      return const Center(
        child: Text("offlineFailure"),
      );
    } else if (request == ConectionState.serverFailure) {
      return Center(
        child: Lottie.asset(AppImageAssets.offlineLottie),
      );
    } else {
      return widget;
    }
  }
}
