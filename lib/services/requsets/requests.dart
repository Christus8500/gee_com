import 'package:dio/dio.dart';

final Dio dio = Dio();

Future<List<dynamic>> getProducts() async {
  await Future.delayed(const Duration(seconds: 6));
  List<Map> results = [];

  try {
    final request = await dio.get('https://fakestoreapi.com/products');
    final tempData = request.data as List<dynamic>;

    for (var item in tempData) {
      var temp = item as Map;
      results.add(temp);
    }
  } catch (e) {
    print(e);
  }

  return results;
}
