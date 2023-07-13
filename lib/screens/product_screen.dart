import 'package:api_project/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
                itemCount: state.productsModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.productsModel[index].title.toString()),
                  );
                });
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMassege),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
