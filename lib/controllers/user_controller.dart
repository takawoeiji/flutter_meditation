// import 'package:image_galally/controllers/auth_controller.dart';
// import 'package:image_galally/models/user_model.dart';
// import 'package:image_galally/repositories/custom_exception.dart';
// import 'package:image_galally/repositories/user_repository.dart';
// // import 'package:image_galally/repositories/_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum UserListFilter {
//   all,
//   obtained,
// }

// final userListFilterProvider =
//     StateProvider<UserListFilter>((_) => UserListFilter.all);

// // final filteredUserListProvider = Provider<List<User>>((ref) {
// //   final userListFilterState = ref.watch(userListFilterProvider.notifier).state;
// //   final userListState = ref.watch(userListControllerProvider);
// //   return userListState.maybeWhen(
// //     data: (users) {
// //       switch (userListFilterState) {
// //         case UserListFilter.obtained:
// //           return users.where((user) => user.obtained).toList();
// //         default:
// //           return users;
// //       }
// //     },
// //     orElse: () => [],
// //   );
// // });

// final userListExceptionProvider = StateProvider<CustomException?>((_) => null);

// final userListControllerProvider =
//     StateNotifierProvider<UserListController, AsyncValue<List<User>>>(
//   (ref) {
//     final user = ref.watch(authControllerProvider);
//     return UserListController(ref, user?.uid);
//   },
// );

// class UserListController extends StateNotifier<AsyncValue<List<User>>> {
//   final Ref _ref;
//   final String? _userId;

//   UserListController(this._ref, this._userId) : super(AsyncValue.loading()) {
//     if (_userId != null) {
//       retrieveUsers();
//     }
//   }

//   Future<void> retrieveUsers({bool isRefreshing = false}) async {
//     if (isRefreshing) state = AsyncValue.loading();
//     try {
//       final users = await _ref.read(userRepositoryProvider);
//       // .retrieveUsers(userId: _userId!);
//       if (mounted) {
//         // state = AsyncValue.data(users);
//       }
//     } on CustomException catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }

//   Future<void> addUser({required String name, bool obtained = false}) async {
//     try {
//       // final user = User(username: name, );
//       // final userId = await _ref.read(userRepositoryProvider).createUser(
//       //       userId: _userId!,
//       //       user: user,
//       //     );
//       // state.whenData((users) =>
//       //     state = AsyncValue.data(users..add(user.copyWith(id: userId))));
//     } on CustomException catch (e) {
//       _ref.watch(userListExceptionProvider.notifier).state = e;
//     }
//   }

//   Future<void> updateUser({required User updatedUser}) async {
//     try {
//       // await _ref
//       // .read(userRepositoryProvider)

//       // .updateUser(userId: _userId!, user: updatedUser);
//       state.whenData((users) {
//         state = AsyncValue.data([
//           for (final user in users)
//             if (user.id == updatedUser.id) updatedUser else user
//         ]);
//       });
//     } on CustomException catch (e) {
//       _ref.watch(userListExceptionProvider.notifier).state = e;
//     }
//   }

//   Future<void> deleteUser({required String userId}) async {
//     try {
//       await _ref.read(userRepositoryProvider).deleteUser(
//             userId: _userId!,
//             // userId: userId,
//           );
//       state.whenData((users) => state =
//           AsyncValue.data(users..removeWhere((user) => user.id == userId)));
//     } on CustomException catch (e) {
//       _ref.read(userListExceptionProvider.notifier).state = e;
//     }
//   }
// }
