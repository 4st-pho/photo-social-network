import 'dart:async';

class MainBloc {
  int currentTab = 0;
  final _tabIndexController = StreamController<int>();
  Stream<int> get tabIndexStrem => _tabIndexController.stream;

  void selectTab(int index) {
    if (index != currentTab) {
      currentTab = index;
      _tabIndexController.add(index);
    }
  }

  void dispose() {
    _tabIndexController.close();
  }
}
