import 'package:chatapp/features/view/pages/chat/data/repositry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../features/view/pages/auth/cubit/auth_cubit.dart';
import '../features/view/pages/auth/data/auth_repo.dart';
import '../features/view/pages/chat/cubit/chat_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await Firebase.initializeApp();

  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepository(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<ChatRepository>(
        () => ChatRepository(),
  );

  getIt.registerFactory<ChatCubit>(
        () => ChatCubit(getIt<ChatRepository>()),
  );
}