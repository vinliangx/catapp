import 'package:bloc/bloc.dart';
import 'package:catapp/api/cat_service.dart';
import 'package:catapp/model/cat.dart';
import 'package:meta/meta.dart';

part 'random_cat_event.dart';
part 'random_cat_state.dart';

class RandomCatBloc extends Bloc<RandomCatEvent, RandomCatState> {
  final CatService service = CatService();

  RandomCatBloc() : super(RandomCatInitial()) {
    on<RandomCatEvent>((event, emit) async {
      if (event is RequestRandomCatEvent || event is RefreshRandomCatEvent) {
        try {
          emit(LoadingRandomCatState());

          final cat = await service.fetchCat();

          emit(LoadedRandomCatState(cat));
        } catch (e) {
          emit(FailedRandomCatState(e.toString()));
        }
      }
    });
  }
}
