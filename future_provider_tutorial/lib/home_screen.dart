import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_tutorial/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
// async snapshot avoid using snapshot.connectionState to handle everything manually like handling error has data or loading state;
    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(data.name),
          ),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) {},
              ),
              TextField(
                onSubmitted: (value) {},
              ),
              Center(
                child: Text(data.email),
              )
            ],
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: Text('Loading'),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              stackTrace.toString(),
            ),
          ),
        );
      },
    );
  }
}
