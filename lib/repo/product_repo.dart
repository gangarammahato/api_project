import 'package:api_project/models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<ProductsModel>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    //emit(ProductsLoadedState(productsModelFromJson(response.body)));
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw Exception("fail to load product");
    }
  }
}
