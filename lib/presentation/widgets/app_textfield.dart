import 'package:flutter/material.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;

  const AppTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.grey),
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 35,
            minHeight: 35,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(.3),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(.3),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(.3),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
