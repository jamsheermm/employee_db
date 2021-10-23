import 'package:flutter/material.dart';
import 'package:webandcrafts_employee_app/models/employee_response.dart';
import 'package:webandcrafts_employee_app/utils/colors.dart';
import 'package:webandcrafts_employee_app/utils/constants.dart';
import 'package:webandcrafts_employee_app/utils/styles.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({Key key, this.employeeData}) : super(key: key);

  final EmployeeData employeeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.detailsPageTitle),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              employeeData.profileImage != null
                  ? Image.network(employeeData.profileImage)
                  : const Icon(
                      Icons.person,
                      size: 100.0,
                    ),
              Text(
                employeeData.name ?? "",
                style: AppStyles.titleStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Employee ID:"),
                  Text(employeeData.id.toString() ?? ""),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("User Name:"),
                  Text(employeeData.username ?? ""),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email),
                  Text(employeeData.email ?? ""),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.language),
                  Text(employeeData.website ?? ""),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Company Details",
                style: AppStyles.boldTextStyle,
              ),
              Text(
                employeeData.company != null &&
                        employeeData.company.name != null
                    ? employeeData.company.name
                    : "",
                style: AppStyles.normalTextStyle,
              ),
              Text(
                employeeData.company != null && employeeData.company.bs != null
                    ? employeeData.company.bs
                    : "",
                style: AppStyles.normalSmallTextStyle,
              ),
              Text(
                  employeeData.company != null &&
                          employeeData.company.catchPhrase != null
                      ? employeeData.company.catchPhrase
                      : "",
                  style: AppStyles.normalSmallTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}
