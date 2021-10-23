import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/controllers/search_controller.dart';
import 'package:webandcrafts_employee_app/utils/styles.dart';
import 'package:webandcrafts_employee_app/view/employee_details_page.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key key}) : super(key: key);
  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        builder: (_) => searchController.searchResult != null
            ? Container(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(searchController.searchResult.name),
            ),
            onTap: () {
              Get.to(() => EmployeeDetailsPage(
                employeeData: searchController.searchResult,
              ));
            },
          ),
        )
            : searchController.searchTextController.text != null &&
            searchController.searchTextController.text.isNotEmpty
            ? const Center(
          child: Text(
            "No results found",
            style: AppStyles.normalTextStyle,
          ),
        )
            : Container());
  }
}
