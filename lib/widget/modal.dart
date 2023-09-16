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
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: height,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        const MyText(
                          text: 'Filter Search',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 2,
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
                              const FilterButtons(
                                showIcons: false,
                                icons: [
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded)
                                ],
                                options: [
                                  'All',
                                  'Newest',
                                  'Oldest',
                                  'Popularity'
                                ],
                              ),
                              const SizedBox(
                                height: 1.5,
                              ),
                              const MyText(
                                text: 'Rate',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 0.5,
                              ),
                              const FilterButtons(
                                showIcons: true,
                                icons: [
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded),
                                  Icon(Icons.star_rounded)
                                ],
                                options: ['5', '4', '3', '2', '1'],
                                iconColor: AppColors.primaryColor,
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
                              const ModalOptions(options: [
                                'All',
                                'Cereal',
                                'Vegetables',
                                'Dinner',
                                'Chinese',
                                'Local Dish',
                                'Fruit',
                                'Breakfast',
                                'Spanish',
                                'Lunch',
                                'African',
                              ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(context),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: Adaptive.w(25), vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const MyText(
                            text: 'Apply Filter',
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
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

class FilterButtons extends StatefulWidget {
  final List<String> options;
  final List<Icon> icons; // List of icons corresponding to each option.
  final bool showIcons; // A flag to determine whether to show icons.
  final Color? iconColor; // Color for icons, made optional with `?`.

  const FilterButtons({super.key, 
    required this.options,
    required this.icons,
    this.showIcons = true, // Default to showing icons.
    this.iconColor, // Made optional by removing `required`.
  });

  @override
  // ignore: library_private_types_in_public_api
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: SizedBox(
        height: 35, // Adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.options.length,
          itemBuilder: (context, index) => buildButton(index),
        ),
      ),
    );
  }

  Widget buildButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: selectedIndex == index ? AppColors.primaryColor : Colors.white,
          border: Border.all(color: AppColors.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              widget.options[index],
              style: TextStyle(
                color: selectedIndex == index
                    ? Colors.white
                    : AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 2),
            if (widget.showIcons && widget.iconColor != null) ...[
              Icon(
                widget.icons[index].icon,
                color: selectedIndex == index ? Colors.white : widget.iconColor,
              ),
              // Add spacing between icon and text
            ],
          ],
        ),
      ),
    );
  }
}

class ModalOptions extends StatefulWidget {
  final List<String> options;
  // Color for icons, made optional with `?`.

  const ModalOptions({super.key, 
    required this.options,
    // Made optional by removing `required`.
  });

  @override
  // ignore: library_private_types_in_public_api
  _ModalOptionsState createState() => _ModalOptionsState();
}

class _ModalOptionsState extends State<ModalOptions> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Wrap(
        spacing: 10, // Adjust the spacing as needed
        children: List.generate(
          widget.options.length,
          (index) => buildButton(index),
        ),
      ),
    );
  }

  Widget buildButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2.5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selectedIndex == index ? AppColors.primaryColor : Colors.white,
          border: Border.all(color: AppColors.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.options[index],
          style: TextStyle(
            color:
                selectedIndex == index ? Colors.white : AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
