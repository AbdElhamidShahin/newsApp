import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/cubit/states.dart';
import 'package:social_app/veiw/Home_Page.dart';
import 'model/cubit/cubit.dart';
import 'model/dio/doi_healber.dart';

void main() {
  DioHelper.init();
  runApp(
    BlocProvider(
      create: (context) => NewsCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..changeAppMode(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {


          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 20.0,
                selectedItemColor: Colors.amber,
                selectedIconTheme: IconThemeData(color: Colors.amber),
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.black,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.black,
                elevation: 20.0,
                selectedItemColor: Colors.amber,
                selectedIconTheme: IconThemeData(color: Colors.amber),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              useMaterial3: true,
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
