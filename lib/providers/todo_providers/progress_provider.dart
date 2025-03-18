import 'package:flutter/material.dart';

class ProgressProvider extends ChangeNotifier {
  final ValueNotifier<double> _progressValue = ValueNotifier(0);

  ValueNotifier<double> get progressNotifier => _progressValue;

  void updateProgress(int completedTask, int totalTask) {
    if (totalTask == 0) {
      _progressValue.value = 0;
    } else {
      _progressValue.value = (completedTask / totalTask) * 100;
    }
    notifyListeners(); // Notify UI to update
  }
}
