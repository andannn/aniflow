import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/design_system/widget/character_and_voice_actor_widget.dart';
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:aniflow/feature/common/paging_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListPage extends Page {
  final String animeId;

  const CharacterListPage({required this.animeId, super.key});

  @override
  Route createRoute(BuildContext context) {
    return CharacterListRoute(settings: this, animeId: animeId);
  }
}

class CharacterListRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String animeId;

  CharacterListRoute({required this.animeId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterPageBloc(
        animeId,
        aniListRepository: context.read<MediaInformationRepository>(),
      ),
      child: const _CharacterListPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _CharacterListPageContent extends StatelessWidget {
  const _CharacterListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterPageBloc,
            PagingState<List<CharacterAndVoiceActorModel>>>(
        builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent(
          pagingState: pagingState,
          onBuildItem: (context, model) => _buildListItems(context, model),
          onRequestNewPage: () {
            context.read<CharacterPageBloc>().add(OnRequestLoadPageEvent());
          },
          onRetryLoadPage: () {
            context.read<CharacterPageBloc>().add(OnRetryLoadPageEvent());
          },
        ),
      );
    });
  }

  Widget _buildListItems(
      BuildContext context, CharacterAndVoiceActorModel model) {
    return SizedBox(
      height: 124,
      child: CharacterAndVoiceActorWidget(
        model: model,
        textStyle: Theme.of(context).textTheme.labelMedium,
        onCharacterTap: () {},
        onVoiceActorTop: () {},
      ),
    );
  }
}
