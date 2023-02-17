import 'package:flutter/cupertino.dart';
import 'package:aac_core/aac_core.dart';

typedef OnClickItem<T> = Function(int index, T data);
typedef ItemBuilder<T> = Widget Function(int index, T data);
typedef SeparatorBuilder = Widget Function(int index);
typedef RemoveWhere<T> = bool Function(T data);

class ListDelegateController<T> extends ChangeNotifier {
  List<T> dataList = [];
  int currentPage = 1;
  int totalPages = 0;
  bool hasUnread = false;

  updatePage({int? page, int? totalPages}) {
    currentPage = page ?? 1;
    this.totalPages = totalPages ?? 1;
  }

  bool isFirstPage() {
    return currentPage <= 1;
  }

  bool isLastPage() {
    return currentPage == totalPages;
  }

  bool isEmpty() {
    return dataList.isEmpty;
  }

  bool add(T item) {
    try {
      dataList.add(item);
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }

  bool insert(int index, T item) {
    try {
      dataList.insert(index, item);
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }

  bool addAll(Iterable<T>? iterable) {
    try {
      if (iterable != null) {
        dataList.addAll(iterable);
        notifyListeners();
        return true;
      }
    } catch (e) {}
    return false;
  }

  bool remove(T? item) {
    try {
      dataList.remove(item);
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }

  bool removeAt(int index) {
    try {
      dataList.removeAt(index);
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }

  bool removeWhere(RemoveWhere condition) {
    try {
      dataList.removeWhere((element) => condition(element));
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }

  bool clear() {
    try {
      dataList.clear();
      notifyListeners();
      return true;
    } catch (e) {}
    return false;
  }
}
