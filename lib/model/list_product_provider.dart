import 'cart_model.dart';
import 'db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListProductProvider with ChangeNotifier {
  DBHelper db = DBHelper();

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItem() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('cart_item') ?? 0;
    _totalPrice = pref.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItem();
    notifyListeners();
  }

  void minusCounter() {
    _counter--;
    _setPrefItem();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItem();
    return _counter;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItem();
    notifyListeners();
  }

  void minusTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItem();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItem();
    return _totalPrice;
  }
}
