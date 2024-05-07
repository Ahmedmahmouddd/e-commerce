import 'package:ecommerce/features/home/data/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/home/data/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoriesData =
        BlocProvider.of<HomeCubit>(context).categories;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        //?????????????????????????? HOW
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Categories'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: categoriesData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: categoriesData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(
                        children: [
                          Expanded(
                              child: Image.network(
                            categoriesData[index].imageUrl!,
                            fit: BoxFit.cover,
                          )),
                          Text(categoriesData[index].name!)
                        ],
                      ));
                    },
                  ),
          ),
        );
      },
    );
  }
}
