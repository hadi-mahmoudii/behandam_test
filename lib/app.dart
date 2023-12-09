import 'package:behandam/features/logic/profile/profile_bloc.dart';
import 'package:behandam/features/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  // Constructor
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Init
  @override
  void initState() {}

  // Tree
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ProfileBloc>(create: (profileContext) => ProfileBloc())],
      child: Builder(
        builder: (context) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: '',
              ),
              home: const Directionality(
                textDirection: TextDirection.rtl,
                child: ProfilePage(),
              ));
        },
      ),
    );
  }
}
