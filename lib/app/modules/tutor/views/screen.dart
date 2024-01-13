import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/core/extensions/build_context_extensions.dart';
import 'package:tutoring_app/app/modules/tutor/domain/providers/providers.dart';
import 'package:tutoring_app/app/modules/tutor/widgets/user_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatUsers = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.translate.users)),
      body: chatUsers.when(data: (List<User> data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = data[index];
            return TutorUserCard(user: user);
          },
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(context.translate.errorFetchingUsers));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
