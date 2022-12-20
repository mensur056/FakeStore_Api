part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.items, this.isLoading, this.categories});

  final List<ProductModel>? items;
  final bool? isLoading;
  final List<String>? categories;
  @override
  List<Object?> get props => [items, isLoading, categories];

  HomeState copyWith({List<ProductModel>? items, bool? isLoading, List<String>? categories}) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
