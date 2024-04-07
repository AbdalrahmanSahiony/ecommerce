import 'dart:convert';
import 'dart:io';
import 'package:admin/connection_state.dart';
import 'package:admin/core/function/check_internet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('wael:wael12345'));
Map<String, String> myheaders = {'authorization': _basicAuth};

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

  Future<Either<ConectionState, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(ConectionState.serverFailure);
    }
  }
}
