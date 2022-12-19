import 'package:fakeapp/features/home/cubit/home_cubit.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:fakeapp/product/network/product_network_manager.dart';
import 'package:fakeapp/product/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeService(ProductNetworkManger()),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: _loadingIndicator(),
        ),
      ),
    );
  }

  Widget _loadingIndicator() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? 1 : 0,
          duration: context.durationLow,
          child: const LoadingIndicator(),
        );
      },
    );
  }
}
