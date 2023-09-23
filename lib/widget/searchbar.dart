import 'package:cookin/pages/search_page.dart';
import 'package:cookin/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarFood extends StatefulWidget {
  const SearchBarFood({super.key, required this.hintText, });

  final String hintText;

  @override
  State<SearchBarFood> createState() => _SearchBarFoodState();
}

class _SearchBarFoodState extends State<SearchBarFood> {
  List<String> suggestions = [
    'apple',
    'banana',
    'chicken',
    'tart',
    'fig',
    'cherry',
  ];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(querylistener);
  }

  @override
  void dispose() {
    controller.removeListener(querylistener);
    controller.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  void search(String Query) {
    final List<String> suggestionList = [];
    suggestionList.addAll(suggestions);
    setState(() {
      suggestionList
          .retainWhere((s) => s.toLowerCase().contains(Query.toLowerCase()));
    });
  }

  void querylistener() {
    search(controller.text);
  }

  void clearSearch() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryColor, width: 1)),
          child: SearchBar(
            hintText: widget.hintText,
            hintStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            controller: controller,
            elevation: MaterialStateProperty.resolveWith<double?>((_) => 0),
            shadowColor: null,
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            ),
            onSubmitted: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(value: value),
                ),
              );
            },
            leading: const Icon(
              SolarIconsOutline.magnifier,
              color: AppColors.primaryColor,
            ),
            
          ),
        ),
      ],
    );
  }
}
      