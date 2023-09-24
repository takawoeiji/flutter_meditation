import 'package:image_galally/models/category_model.dart';
import 'package:image_galally/repositories/custom_exception.dart';

import 'package:image_galally/repositories/category_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum CategoryListFilter {
//   all,
//   obtained,
// }

// final CategoryListFilterProvider =
//     StateProvider<CategoryListFilter>((_) => CategoryListFilter.all);

// final filteredCategoryListProvider = Provider<List<Category>>((ref) {
//   final categoryListFilterState = ref.watch(categoryListFilterProvider).state;
//   final categoryListState = ref.watch(categoryListControllerProvider);
//   return categoryListState.maybeWhen(
//     data: (categories) {
//       switch (categoryListFilterState) {
//         case CategoryListFilter.obtained:
//           return categories.where((category) => category.obtained).toList();
//         default:
//           return categories;
//       }
//     },
//     orElse: () => [],
//   );
// });

final categoryListExceptionProvider =
    StateProvider<CustomException?>((_) => null);

final categoryListControllerProvider =
    StateNotifierProvider<CategoryListController, AsyncValue<List<Category>>>(
  (ref) {
    // final user = ref.watch(authControllerProvider);
    return CategoryListController(ref);
  },
);

class CategoryListController extends StateNotifier<AsyncValue<List<Category>>> {
  final Ref _ref;
  // final String? _userId;

  CategoryListController(this._ref) : super(const AsyncValue.loading()) {
    // if (_userId != null) {
    retrieveCategories();
    // }
  }

  Future<void> retrieveCategories({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final categories =
          await _ref.watch(categoryRepositoryProvider).retrieveCategories();

      if (mounted) {
        state = AsyncValue.data(categories);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCategory(
      {required String name,
      required String description,
      required List<String> medNumber}) async {
    try {
      final category = Category(
          title: name, description: description, medNumbers: medNumber);
      final categoryId =
          await _ref.watch(categoryRepositoryProvider).createCategory(
                // userId: _userId!,
                category: category,
              );
      state.whenData((categories) => state =
          AsyncValue.data(categories..add(category.copyWith(id: categoryId))));
    } on CustomException catch (e) {
      _ref.read(categoryListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateCategory({required Category updatedCategory}) async {
    try {
      await _ref
          .watch(categoryRepositoryProvider)
          .updateCategory(category: updatedCategory);
      state.whenData((categories) {
        state = AsyncValue.data([
          for (final category in categories)
            if (category.id == updatedCategory.id) updatedCategory else category
        ]);
      });
    } on CustomException catch (e) {
      _ref.read(categoryListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> deleteCategory({required String categoryId}) async {
    try {
      await _ref.watch(categoryRepositoryProvider).deleteCategory(
            categoryId: categoryId,
          );
      state.whenData((categories) => state = AsyncValue.data(
          categories..removeWhere((category) => category.id == categoryId)));
    } on CustomException catch (e) {
      _ref.read(categoryListExceptionProvider.notifier).state = e;
    }
  }
}
