abstract class NewsState {}

class InitialNewsState extends NewsState{}

class BottomNavChange extends NewsState{}

class BussinessLoadingState extends NewsState{}

class BussinessSuccessState extends NewsState{}

class BussinessErroeState extends NewsState{
  final String error;

  BussinessErroeState(this.error);

}

class SportsLoadingState extends NewsState{}

class SportsSuccessState extends NewsState{}

class SportsErroeState extends NewsState{
  final String error;

  SportsErroeState(this.error);

}

class ScienceLoadingState extends NewsState{}

class ScienceSuccessState extends NewsState{}

class ScienceErroeState extends NewsState {
  final String error;

  ScienceErroeState(this.error);

}

class SearchLoadingState extends NewsState{}

class SearchSuccessState extends NewsState{}

class SearchErroeState extends NewsState {
  final String error;

  SearchErroeState(this.error);

}
