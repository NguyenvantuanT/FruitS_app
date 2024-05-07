
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/components/app_container_fruit.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  List<FruitModel> fruit_list = List.from(fruits);

  void updateList(String value) {
    setState(() {
      fruit_list = fruits
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20.0,
            bottom: 20.0,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/Icon.png",
                  height: 30,
                  width: 30,
                ),
                const Text(
                  "Dhaka, Banassre",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: 20, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      onChanged: (value) => updateList(value),
                      controller: searchController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Store",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: Icon(Icons.search)),
                    ),
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

  SizedBox _buildSearch() {
    return SizedBox(
      height: 500,
      child: Expanded(
        child: fruit_list.length == 0
            ? const Center(
                child: Text("Not fouder"),
              )
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                itemCount: fruit_list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final fruit = fruit_list[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FruitDetail(fruit: fruit))),
                    child: ListTile(
                      leading: Image.asset(fruit.img  ?? ""),
                      title: Text(fruit.name ?? ""),
                      subtitle: Text('${fruit.price ?? ""}'),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Column _buildHome() {
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
