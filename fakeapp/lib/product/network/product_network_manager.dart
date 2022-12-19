import 'package:fakeapp/features/home/model/product_model.dart';
import 'package:fakeapp/product/constant/app_constant.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManger extends NetworkManager<INetworkModel<ProductModel>> {
  ProductNetworkManger() : super(options: BaseOptions(baseUrl: AppConstant.instance.baseUrl));
}
