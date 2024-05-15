import 'package:flutter/material.dart';
import 'package:nectar/components/app_container_fruit.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';
import 'package:nectar/page/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: 10, bottom: 20),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage())),
                    child: _searchBox(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset("assets/images/paner.png"),
                ),
                _homeCate("Exclusive Offer"),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: 190,
                    child: _buildFruitList(),
                  ),
                ),
                _homeCate('Best Selling'),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: 190,
                    child: _buildFruitList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFruitList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: fruits.length,
      separatorBuilder: (context, indext) => const SizedBox(width: 4),
      itemBuilder: ((context, index) {
        final fruit = fruits.reversed.toList()[index];
        return AppContainerFruit(
          fruit: fruit,
          onPressed: () {
            Route route = MaterialPageRoute(
                builder: (context) => FruitDetail(fruit: fruit));
            Navigator.push(context, route);
          },
        );
      }),
    );
  }

  Widget _homeCate(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(top: 20, bottom: 20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 6.0)
            ]),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.red),
            SizedBox(width: 8),
            Text(
              "Search Store",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ));
  }
}
