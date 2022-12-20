import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/product/model/query/product_query.dart';
import 'package:vexana/vexana.dart';

enum HomePath { products, categories }

abstract class IHomeService {
  late final INetworkManager _networkManager;

  IHomeService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchItem({int count = 5});
  Future<List<ProductModel>?> fetchiAllItems();
  Future<List<String>?> fetchCatagoryItems();
}

class HomeService extends IHomeService {
  HomeService(super.networkManager);

  @override
  Future<List<ProductModel>?> fetchItem({int count = 5}) async {
    final response = await _networkManager.send<ProductModel, List<ProductModel>>(HomePath.products.name,
        parseModel: ProductModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([ProductQuery.limit.toMapEntry('$count')]));
    return response.data;
  }

  @override
  Future<List<ProductModel>?> fetchiAllItems() async {
    final response = await _networkManager.send<ProductModel, List<ProductModel>>(
      HomePath.products.name,
      parseModel: ProductModel(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<List<String>?> fetchCatagoryItems() async {
    final response = await _networkManager.sendPrimitive('${HomePath.products.name}/${HomePath.categories.name}');

    return response is List ? response.map((e) => '$e').toList() : null;
  }
}
