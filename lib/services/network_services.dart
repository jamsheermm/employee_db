import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webandcrafts_employee_app/models/employee_response.dart';
import 'package:webandcrafts_employee_app/utils/constants.dart';

class Apis {
  static const String url = Constants.baseUrl;

  Future<List<EmployeeData>> getEmployeeData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<EmployeeData> employeeList = [];
      if (json != null) {
        json.forEach((v) {
          employeeList.add(EmployeeData.fromJson(v));
        });
      }
      return employeeList;
    } else {
      throw (exception) {
        print(exception);
        return null;
      };
    }
  }
}
