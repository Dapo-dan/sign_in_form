// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/styles.dart';

class TextInputForm extends StatefulWidget {
  const TextInputForm({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.readOnly = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.controller,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSubmit;
  final validator;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscure, readOnly;
  final String? label;
  final String? prefixText;
  final String? hint;
  final TextCapitalization textCapitalization;
  final keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  bool showpassword = true;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Text(
                widget.label!,
                style: TextStyles.style17extrabold,
              ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: widget.onTap,
              child: TextFormField(
                buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) =>
                    null,
                inputFormatters: widget.inputFormatters,
                enabled: widget.enabled,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                style: TextStyles.style16bold.copyWith(color: Colors.black),
                textCapitalization: widget.textCapitalization,
                validator: widget.validator,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmit,
                obscureText: widget.obscure ? showpassword : false,
                obscuringCharacter: '*',
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                cursorColor: Colors.black,
                readOnly: widget.readOnly,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFd5dae0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFd5dae0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFd5dae0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFd5dae0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  suffixIcon: widget.suffixIcon ??
                      (widget.obscure == true
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              child: Icon(
                                showpassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            )
                          : const SizedBox()),
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hint,
                  prefixText: widget.prefixText,
                  hintStyle:
                      TextStyles.style16bold.copyWith(color: Color(0xFF898b93)),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
