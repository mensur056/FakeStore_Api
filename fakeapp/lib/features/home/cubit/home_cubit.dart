import 'package:equatable/equatable.dart';
import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    Future.microtask(() => fetchCatagoryItems());
    Future.microtask(() => fetchAllItems());
  }

  final IHomeService homeService;

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
