import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'helper_state.dart';

class HelperCubit extends Cubit<HelperState> {
  HelperCubit() : super(HelperInitial());
  static HelperCubit get(context) => BlocProvider.of(context);
  bool passwordVisiable = true;
  bool confirmPasswordVisiable = false;
  void togglePassword() {
    passwordVisiable = !passwordVisiable;
    emit(HelperRebuild());
  }

  void rebuildPart() {
    emit(HelperRebuild());
  }
}
