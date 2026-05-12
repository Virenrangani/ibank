import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/constant/border/custom_border_radius.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../../../../core/image/app_image.dart';


final List<Map<String,dynamic>> bankService=[
  {
    'image':AppImage.b1,
    'title':AppStrings.accountCard
  },
  {
    'image':AppImage.b2,
    'title':AppStrings.transfer
  },
  {
    'image':AppImage.b3,
    'title':AppStrings.withdraw
  },
  {
    'image':AppImage.b4,
    'title':AppStrings.mobilePrepaid
  },
  {
    'image':AppImage.b5,
    'title':AppStrings.payBill
  },
  {
    'image':AppImage.b6,
    'title':AppStrings.saveOnline
  },
  {
    'image':AppImage.b7,
    'title':AppStrings.creditCard
  },
  {
    'image':AppImage.b8,
    'title':AppStrings.transactionReport
  },
  {
    'image':AppImage.b9,
    'title':AppStrings.beneficiary
  }
];

class GridCard extends StatelessWidget {
  final int index;
  const GridCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: CustomBorderRadius.cir12,
          color: AppColors.background,
          boxShadow: [BoxShadow(
            color: AppColors.border,
            blurRadius:2,
          )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(bankService[index]['image'],fit: BoxFit.cover,),
          ),
          Gap(10),
          Text(
            bankService[index]['title'], style: AppTextStyles.titleSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
