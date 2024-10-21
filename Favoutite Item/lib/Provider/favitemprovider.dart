import 'package:flutter/foundation.dart';

class FavouriteItem with ChangeNotifier{

  final List<int> _items =[];
  List<int> get items => _items;

  void addItems(int value){
    _items.add(value);
    notifyListeners();
  }

  void removeItems(int value){
    _items.remove(value);
    notifyListeners();
  }
}