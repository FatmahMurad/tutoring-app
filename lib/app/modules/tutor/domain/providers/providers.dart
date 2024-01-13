import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/modules/tutor/domain/repo/repo.dart';

final tutorRepositoryProvider = Provider((ref) => TutorRepository());

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final tutorRepo = ref.watch(tutorRepositoryProvider);
  debugPrint("***");
  try {
    final userList = await tutorRepo.fetchRegisteredUsers();
    return userList;
  } catch (e) {
    throw e.toString();
    return [];
  }
});
