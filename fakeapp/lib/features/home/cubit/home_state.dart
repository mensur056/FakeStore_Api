part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.items, this.isLoading, this.categories, this.selectedItems});

  final List<ProductModel>? items;
  final List<ProductModel>? selectedItems;
  final bool? isLoading;
  final List<String>? categories;
  @override
  List<Object?> get props => [items, isLoading, categories, selectedItems];

  HomeState copyWith(
      {List<ProductModel>? items, List<ProductModel>? selectedItems, bool? isLoading, List<String>? categories}) {
    return HomeState(
      selectedItems: selectedItems ?? this.selectedItems,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
