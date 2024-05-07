import 'package:ecommerce/features/home/data/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final pageController = PageController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      cubit.filterProducts(input: value);
                    });
                  },
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
              ),
              const SizedBox(height: 2),
              cubit.banners.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : HomeCardsPageView(
                      pageController: HomeScreen.pageController, cubit: cubit),
              Center(
                child: HomePageIndicator(
                    pageController: HomeScreen.pageController, cubit: cubit),
              ),
              const HomeMiddleTitles(
                title: 'Categories',
              ),
              cubit.categories.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : HomeCategoriesListView(cubit: cubit),
              const HomeMiddleTitles(
                title: 'Products',
              ),
              cubit.products.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.filteredProducts.isEmpty
                          ? cubit.products.length
                          : cubit.filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return CategoriesContainer(
                            model: cubit.filteredProducts.isEmpty
                                ? cubit.products[index]
                                : cubit.filteredProducts[index]);
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              model.image!,
              fit: BoxFit.cover,
            ),
          ),
          Text(model.name!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                    child: Row(children: [
                  Text('${model.price}\$  ',
                      style: const TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis)),
                  Text('${model.oldPrice}\$',
                      style: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54)),
                ])),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite,
                    size: 18,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeMiddleTitles extends StatelessWidget {
  const HomeMiddleTitles({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('View All', style: TextStyle(fontSize: 14))
        ]));
  }
}

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}

class HomePageIndicator extends StatelessWidget {
  const HomePageIndicator({
    super.key,
    required this.pageController,
    required this.cubit,
  });

  final PageController pageController;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
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
    );
  }
}

class HomeCardsPageView extends StatelessWidget {
  const HomeCardsPageView({
    super.key,
    required this.pageController,
    required this.cubit,
  });

  final PageController pageController;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
