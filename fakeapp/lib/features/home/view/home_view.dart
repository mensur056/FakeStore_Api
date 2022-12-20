import 'package:fakeapp/features/home/cubit/home_cubit.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:fakeapp/product/network/product_network_manager.dart';
import 'package:fakeapp/product/utility/project_network_image.dart';
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
        body: _bodyListView(),
      ),
    );
  }

  Widget _bodyListView() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.items?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final item = state.items?[index];
            if (item == null) {
              return const SizedBox();
            }
            return ListTile(
              title: ProjectNetworkImage.network(src: item.image),
              subtitle: Text(item.price.toString()),
            );
          },
        );
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
