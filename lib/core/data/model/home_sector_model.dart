import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/firebase/remote_config/model/home_struct_remote_model.dart';
import 'package:equatable/equatable.dart';

class HomeSectorModel extends Equatable {
  final List<HomeSectorCategory> animeSectors;
  final List<HomeSectorCategory> mangaSectors;

  const HomeSectorModel(this.animeSectors, this.mangaSectors);

  @override
  List<Object?> get props => [...animeSectors, ...mangaSectors];
}

extension HomeStructRemoteModelEx on HomeStructRemoteModel {
  HomeSectorModel toModel() => HomeSectorModel(
        anime,
        manga,
      );
}
