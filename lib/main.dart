import 'package:chronicle/features/auth/presentation/bloc/user_bloc.dart';
import 'package:chronicle/features/auth/presentation/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cors/router/app_router.dart';
import 'firebase_options.dart';
import 'get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setup(); // Must be called before runApp

  // runApp(
  //   BlocProvider(
  //     create: (context) => getIt<UserBloc>(), // Ensure UserBloc is registered
  //     child: MaterialApp.router(
  //       debugShowCheckedModeBanner: false,
  //       routerConfig: AppRouter.router,
  //     ),
  //   ),
  // );

  runApp(
    BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthPage(), // Directly load AuthPage for testing
      ),
    ),
  );


}
