import 'package:fruits_apps/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });


  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
