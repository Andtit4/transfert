import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationTab { home, settings, history, profile }

class NavigationCubit extends Cubit<NavigationTab> {
  NavigationCubit() : super(NavigationTab.home);

  void setTab(NavigationTab tab) => emit(tab);
}