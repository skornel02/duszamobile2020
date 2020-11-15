import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit(String locale) : super(locale);

  void nextLocale(String locale) => emit(locale);
}
