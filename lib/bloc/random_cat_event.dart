part of 'random_cat_bloc.dart';

@immutable
abstract class RandomCatEvent {}

class RequestRandomCatEvent extends RandomCatEvent {}

class RefreshRandomCatEvent extends RandomCatEvent {}
