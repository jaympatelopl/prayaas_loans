import 'package:get/get.dart';
import 'package:prayaas_loans/view/dashboard/adhar_verifaction/adhar_verifaction_controller.dart';

class AadharVerifactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AadharVerifactionController>(AadharVerifactionController());
  }
}
