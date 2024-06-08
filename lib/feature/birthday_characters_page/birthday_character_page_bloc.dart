import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/character_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class BirthdayCharacterPageBloc extends RefreshPagingBloc<CharacterModel> {
  BirthdayCharacterPageBloc(
    this._characterRepository,
  ) : super(const PageInit(data: []));

  final CharacterRepository _characterRepository;

  @override
  Future<LoadResult<List<CharacterModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _characterRepository.loadBirthdayCharacterPage(
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: AfConfig.defaultPerPageCount),
      token: cancelToken,
    );
  }
}
