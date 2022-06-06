import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_linux/path_provider_linux.dart';
import 'package:path/path.dart';

class ThemeCubit extends HydratedCubit<bool>{
  ThemeCubit() : super(true);

  void toggleTheme({required bool value}){
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json["isDark"];
    
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {
      "isDark":state
    };
  }
  
}