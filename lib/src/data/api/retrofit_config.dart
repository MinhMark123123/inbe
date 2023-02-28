import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/di/di_config.dart';

void updateDioProvider(WidgetRef ref) {
  ref.read(dioStateProvider.state).update((state) {
    final database = ref.read(keyDataSourceProvider);
    final accessToken = database.get(PrefKeys.keyToken);
    final uid = database.get(PrefKeys.keyUid);
    final client = database.get(PrefKeys.keyClient);
    print("ttt $accessToken::: $uid::: $client");
    state.interceptors.add(AppendUserInterceptor(accessToken, uid, client));
    return state;
  });
}
