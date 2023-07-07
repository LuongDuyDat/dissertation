import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchLoadTrainingProgram extends SearchEvent {
  const SearchLoadTrainingProgram();
}

class SearchLoadModule extends SearchEvent {
  const SearchLoadModule();
}

class SearchLoadLecturer extends SearchEvent {
  const SearchLoadLecturer();
}

class SearchLoadCompany extends SearchEvent {
  const SearchLoadCompany();
}

class SearchLoadRecentSearch extends SearchEvent {
  const SearchLoadRecentSearch();
}

class SearchWordChange extends SearchEvent {
  const SearchWordChange({required this.word,});

  final String word;

  @override
  List<Object?> get props => [
    word,
  ];
}

class SearchAddRecentSearch extends SearchEvent {
  const SearchAddRecentSearch({required this.word,});

  final String word;

  @override
  List<Object?> get props => [
    word,
  ];
}

class SearchOnClickRecentSearch extends SearchEvent {
  const SearchOnClickRecentSearch({required this.word,});

  final String word;

  @override
  List<Object?> get props => [
    word,
  ];
}