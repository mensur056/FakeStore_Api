import 'package:fakeapp/features/home/cubit/home_cubit.dart';
import 'package:fakeapp/features/home/service/home_service.dart';
import 'package:fakeapp/product/network/product_network_manager.dart';
import 'package:fakeapp/product/widget/loading_indicator.dart';
import 'package:fakeapp/product/widget/product_card.dart';
import 'package:fakeapp/product/widget/product_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 300) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeService(ProductNetworkManger()),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: _dropdownMenu(),
          actions: [_loadingIndicator()],
        ),
        body: _bodyListView(),
      ),
    );
  }

  Widget _dropdownMenu() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropdown(
          items: state.categories ?? [],
          onSelected: (String data) {},
        );
      },
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
