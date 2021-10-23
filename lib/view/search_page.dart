import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/controllers/search_controller.dart';
import 'package:webandcrafts_employee_app/utils/colors.dart';
import 'package:webandcrafts_employee_app/view/search_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key}) : super(key: key);
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: 40.0,
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: TextField(
              decoration:
                  const InputDecoration(hintText: " Search name or Email"),
              controller: searchController.searchTextController,
              onChanged: (keyword) {
                if (keyword.isNotEmpty && keyword.length >= 3) {
                  searchController.searchWithKeyword(keyword);
                }
              }),
        ),
      ),
      body: SearchWidget(),
    );
  }
}
