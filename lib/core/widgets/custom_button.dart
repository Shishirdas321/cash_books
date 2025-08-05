
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/enums.dart';

import '../theme/app_colors.dart';
import 'custom_image.dart';
import 'custom_loader.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onTap;
  String buttonText;
  double? textSize;
  double? width;
  bool? loading;
  double? height;
  Color? bgColor;
  Border? border;
  double? borderRadius;
  Color? textColor;
  String? btnIcon;
  TextStyle? textStyle;
  ButtonType buttonType;

  CustomButton({
    super.key,
    this.width,
    this.height,
    this.loading,
    this.borderRadius,
    this.textStyle,
    required this.onTap,
    this.border,
    this.textSize,
    required this.buttonText,
    this.bgColor,
    this.btnIcon,
    this.textColor = AppColors.white,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (buttonType == ButtonType.primary) {
      textStyle = Theme.of(
        context,
      ).elevatedButtonTheme.style?.textStyle?.resolve({MaterialState.pressed});
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        color:
            bgColor ??
            Theme.of(context).elevatedButtonTheme.style?.backgroundColor
                ?.resolve({MaterialState.pressed}),
        border: border,
      );
    } else if (buttonType == ButtonType.secondary) {
      border = Border.all(color: Theme.of(context).shadowColor, width: 1.w);
      textStyle = Theme.of(context).elevatedButtonTheme.style?.textStyle
          ?.resolve({MaterialState.pressed})
          ?.copyWith(color: Theme.of(context).hoverColor);

      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        color: onTap==null?Theme.of(context).disabledColor:bgColor ?? Theme.of(context).canvasColor,
        border: border,
      );
    }
    else if (buttonType == ButtonType.tertiary) {
      textStyle = Theme.of(context).elevatedButtonTheme.style?.textStyle
          ?.resolve({MaterialState.pressed})
          ?.copyWith(color: Theme.of(context).hoverColor);

      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        color: bgColor ?? Theme.of(context).canvasColor,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child:
          loading == true
              ? Center(child: CustomLoader(size: 30.h, color: Theme.of(context).primaryColor))
              : Container(
                height: height ?? 40.h,
                width: width ?? MediaQuery.of(context).size.width / 3,
                decoration: decoration,
                child: Center(
                  child: Row(
                    spacing: btnIcon!=null?10:0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnIcon!=null?CustomImage(image: btnIcon!,
                        imageType: ImageType.asset,
                        color: AppColors.textBlack,
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.cover,):SizedBox(),
                      Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: textStyle,
                        maxLines: 1,

                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
