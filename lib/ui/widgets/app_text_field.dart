import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/extensions/app_extensions.dart';

import '../../core/utils/colors.gen.dart';
import 'app_widgets.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final VoidCallback? onPrefixTap;
  final ValueChanged<String> onChanged;
  final String title;
  final bool isFill;
  final TextInputFormatter? inputFormatter;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool enabled;
  final String initialText;
  final bool hasError;
  final bool isMultiLine;
  final double? height;
  final bool hasTitle;
  final bool autoFocus;
  final Widget? suffixWidget;
  final Color? bgColor;

  AppTextField(
      {required this.hintText,
      required this.onChanged,
      required this.title,
      this.isMultiLine = false,
      this.inputFormatter,
      this.textInputType,
      this.isPassword = false,
      this.enabled = true,
      this.isFill = false,
      this.initialText = '',
      this.hasError = false,
      this.height,
      this.hasTitle = true,
      this.autoFocus = false,
      this.suffixWidget,
      this.onPrefixTap,
      this.bgColor = ColorName.gray1,
      Key? key})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textEditingController;
  late bool obscureText;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: widget.initialText,
    );

    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputBorder border = widget.hasError
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: ColorName.gray1),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.hasTitle
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.textLocale(
                    localeKey: widget.title,
                    color: ColorName.gray6,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ).paddingOnly(top: 15),
                ],
              ).paddingOnly(bottom: 4)
            : const SizedBox(),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(

            autofocus: widget.autoFocus ? true : false,
            expands: widget.isMultiLine ? true : false,
            textAlignVertical: TextAlignVertical.top,
            maxLines: widget.isMultiLine ? null : 1,
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              // border: _border,
              disabledBorder: border,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: widget.hasError ? Colors.red : ColorName.gray1,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: ColorName.green),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: ColorName.green),
              ),
              contentPadding: const EdgeInsets.all(14),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),

              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        !obscureText ? Icons.visibility : Icons.visibility_off,
                        color: ColorName.green1,
                      ),
                    )
                  : null,
            ),
            obscureText: obscureText,
            keyboardType: widget.textInputType,
            onChanged: (v) => widget.onChanged(v),
            inputFormatters:
                widget.inputFormatter == null ? null : [widget.inputFormatter!],
          ),
        )
      ],
    );
  }
}
