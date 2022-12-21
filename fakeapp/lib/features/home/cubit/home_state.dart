part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.items,
    this.isLoading,
    this.categories,
    this.selectedItems,
    this.isUpdate = false,
  });

  final List<ProductModel>? items;
  final List<ProductModel>? selectedItems;
  final bool? isLoading;
  final List<String>? categories;
  final bool? isUpdate;
  @override
  List<Object?> get props => [items, isLoading, categories, selectedItems, isUpdate];

  HomeState copyWith(
      {List<ProductModel>? items,
      List<ProductModel>? selectedItems,
      bool? isLoading,
      List<String>? categories,
      bool? isUpdate}) {
    return HomeState(
      isUpdate: isUpdate ?? this.isUpdate,
      selectedItems: selectedItems ?? this.selectedItems,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
