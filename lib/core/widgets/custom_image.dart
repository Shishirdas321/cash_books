import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



import '../enums/enums.dart';

import '../theme/app_colors.dart';
import '../utils/images.dart';


class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  final bool circular;
  final bool showBorder;
  final double? borderWidth;
  final ImageType imageType;
  final bool fullView;
  final Color? color;
  final Color? bgColor;
  final double? borderRadius;
  final BorderRadius? customBorderRadius;
  final GestureTapCallback? onTap;

  const CustomImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.onTap,
    this.borderWidth,
    this.borderRadius,
    this.customBorderRadius,
    this.fit = BoxFit.fill,
    this.placeholder = Images.placeholder,
    this.imageType = ImageType.network,
    this.circular = false,
    this.showBorder = false,
    this.fullView = false,
    this.color,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
          customBorderRadius ??
              BorderRadius.circular(
                circular ? MediaQuery.of(context).size.width / 2 : borderRadius ?? 0,
              ),
          color: bgColor ?? Colors.transparent,
          border:
          showBorder
              ? Border.all(
            color: AppColors.themeColor, // Customize if needed
            width: borderWidth ?? 1.0,
          )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(showBorder ? (borderWidth ?? 0) : 0.0),
          child: ClipRRect(
            borderRadius:
            customBorderRadius ??
                BorderRadius.circular(
                  circular ? MediaQuery.of(context).size.width / 2 : borderRadius ?? 0,
                ),
            child:
            image.isEmpty
                ? Image.asset(
              placeholder ?? Images.placeholder,
              height: height,
              width: width,
              fit: BoxFit.fill,
            )
                : imageType == ImageType.network
                ? CachedNetworkImage(
              placeholder:
                  (context, url) =>
                  Image.asset(
                    placeholder ?? Images.placeholder,
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  ),
              imageUrl: image,
              fit: fit ?? BoxFit.fill,
              height: height,
              width: width,
              errorWidget:
                  (c, o, s) =>
                  Image.asset(
                    placeholder ?? Images.placeholder,
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  ),
            )
                : imageType == ImageType.asset
                ? Image.asset(
              color: color,
              image ?? Images.placeholder,
              height: height,
              width: width,
              fit: BoxFit.fill,
            )
                : Image(
              fit: BoxFit.fill,
              image: FileImage(File(image)),
              height: height,
              width: width,

              errorBuilder:
                  (c, o, st) =>
                  Image.asset(
                    placeholder ?? Images.placeholder,
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
