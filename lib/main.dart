import 'package:dicoding/src/cubit/auth_cubit.dart';
import 'package:dicoding/src/cubit/creator_cubit.dart';
import 'package:dicoding/src/ui/pages/get_started_page.dart';
import 'package:dicoding/src/ui/pages/main_page.dart';
import 'package:dicoding/src/ui/pages/sign_in_page.dart';
import 'package:dicoding/src/ui/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CreatorCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
