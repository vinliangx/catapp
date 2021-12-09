import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:catapp/bloc/random_cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CatHomePage extends StatefulWidget {
  const CatHomePage({Key? key}) : super(key: key);

  @override
  State<CatHomePage> createState() => _CatHomeScreenState();
}

class _CatHomeScreenState extends State<CatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat APP"),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async =>
            context.read<RandomCatBloc>().add(RefreshRandomCatEvent()),
        child: Center(
          child: _buildCatBloc(),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          if (!kIsWeb) return const Offstage();
          return FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () =>
                context.read<RandomCatBloc>().add(RefreshRandomCatEvent()),
          );
        },
      ),
    );
  }

  final sdf = DateFormat.yMMMMEEEEd();

  BlocBuilder<RandomCatBloc, RandomCatState> _buildCatBloc() {
    return BlocBuilder<RandomCatBloc, RandomCatState>(
      builder: (context, state) {
        if (state is RandomCatInitial) {
          return const Text("Preparing...");
        } else if (state is LoadingRandomCatState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Loading"),
            ],
          );
        } else if (state is LoadedRandomCatState) {
          return LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      child: Image.memory(state.cat.payload),
                    ),
                    const SizedBox(height: 10),
                    Text("Updated ${sdf.format(state.cat.from)}"),
                  ],
                ),
              ),
            ),
          );
        } else if (state is FailedRandomCatState) {
          return Text(state.reason);
        }
        return const Text("Unknown");
      },
    );
  }
}
