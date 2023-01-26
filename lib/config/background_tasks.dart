import 'package:gudang_buku/infra/local/local_storage.dart';
import 'package:gudang_buku/inter/local/local_storage_hive.dart';
import 'package:gudang_buku/domain/dto_fs/user_response.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == LocalStoragePath.user.text) {
      await LocalStorageHive().init();

      final LocalStorage localStorage = LocalStorageHive();

      final UserResponse userResponse = UserResponse.fromJson(inputData!);

      await localStorage.overwrite(LocalStoragePath.user, userResponse);

      return true;
    }
    return true;
  });
}
