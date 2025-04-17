import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/entities/module_model.dart';
import 'package:learning_intern_support_system/domain/entities/post_model.dart';
import 'package:learning_intern_support_system/screen/home/bloc/home_event.dart';
import 'package:learning_intern_support_system/screen/home/bloc/home_state.dart';

import '../../../domain/entities/training_program_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc() :
      super(const HomeState()) {
    on<HomeLoadTrainingProgram>(_onLoadTrainingProgram);
    on<HomeLoadModule>(_onLoadModule);
    on<HomeLoadPost>(_onLoadPost);
    on<HomeChangePostType>(_onChangePostType);
  }

  void _onLoadTrainingProgram(
      HomeLoadTrainingProgram event,
      Emitter<HomeState> emit
      ) async{
    emit(state.copyWith(
      trainingProgramStatus: () => TrainingProgramStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      trainingProgramStatus: () => TrainingProgramStatus.success,
      trainingPrograms: () => trainingProgramList,
    ));
  }

  void _onLoadModule(
      HomeLoadModule event,
      Emitter<HomeState> emit
      ) async{
    emit(state.copyWith(
      moduleStatus: () => ModuleStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      moduleStatus: () => ModuleStatus.success,
      modules: () => moduleList,
    ));
  }

  void _onLoadPost(
      HomeLoadPost event,
      Emitter<HomeState> emit
      ) async{
    emit(state.copyWith(
      postStatus: () => PostStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      postStatus: () => PostStatus.success,
      posts: () => allPostModelList,
    ));
  }

  void _onChangePostType(
      HomeChangePostType event,
      Emitter<HomeState> emit,
      ) async{
    await Future.delayed(const Duration(milliseconds: 300));
    if (event.type == 2 && state.postType == PostType.all) {
      return;
    }
    if (event.type == 1 && state.postType == PostType.company) {
      return;
    }
    if (event.type == 0 && state.postType == PostType.university) {
      return;
    }
    emit(state.copyWith(
      posts: () => event.type == 2 ? allPostModelList : (event.type == 0 ? universityPostModelList : companyPostModelList),
      postType: () => event.type == 2 ? PostType.all : (event.type == 0 ? PostType.university : PostType.company),
    ));
  }
}