import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_intern_support_system/domain/entities/profile_model.dart';
import 'package:learning_intern_support_system/domain/entities/training_program_model.dart';

import '../../../domain/entities/module_model.dart';

enum SearchStatus {initial, loading, success, failure}

class SearchState extends Equatable {
  const SearchState({
    this.trainingPrograms = const[],
    this.trainingProgramStatus = SearchStatus.initial,
    this.modules = const[],
    this.moduleStatus = SearchStatus.initial,
    this.lecturers = const[],
    this.lecturerStatus = SearchStatus.initial,
    this.companies = const[],
    this.companyStatus = SearchStatus.initial,
    this.searchWord = '',
    this.recentSearch = const [],
    this.recentSearchStatus = SearchStatus.initial,
  });

  final List<TrainingProgram> trainingPrograms;
  final SearchStatus trainingProgramStatus;
  final List<Module> modules;
  final SearchStatus moduleStatus;
  final List<TeacherProfileModel> lecturers;
  final SearchStatus lecturerStatus;
  final List<CompanyProfileModel> companies;
  final SearchStatus companyStatus;
  final String searchWord;
  final List<String> recentSearch;
  final SearchStatus recentSearchStatus;

  SearchState copyWith({
    SearchStatus Function()? trainingProgramStatus,
    List<TrainingProgram> Function()? trainingPrograms,
    SearchStatus Function()? moduleStatus,
    List<Module> Function()? modules,
    SearchStatus Function()? lecturerStatus,
    List<TeacherProfileModel> Function()? lecturers,
    SearchStatus Function()? companyStatus,
    List<CompanyProfileModel> Function()? companies,
    String Function()? searchWord,
    List<String> Function()? recentSearch,
    SearchStatus Function()? recentSearchStatus,
    TextEditingController Function()? searchController,
  }) {
    return SearchState(
      trainingProgramStatus: trainingProgramStatus != null ? trainingProgramStatus() : this.trainingProgramStatus,
      trainingPrograms: trainingPrograms != null ? trainingPrograms() : this.trainingPrograms,
      moduleStatus: moduleStatus != null ? moduleStatus() : this.moduleStatus,
      modules: modules != null ? modules() : this.modules,
      lecturerStatus: lecturerStatus != null ? lecturerStatus() : this.lecturerStatus,
      lecturers: lecturers != null ? lecturers() : this.lecturers,
      companyStatus: companyStatus != null ? companyStatus() : this.companyStatus,
      companies: companies != null ? companies() : this.companies,
      searchWord: searchWord != null ? searchWord() : this.searchWord,
      recentSearch: recentSearch != null ? recentSearch() : this.recentSearch,
      recentSearchStatus: recentSearchStatus != null ? recentSearchStatus() : this.recentSearchStatus,
    );
  }

  @override
  List<Object?> get props => [
    trainingPrograms,
    trainingProgramStatus,
    modules,
    moduleStatus,
    lecturers,
    lecturerStatus,
    companies,
    companyStatus,
    searchWord,
    recentSearch,
    recentSearchStatus,
  ];

}