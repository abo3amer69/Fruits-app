import 'package:bloc/bloc.dart';
import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;
  Future<void> creatUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.creatUserWithEmaimAndPassword(
      email,
      name,
      password,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (user) => emit(SignupSuccess(userEntity: user)),
    );
  }
}
