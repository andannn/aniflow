import 'package:aniflow/app/di/get_it_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RootGetItScope extends StatefulWidget {
  const RootGetItScope({super.key, required this.child});

  final Widget child;

  @override
  State<RootGetItScope> createState() => _RootGetItScopeState();
}

class _RootGetItScopeState extends State<RootGetItScope> {
  GetIt? _getItInstance;

  @override
  void initState() {
    super.initState();

    initDI(GetIt.instance).then((GetIt getIt) {
      setState(() {
        _getItInstance = getIt;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _getItInstance?.dispose();
    _getItInstance = null;
  }

  @override
  Widget build(BuildContext context) {
    final instance = _getItInstance;
    if (instance == null) {
      return const MaterialApp(home: Scaffold());
    }

    return GetItScope(
      getIt: instance,
      child: widget.child,
    );
  }
}

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
