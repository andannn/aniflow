import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/anime_search/bloc/search_type.dart';
import 'package:aniflow/feature/anime_search/bloc/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class SearchEvent {}

class OnSearchTypeSelected extends SearchEvent {
  final SearchType selectedSearchType;

  OnSearchTypeSelected(this.selectedSearchType);
}

class OnSearchStringCommit extends SearchEvent {
  final String searchString;

  OnSearchStringCommit(this.searchString);
}

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.userDataRepository) : super(const SearchState()) {
    on<OnSearchTypeSelected>(
      (event, emit) =>
          emit(state.copyWith(selectedSearchType: event.selectedSearchType)),
    );

    on<OnSearchStringCommit>(
      (event, emit) => emit(state.copyWith(keyword: event.searchString)),
    );
  }

  final UserDataRepository userDataRepository;
}
