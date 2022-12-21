import 'package:equatable/equatable.dart';
import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    initalComplete();
  }
  Future<void> initalComplete() async {
    await Future.wait([fetchAllItems(), fetchCatagoryItems()]);
    emit(state.copyWith(selectedItems: state.items));
  }

  final IHomeService homeService;

  void selectedCategories(String data) {
    emit(state.copyWith(selectedItems: state.items?.where((element) => element.category == data).toList()));
  }

  void updateList(int index, ProductModel? model) {
    if (model != null) {
      emit(state.copyWith(isUpdate: false));
      model.price = (model.price ?? 0) + 200;
      final list = state.items;
      list?[index] = model;
      emit(state.copyWith(items: list, isUpdate: true));
    }
  }

  Future<void> fetchItem() async {
    _changeLoading();
    final response = await homeService.fetchItem();
    emit(state.copyWith(items: response ?? []));
    _changeLoading();
  }

  Future<void> fetchAllItems() async {
    _changeLoading();
    final response = await homeService.fetchiAllItems();
    emit(state.copyWith(items: response ?? []));
    _changeLoading();
  }

  Future<void> fetchCatagoryItems() async {
    final response = await homeService.fetchCatagoryItems();
    emit(state.copyWith(categories: response));
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
