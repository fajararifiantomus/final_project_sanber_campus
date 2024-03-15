part of 'api_bloc.dart';

@immutable 
abstract class ApiState extends Equatable {
  
}

class ApiLoadingState extends ApiState {
  @override
  List<Object?> get props => [];
}

class ApiLoadedState extends ApiState {
  final List<ApiModel> motorcycle;
  ApiLoadedState(this.motorcycle);
  @override
  List<Object?> get props => [motorcycle];
}

class ApiErrorState extends ApiState {
  final String error;
  ApiErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
