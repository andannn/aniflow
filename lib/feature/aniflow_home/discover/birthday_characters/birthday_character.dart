import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BirthdayCharactersBlocProvider extends StatelessWidget {
  const BirthdayCharactersBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: const ValueKey('birthday_character'),
      create: (context) => GetIt.instance.get<BirthdayCharactersBloc>(),
      child: const BirthdayCharactersContent(),
    );
  }
}

class BirthdayCharactersContent extends StatelessWidget {
  const BirthdayCharactersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthdayCharactersBloc, BirthdayCharactersState>(
      builder: (context, state) {
        return BirthdayCharactersWidget(
          models: state.data,
          titleLanguage: GetIt.instance
              .get<UserDataRepository>()
              .userData
              .userStaffNameLanguage,
        );
      },
    );
  }
}

class BirthdayCharactersWidget extends StatelessWidget {
  const BirthdayCharactersWidget({
    super.key,
    required this.models,
    required this.titleLanguage,
  });

  final List<CharacterModel> models;
  final UserStaffNameLanguage titleLanguage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        models.map((e) => Card(child: Text(e.name.toString()))).toList(),
    );
  }
}
