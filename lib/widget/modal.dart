import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solar_icons/solar_icons.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({Key? key}) : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: Adaptive.h(65),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        const MyText(
                          text: 'Filter Search',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyText(
                                text: 'Time',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Row(
                                children: [
                                  MyOutlinedButton(
                                      text: 'All',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Newest',
                                      color: AppColors.primaryColor,
                                      bgcolor: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Oldest',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Popularity',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                ],
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              const MyText(
                                text: 'Rate',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Row(
                                children: [
                                  MyOutlinedButton2(
                                      color: AppColors.white,
                                      bgcolor: AppColors.primaryColor,
                                      width: 1,
                                      text: '5'),
                                  MyOutlinedButton2(
                                      color: AppColors.white,
                                      bgcolor: AppColors.primaryColor,
                                      width: 1,
                                      text: '4'),
                                  MyOutlinedButton2(
                                      color: AppColors.primaryColor,
                                      bgcolor: AppColors.white,
                                      width: 1,
                                      text: '3'),
                                  MyOutlinedButton2(
                                      color: AppColors.white,
                                      bgcolor: AppColors.primaryColor,
                                      width: 1,
                                      text: '2'),
                                  MyOutlinedButton2(
                                      color: AppColors.white,
                                      bgcolor: AppColors.primaryColor,
                                      width: 1,
                                      text: '1'),
                                ],
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              const MyText(
                                text: 'Category',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Wrap(
                                children: [
                                  MyOutlinedButton(
                                      text: 'All',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Cereal',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Vegetables',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Dinner',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Chinese',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Local Dish',
                                      bgcolor: AppColors.white,
                                      color: AppColors.primaryColor,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Fruit',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Breakfast',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Spanish',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'Lunch',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                  MyOutlinedButton(
                                      text: 'African',
                                      bgcolor: AppColors.primaryColor,
                                      color: AppColors.white,
                                      width: 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const MyFilledBtn(
                          color: AppColors.white,
                          text: 'Filter',
                          resppadding: 0.25,
                          bgcolor: AppColors.primaryColor,
                          navigateToNextPage: false,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const IconButtonNav(
          color: Colors.white,
          icon: SolarIconsOutline.tuning_2,
        ),
      ),
    );
  }
}

class IconButtonNav extends StatelessWidget {
  const IconButtonNav({
    Key? key,
    required this.color,
    this.radius = 10,
    required this.icon,
    this.iconsize = 24,
    this.padding = 10,
  }) : super(key: key);

  final Color color;
  final double radius;
  final IconData icon;
  final double iconsize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Icon(
          icon,
          size: iconsize,
          color: color,
        ),
      ),
    );
  }
}
