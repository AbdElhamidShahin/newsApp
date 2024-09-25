import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/cubit/states.dart';
import 'package:social_app/model/dio/doi_healber.dart';
import 'package:social_app/veiw/Screens/Science_screen/Science_Screen.dart';
import 'package:social_app/veiw/Screens/busness_screen/busness_Screen.dart';
import 'package:social_app/veiw/Screens/sports_screen/SportssScreen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntiatialState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  List<Widget> screens = const [
    BusnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness(); // استدعاء البيانات عند الانتقال إلى شاشة الأعمال
    }
    emit(NewsBottomnavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLodingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey':
            'b09ef8e6702144b4a88f4c2adb7647eb', // تأكد من إدخال المفتاح الصحيح هنا
      },
    ).then((value) {
      business = value.data['articles'];

      // طباعة العنوان الأول للتأكد من نجاح العملية
      if (business.isNotEmpty) {
        print('First article title: ${business[0]["title"]}');
      }
      print('Number of articles: ${business.length}');

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print('Error: ${error.toString()}');
      emit(NewsGetBusinessErrorState(
          error: error.toString())); // تمرير الخطأ هنا
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLodingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey':
            'b09ef8e6702144b4a88f4c2adb7647eb', // تأكد من إدخال المفتاح الصحيح هنا
      },
    ).then((value) {
      sports = value.data['articles'];

      // طباعة العنوان الأول للتأكد من نجاح العملية
      if (sports.isNotEmpty) {
        print('First article title: ${sports[0]["title"]}');
      }
      print('Number of articles: ${sports.length}');

      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print('Error: ${error.toString()}');
      emit(NewsGetSportsErrorState(error: error.toString())); // تمرير الخطأ هنا
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLodingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey':
            'b09ef8e6702144b4a88f4c2adb7647eb', // تأكد من إدخال المفتاح الصحيح هنا
      },
    ).then((value) {
      science = value.data['articles'];

      // طباعة العنوان الأول للتأكد من نجاح العملية
      if (science.isNotEmpty) {
        print('First article title: ${science[0]["title"]}');
      }
      print('Number of articles: ${science.length}');

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print('Error: ${error.toString()}');
      emit(
          NewsGetScienceErrorState(error: error.toString())); // تمرير الخطأ هنا
    });
  }

  List<dynamic> Search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLodingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey':
            'b09ef8e6702144b4a88f4c2adb7647eb', // تأكد من إدخال المفتاح الصحيح هنا
      },
    ).then((value) {
      Search = value.data['articles'];

      print('Number of articles: ${Search.length}');

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print('Error: ${error.toString()}');
      emit(NewsGetSearchErrorState(error: error.toString())); // تمرير الخطأ هنا
    });
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState(isDark)); // تمرير isDark مع الحالة
  }
}
