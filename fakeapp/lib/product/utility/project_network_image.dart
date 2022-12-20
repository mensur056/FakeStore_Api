import 'package:fakeapp/product/constant/app_constant.dart';
import 'package:flutter/widgets.dart';

class ProjectNetworkImage extends Image {
  ProjectNetworkImage.network({
    Key? key,
    String? src,
  }) : super.network(src = AppConstant.instance.dummyImage, key: key);
}
