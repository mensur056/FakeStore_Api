import 'package:equatable/equatable.dart';
import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    Future.microtask(() => fetchAllItem());
  }

  final IHomeService homeService;

  Future<void> fetchAllItem() async {
    _changeLoading();
    final response = await homeService.fetchAllItem();
    emit(state.copyWith(items: response ?? []));
    _changeLoading();
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
