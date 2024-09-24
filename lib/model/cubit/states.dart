abstract class NewsState {}

class NewsIntiatialState extends NewsState {}

class NewsBottomnavBarState extends NewsState {}

class NewsGetBusinessLodingState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;

  NewsGetBusinessErrorState({required this.error});
}

class NewsGetScienceLodingState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;

  NewsGetScienceErrorState({required this.error});
}

class NewsGetSportsLodingState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;

  NewsGetSportsErrorState({required this.error});
}
class AppChangeModeState extends NewsState {}
