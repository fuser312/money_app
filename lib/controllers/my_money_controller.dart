import 'package:get/get.dart';
import 'package:money_app/models/money_model.dart';

class MyMoneyController extends GetxController{
  static MyMoneyController get  to => Get.find<MyMoneyController>();
  final finalAmount = 150.25.obs;

  final recentActivity = [
    MoneyModel(amount: 32.00, date: '2021-08-18', isTopUp: false, name: 'John Snow'),
    MoneyModel(amount: 65.00, date: '2021-08-18', isTopUp: false, name: 'Ned Stark'),
    MoneyModel(amount: 150.00, date: '2021-08-19', isTopUp: true),
    MoneyModel(amount: 90.00, date: '2021-08-19', isTopUp: false, name: 'Arya Stark'),
    MoneyModel(amount: 200.00, date: '2021-08-19', isTopUp: true)
  ].obs;



  @override
  void onInit() {
    super.onInit();
  }

  addTransaction(MoneyModel transaction){
    recentActivity.add(transaction);
  }

  // createDateList(){
  //   List<String> dateList = [];
  //   for(int i = 0; i< )
  // }

  incrementAmount(double amount){
    finalAmount(finalAmount.value + amount);
  }

  decrementAmount(double amount){
    finalAmount(finalAmount.value - amount);
  }


}