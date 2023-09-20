import 'package:cookin/pages/pages.dart';
import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/notification_alert.dart';
import 'package:flutter/material.dart';

class CustomTabsBars extends StatefulWidget {
  const CustomTabsBars({super.key});

  @override
  State<CustomTabsBars> createState() => _CustomTabsBarsState();
}

class _CustomTabsBarsState extends State<CustomTabsBars>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: TabBar(
              controller: _tabController,
              labelColor: AppColors.white,
              labelPadding: const EdgeInsets.symmetric(vertical: 8),
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: -33, vertical: 8),
              unselectedLabelColor: AppColors.secondaryColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: AppColors.primaryColor,
              ),
              tabs: const [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(
                  text: ' Procedure',
                ),
              ]),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: TabBarView(controller: _tabController, children: const [
            //IngredientCard2(mealId: 52874),
            NotificationCard(),
          ],),
        )
      ],
    );
  }
}
