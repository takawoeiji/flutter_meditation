import 'package:image_galally/controllers/auth_controller.dart';
import 'package:image_galally/models/meditation_model.dart';
import 'package:image_galally/repositories/custom_exception.dart';
import 'package:image_galally/repositories/meditation_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum MeditationListFilter {
//   all,
//   obtained,
// }

// final meditationListFilterProvider =
//     StateProvider<MeditationListFilter>((_) => MeditationListFilter.all);

// final filteredMeditationListProvider = Provider<List<Meditation>>((ref) {
//   final meditationListFilterState =
//       ref.watch(meditationListFilterProvider.notifier).state;
//   final meditationListState = ref.watch(meditationListControllerProvider);
//   return meditationListState.maybeWhen(
//     data: (meditations) {
//       switch (meditationListFilterState) {
//         case MeditationListFilter.obtained:
//           return meditations.toList();
//         default:
//           return meditations;
//       }
//     },
//     orElse: () => [],
//   );
// });

final meditationListExceptionProvider =
    StateProvider<CustomException?>((_) => null);

final meditationListControllerProvider = StateNotifierProvider<
    MeditationListController, AsyncValue<List<Meditation>>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return MeditationListController(ref);
  },
);

class MeditationListController
    extends StateNotifier<AsyncValue<List<Meditation>>> {
  final Ref _ref;

  MeditationListController(this._ref) : super(AsyncValue.loading()) {
    retrieveMeditations();
  }

  Future<void> retrieveMeditations({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final meditations =
          await _ref.read(meditationRepositoryProvider).retrieveMeditations();
      if (mounted) {
        state = AsyncValue.data(meditations);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addMeditation({required Meditation meditation}) async {
    try {
      // final meditation = Meditation();
      final meditationId =
          await _ref.read(meditationRepositoryProvider).createMeditation(
                meditation: meditation,
              );
      state.whenData((meditations) => state = AsyncValue.data(
          meditations..add(meditation.copyWith(id: meditationId))));
    } on CustomException catch (e) {
      _ref.read(meditationListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateMeditation({required Meditation updatedMeditation}) async {
    try {
      await _ref
          .read(meditationRepositoryProvider)
          .updateMeditation(meditation: updatedMeditation);
      state.whenData((meditations) {
        state = AsyncValue.data([
          for (final meditation in meditations)
            if (meditation.id == updatedMeditation.id)
              updatedMeditation
            else
              meditation
        ]);
      });
    } on CustomException catch (e) {
      _ref.read(meditationListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> deleteMeditation({required String meditationId}) async {
    try {
      await _ref.read(meditationRepositoryProvider).deleteMeditation(
            meditationId: meditationId,
          );
      state.whenData((meditations) => state = AsyncValue.data(meditations
        ..removeWhere((meditation) => meditation.id == meditationId)));
    } on CustomException catch (e) {
      _ref.read(meditationListExceptionProvider.notifier).state = e;
    }
  }
}
