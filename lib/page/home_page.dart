import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/components/app_container_fruit.dart';
import 'package:nectar/components/app_search_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  List<FruitModel> searchList = List.from(fruits);

  void _search(String value) {
    value = value.toLowerCase();
    searchList = fruits
        .where((element) => (element.name ?? '').toLowerCase().contains(value))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchList = [...fruits];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(
        color: Colors.white,
        text: "Dhaka, Banassre",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: 10, bottom: 20),
                  child: AppSearchBox(
                    controller: searchController,
                    onchange: _search,
                  ),
                ),
                (searchController.text.trim().isEmpty)
                    ? _buildHome()
                    : _buildSearch()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return SizedBox(
      height: 500,
      child: Expanded(
        child: searchList.length == 0
            ? const Center(
                child: Text("Not fouder"),
              )
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                itemCount: searchList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final fruit = searchList.reversed.toList()[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FruitDetail(fruit: fruit))),
                    child: ListTile(
                      leading: Image.asset(fruit.img ?? ""),
                      title: Text(fruit.name ?? ""),
                      subtitle: Text('${fruit.price ?? ""}'),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset("assets/images/paner.png"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20)
              .copyWith(top: 20, bottom: 20),
          child: const Text(
            "Exclusive Offer",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 190,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: searchList.length,
              separatorBuilder: (context, indext) => const SizedBox(width: 4),
              itemBuilder: ((context, index) {
                final fruit = searchList.reversed.toList()[index];
                return AppContainerFruit(
                  fruit: fruit,
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => FruitDetail(fruit: fruit));
                    Navigator.push(context, route);
                  },
                );
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 20, bottom: 20),
          child: const Text(
            "Best Selling",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 190,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: fruits.length,
              separatorBuilder: (context, indext) => const SizedBox(width: 4),
              itemBuilder: ((context, index) => AppContainerFruit(
                    fruit: fruits[index],
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) =>
                              FruitDetail(fruit: fruits[index]));
                      Navigator.push(context, route);
                    },
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
