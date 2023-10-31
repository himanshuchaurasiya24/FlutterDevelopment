import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmitName(WidgetRef ref, String value) {
    // ref.read(nameProvider); // this will only read the data and will not update it
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(nameProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(nameProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // for the below method the stateless part in the class name needs to be remaned as consumerWidget and a parameter of WidgetRef ref is to be passed in build method;
    // final name = ref.watch(nameProvider) ?? '';
    final user = ref.watch(nameProvider);

    // if we want to rebuild the wigdet after we change the name then that can be achieved by using the following method
    // final userSelect = ref.watch(
    //   nameProvider.select((value) => value.name),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmitName(ref, value);
            },
          ),
          TextField(
            onSubmitted: (value) {
              onSubmitAge(ref, value);
            },
          ),
          Center(
            // child: Text(user.name + ' ' + user.age.toString()),
            child: Text(
              user.toString(),
            ),
          )
        ],
      ),
    );

    // in this code only the text in the center will be rebuilt and not the entire ui like app bar which does not have any changes;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(''),
    //   ),
    //   body: Consumer(
    //     builder: (context, ref, child) {
    //       final name = ref.watch(nameProvider);
    //       return Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             TextField(
    //               onSubmitted: (value) => onSubmit(ref, value),
    //             ),
    //             Text(name),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
