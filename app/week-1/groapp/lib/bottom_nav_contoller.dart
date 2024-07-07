import 'package:get/get.dart';
import 'home_page.dart';
import 'barscan.dart';
import 'data_base.dart';

class BottomNavContoller extends GetxController {
  RxInt index = 0.obs;

  var pages = [HomePage(), Bar_scan(), DataBase()];
}
