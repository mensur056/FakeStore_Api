// Singleten using

class AppConstant {
  static AppConstant? _instance;
  static AppConstant get instance {
    _instance ??= AppConstant._init();
    return _instance!;
  }

  AppConstant._init();
  final String baseUrl = 'https://fakestoreapi.com/';
  final String dummyImage = 'https://picsum.photos/200/300';
}
