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
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        // استخدام isDark لتحديد وضع السمة
        final isDark = NewsCubit.get(context).isDark;

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
          
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: Directionality(textDirection: TextDirection.ltr,
          child: const HomePage()),
        );
      },
    );
  }
}
