import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => true;

  void toogleDarkMode() {
    state = !state;
  }
}
