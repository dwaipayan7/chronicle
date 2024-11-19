import 'package:chronicle/cors/theme/app_theme.dart';
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

  setup();

  runApp(
    BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child:  MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );


}
