import 'package:get/get.dart';
import 'package:webandcrafts_employee_app/models/employee_response.dart';
import 'package:webandcrafts_employee_app/services/network_services.dart';
import 'package:webandcrafts_employee_app/utils/database.dart';
import 'package:webandcrafts_employee_app/view/employee_details_page.dart';
import 'package:webandcrafts_employee_app/view/search_page.dart';

class HomeController extends GetxController {
  List<EmployeeData> employeeData = [];
  RxBool loading = false.obs;

  @override
  void onInit() {
    getEmployeeData();
    super.onInit();
  }

  void getEmployeeData() async {
    try {
      loading(true);
      final data = await Apis().getEmployeeData();
      if (data != null) {
        employeeData = data;
        await DBHelper.instance.initDb();
        for (EmployeeData employee in data) {
          if (employee != null) {
           await DBHelper.instance.add(employee);
          }
        }
      }
    } finally {
      loading(false);
      update();
    }
  }

  void searchButtonAction() {
    Get.to(() => SearchPage());
  }

  void onPressedEmployeeCard(int id) {
    Get.to(() => EmployeeDetailsPage(
        employeeData: employeeData.where((element) => element.id == id).first));
  }
}
