import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/model/api_model.dart';
import 'package:final_project/services/api_repository.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepository _apiRepository;

  ApiBloc(this._apiRepository) : super(ApiLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(ApiLoadingState());
      try {
        final motorcycle = await _apiRepository.fetchKawasakiNinja();
        emit(ApiLoadedState(motorcycle));
      } catch (e) {
        emit(ApiErrorState(e.toString()));
      }
    });
  }
}
