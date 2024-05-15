import 'package:flutter/material.dart';
import 'package:nectar/components/app_edit_fruit.dart';
import 'package:nectar/components/app_search_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<FruitModel> searchLists = [];

  @override
  void initState() {
    super.initState();
    searchLists = [...fruits];
  }

  void _search(String value) {
    value = value.toLowerCase();
    searchLists = fruits
        .where((element) => (element.name ?? '').toLowerCase().contains(value))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTabBar(text: 'Search Fruit'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20, bottom: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(bottom: 20),
                child: AppSearchBox(
                  controller: searchController,
                  onchange: _search,
                ),
              ),
                searchLists.isEmpty
                  ? const Center(
                      child: Text("Not fouder"),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: ((context, index) =>
                          const SizedBox(height: 10)),
                      itemCount: searchLists.length,
                      itemBuilder: (context, index) {
                        final searchList = searchLists.reversed.toList()[index];
                        return AppEditFruit(
                          searchList,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FruitDetail(fruit: searchList))),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
