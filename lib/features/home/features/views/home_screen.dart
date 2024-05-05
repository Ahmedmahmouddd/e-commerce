import 'package:ecommerce/features/home/data/home_cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    suffixIcon: const Icon(Icons.clear),
                    contentPadding: const EdgeInsets.all(0),
                    fillColor: Colors.grey.withOpacity(0.3),
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
              ),
              const SizedBox(height: 2),
              cubit.banners.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.banners.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            child: Image.network(
                              cubit.banners[index].imageUrl!,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: cubit.banners.length,
                  effect: const SlideEffect(
                      spacing: 5,
                      radius: 50,
                      dotColor: Colors.grey,
                      dotWidth: 16,
                      dotHeight: 16,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 2,
                      activeDotColor: Colors.indigo),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('View All', style: TextStyle(fontSize: 14))
                      ])),
              cubit.categories.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: cubit.categories.length,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              cubit.categories[index].imageUrl!,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
