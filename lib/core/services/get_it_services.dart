import 'package:fruits_apps/core/services/firebase_auth_services.dart';
import 'package:fruits_apps/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
