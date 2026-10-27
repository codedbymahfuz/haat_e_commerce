import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class ProductColorsListSection extends StatefulWidget {
  const ProductColorsListSection({super.key});

  @override
  State<ProductColorsListSection> createState() =>
      _ProductColorsListSectionState();
}

class _ProductColorsListSectionState extends State<ProductColorsListSection> {
  List<Color> colorsList = [Colors.green, Colors.black, Colors.blue];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 7),

        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: colorsList.length,
              itemBuilder: (context, index) {
                final itemColor = colorsList[index];

                final isSelected = selectIndex == index;
               
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       selectIndex = index;
                     });
                    },
                    child: Container(
                      height: 30,
                      width: 30,                 
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                         border: Border.all(
                          color: isSelected ? AppColors.accent : Colors.transparent, width: 2,),
                      ),
                              
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: itemColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

       
      ],
    );
  }

}
