import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutoring_app/app/config/routes/named_routes.dart';

class TutorUserCard extends StatelessWidget {
  const TutorUserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.username),
        subtitle: Text(user.email),
        onTap: () {},
      ),
    );
  }
}
