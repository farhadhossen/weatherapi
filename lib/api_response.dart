
import 'package:http/http.dart' as http;
import 'package:weatherapi/api_model.dart';


class ApiResponse{


  Future<ApiModel> getApiData() async {
    var apiUrl = Uri.parse('http://api.openweathermap.org/data/2.5/weather?id=2172797&appid=b84938944191ec3ea60a01407d3286c0');

    final response = await http.get(apiUrl);



    return apiModelFromJson(response.body);
  }
}