import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:delivery/connection_state.dart';
import 'package:delivery/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Curd {
// the function is retun two type of data(dartz)
  Future<Either<ConectionState, Map<String, dynamic>>> postRequest(
      String linkUrl, Map<String, dynamic> dataMap) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: dataMap);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          //return the right part of function(future of map from backend)
          return Right(responseBody);
        } else {
          //return the left part of function(future of enum conectionState)
          return const Left(ConectionState.serverFailure);
        }
      } else {
        //return the left part of function(future of enum conectionState)
        return const Left(ConectionState.offlineFailure);
      }
    } catch (_) {
      //return the left part of function(future of enum conectionState)
      return const Left(ConectionState.serverFailure);
    }
  }
}
