import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/controllers/home_controller.dart';
import 'package:webandcrafts_employee_app/models/employee_response.dart';
import 'package:webandcrafts_employee_app/utils/database.dart';

class SearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  final HomeController homeController = Get.find();
  EmployeeData searchResult;

  void searchWithKeyword(keyword) async {
    var EmployeeSearchResult =
        await DBHelper.instance.getEmployeeList(keyword);
    print("********");
    print(EmployeeSearchResult.toString());
    print("********");
    print(EmployeeSearchResult);
    print(searchTextController.text);
    searchResult = homeController.employeeData
        .where((employee) =>
            employee.name
                .toLowerCase()
                .contains(searchTextController.text.toLowerCase()) ||
            employee.email
                .toLowerCase()
                .contains(searchTextController.text.toLowerCase()))
        .toList()
        .first;
    update();
  }
}
