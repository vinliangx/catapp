part of 'random_cat_bloc.dart';

@immutable
abstract class RandomCatState {}

class RandomCatInitial extends RandomCatState {}

class LoadingRandomCatState extends RandomCatState {}

class LoadedRandomCatState extends RandomCatState {
  final Cat cat;
  LoadedRandomCatState(this.cat);
}

class FailedRandomCatState extends RandomCatState {
  final String reason;
  FailedRandomCatState(this.reason);
}
