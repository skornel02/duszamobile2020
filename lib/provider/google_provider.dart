import 'dart:convert';

import 'package:duszamobile2020/provider/car_provider.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:http/http.dart';

class GoogleCarProvider extends CarProvider {
  final String _accessToken;

  GoogleCarProvider(this._accessToken);

  Future<String> _getDBFileIdFromDrive() async {
    final Map<String, String> queryParameters = {
      'spaces': 'appDataFolder',
      'q': 'name = "cars.json"',
    };
    final headers = {'Authorization': 'Bearer $_accessToken'};
    final uri =
        Uri.https('www.googleapis.com', '/drive/v3/files', queryParameters);
    final response = await get(uri, headers: headers);
    Map<String, dynamic> parsed = jsonDecode(response.body);
    try {
      String id = parsed["files"][0]["id"];
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<DateTime> _getLastChangedDateDrive(String fileId) async {
    final headers = {'Authorization': 'Bearer $_accessToken'};
    final url =
        'https://www.googleapis.com/drive/v3/files/$fileId?fields=modifiedTime';
    final response = await get(url, headers: headers);
    DateTime time = DateTime.parse(jsonDecode(response.body)["modifiedTime"]);
    return time;
  }

  @override
  Future<DateTime> lastModified() async {
    var fileId = await _getDBFileIdFromDrive();
    if (fileId == null) return DateTime.parse("1999-01-01T00:00:01Z");
    return _getLastChangedDateDrive(fileId);
  }

  @override
  Future<List<Car>> loadCars() async {
    final fileId = await _getDBFileIdFromDrive();
    if (fileId == null) {
      return List();
    } else {
      final headers = {'Authorization': 'Bearer $_accessToken'};
      final url = 'https://www.googleapis.com/drive/v3/files/$fileId?alt=media';
      final response = await get(url, headers: headers);
      return this.parseStringToCars(utf8.decode(response.bodyBytes));
    }
  }

  @override
  Future<void> saveCars(List<Car> cars) async {
    final fileId = await _getDBFileIdFromDrive();
    if (fileId == null) {
      final headers = {
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      };
      final initialQueryParameters = {'uploadType': 'resumable'};
      final Map<String, dynamic> metaData = {
        'name': "cars.json",
        'parents': ['appDataFolder']
      };
      final initiateUri = Uri.https('www.googleapis.com',
          '/upload/drive/v3/files', initialQueryParameters);
      final initiateResponse = await post(initiateUri,
          headers: headers, body: json.encode(metaData));
      final location = initiateResponse.headers['location'];

      final headers2 = {'Authorization': 'Bearer $_accessToken'};
      final uploadUri = Uri.parse(location);
      final uploadResponse =
          await put(uploadUri, headers: headers2, body: json.encode(cars));
      print("Upload result: $uploadResponse");
      print(uploadResponse.body);
    } else {
      final headers = {
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      };
      final initiateUri =
          Uri.https('www.googleapis.com', '/upload/drive/v3/files/$fileId');
      await patch(initiateUri, headers: headers, body: json.encode(cars));
    }
  }
}
