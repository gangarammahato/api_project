import 'package:api_project/models/products_model.dart';
import 'package:api_project/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productsRepo.getProducts();
        //emit(ProductsLoadedState(productsModelFromJson(response.body)));
      
          emit(ProductsLoadedState(data));
         
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
