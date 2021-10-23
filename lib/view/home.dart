import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/controllers/home_controller.dart';
import 'package:webandcrafts_employee_app/utils/colors.dart';
import 'package:webandcrafts_employee_app/utils/constants.dart';
import 'package:webandcrafts_employee_app/view/employee_card_model.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(Constants.homePageTitle),
          actions: [
            IconButton(
                onPressed: homeController.searchButtonAction,
                icon: const Icon(Icons.search))
          ],
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          if (homeController.employeeData != null &&
              homeController.employeeData.isNotEmpty) {
            return ListView.builder(
              itemCount: homeController.employeeData.length,
              itemBuilder: (context, index) {
                return EmployeeCard(
                    name: homeController.employeeData[index].name ?? "",
                    id: homeController.employeeData[index].id,
                    image: homeController.employeeData[index].profileImage,
                    company: homeController.employeeData[index].company !=
                        null &&
                        homeController.employeeData[index].company.name !=
                            null
                        ? homeController.employeeData[index].company.name
                        : "");
              },
            );
          } else if (homeController.loading.value) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                    strokeWidth: 3.5));
          } else {
            return Container();
          }
        }));
  }
}
