import 'package:get/get.dart';
import 'package:letutor/screen/pdf_view/pdf_controller.dart';



class PdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PdfController());
  }
}
