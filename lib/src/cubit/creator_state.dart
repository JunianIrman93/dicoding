part of 'creator_cubit.dart';

abstract class CreatorState extends Equatable {
  const CreatorState();

  @override
  List<Object> get props => [];
}

class CreatorInitial extends CreatorState {}

class CreatorLoading extends CreatorState {}

class CreatorSuccess extends CreatorState {
  final List<CreatorModel> creators;

  const CreatorSuccess(this.creators);

  @override
  List<Object> get props => [creators];
}

class CreatorFailed extends CreatorState {
  final String error;

  const CreatorFailed(this.error);

  @override
  List<Object> get props => [error];
}
