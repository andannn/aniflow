import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// A widget that provides a [GetIt] instance to its descendants.
class GetItScope extends StatelessWidget {
  const GetItScope({
    super.key,
    required this.child,
    required this.getIt,
  });

  final GetIt getIt;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) {
        return getIt;
      },
      child: child,
    );
  }

  static GetIt of(BuildContext context) {
    return context.read<GetIt>();
  }
}
