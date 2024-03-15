import 'dart:convert';
import 'package:final_project/model/api_model.dart';
import 'package:http/http.dart';

class ApiRepository {
  final String _apiKey = "3gkV3+owOV6DcfJHQd67QQ==uIWO60HI9E8b2fxD";
  final String _baseUrl = "https://api.api-ninjas.com/v1/motorcycles?make=kawasaki&model=ninja";

  Future<List<ApiModel>> fetchKawasakiNinja() async {
    Response response = await get(
      Uri.parse(_baseUrl),
      headers: {
        'X-Api-Key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ApiModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
