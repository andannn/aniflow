import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCharacterPagingBloc extends PagingBloc<CharacterModel> {
  FavoriteCharacterPagingBloc(
    this.userId, {
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;

  @override
  FutureOr<void> onInit(OnInit<CharacterModel> event,
      Emitter<PagingState<List<CharacterModel>>> emit) async {
    await super.onInit(event, emit);

    /// Refresh data when init.
    /// Favorite data may be changed when change like state in detail screen.
    unawaited(createLoadPageTask(page: 1, isRefresh: true));
  }

  @override
  Future<LoadResult<List<CharacterModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _favoriteRepository.loadFavoriteCharacterByPage(
      userId: userId,
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: Config.defaultPerPageCount),
    );
  }
}
