import 'package:fakeapp/features/home/cubit/home_cubit.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:fakeapp/product/network/product_network_manager.dart';
import 'package:fakeapp/product/widget/loading_indicator.dart';
import 'package:fakeapp/product/widget/product_card.dart';
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
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text(state.categories?[index] ?? ''),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(flex: 8, child: _bodyListView()),
          ],
        ),
      ),
    );
  }

  Widget _bodyListView() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) => ProductCard(model: state.items?[index]));
      },
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
