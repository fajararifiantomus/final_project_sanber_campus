part of 'api_bloc.dart';

@immutable 
abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class LoadApiEvent extends ApiEvent {
  @override
  List <Object?> get props => [];
}
