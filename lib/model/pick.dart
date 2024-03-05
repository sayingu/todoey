import 'package:flutter/foundation.dart';

class PickList extends ChangeNotifier {
  final List<Pick> _picks = [];

  List<Pick> getPicks() {
    return _picks;
  }

  void addPick(pick) {
    _picks.add(pick);
    notifyListeners();
  }
}

class Pick extends ChangeNotifier {
  final String description;
  bool isCompleted;

  Pick({required this.description, this.isCompleted = false});

  void toggleCompleted(bool value) {
    isCompleted = value;
    notifyListeners();
  }
}
