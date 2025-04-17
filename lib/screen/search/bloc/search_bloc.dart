import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/entities/module_model.dart';
import 'package:learning_intern_support_system/domain/entities/profile_model.dart';
import 'package:learning_intern_support_system/domain/entities/training_program_model.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_state.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() :
      super(const SearchState()) {
    on<SearchLoadTrainingProgram>(_onLoadTrainingProgram);
    on<SearchLoadModule>(_onLoadModule);
    on<SearchLoadLecturer>(_onLoadLecturer);
    on<SearchLoadCompany>(_onLoadCompany);
    on<SearchLoadRecentSearch>(_onLoadRecentSearch);
    on<SearchWordChange>(_onSearchWordChange);
    on<SearchAddRecentSearch>(_onAddRecentSearch);
    on<SearchOnClickRecentSearch>(_onClickRecentSearch);
  }

  void _onLoadTrainingProgram(
      SearchLoadTrainingProgram event,
      Emitter<SearchState> emit,
      ) async{
    emit(state.copyWith(
      trainingProgramStatus: () => SearchStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      trainingProgramStatus: () => SearchStatus.success,
      trainingPrograms: () => trainingProgramList,
    ));
  }

  void _onLoadModule(
      SearchLoadModule event,
      Emitter<SearchState> emit,
      ) async{
    emit(state.copyWith(
      moduleStatus: () => SearchStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      moduleStatus: () => SearchStatus.success,
      modules: () => moduleList,
    ));
  }

  void _onLoadLecturer(
      SearchLoadLecturer event,
      Emitter<SearchState> emit,
      ) async{
    emit(state.copyWith(
      lecturerStatus: () => SearchStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      lecturerStatus: () => SearchStatus.success,
      lecturers: () => lecturerList,
    ));
  }

  void _onLoadCompany(
      SearchLoadCompany event,
      Emitter<SearchState> emit,
      ) async{
    emit(state.copyWith(
      companyStatus: () => SearchStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      companyStatus: () => SearchStatus.success,
      companies: () => [fpt, fpt, fpt],
    ));
  }

  void _onLoadRecentSearch(
      SearchLoadRecentSearch event,
      Emitter<SearchState> emit,
      ) {
    emit(state.copyWith(
      recentSearch: () => ['Công nghệ thông tin', 'Điển Tử', 'Đại học'],
    ));
  }

  void _onSearchWordChange(
      SearchWordChange event,
      Emitter<SearchState> emit,
      ) {
    emit(state.copyWith(searchWord: () => event.word));
  }

  void _onAddRecentSearch(
      SearchAddRecentSearch event,
      Emitter<SearchState> emit,
      ) {
  }

  void _onClickRecentSearch(
      SearchOnClickRecentSearch event,
      Emitter<SearchState> emit,
      ) {

  }
}