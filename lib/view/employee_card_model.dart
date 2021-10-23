import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/controllers/home_controller.dart';
import 'package:webandcrafts_employee_app/utils/styles.dart';

class EmployeeCard extends StatelessWidget {
  EmployeeCard({Key key, this.name, this.id, this.company, this.image})
      : super(key: key);

  final String name;
  final String company;
  final String image;
  final int id;

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => homeController.onPressedEmployeeCard(id),
      child: Container(
        height: Get.height / 6,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "",
                        style: AppStyles.boldTextStyle,
                      ),
                      Text(
                        company ?? "",
                        style: AppStyles.normalTextStyle,
                      ),
                    ],
                  ),
                  image != null
                      ? Image.network(image)
                      : const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}