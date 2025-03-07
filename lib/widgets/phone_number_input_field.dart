import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sign_in_form/constants/styles.dart';

class PhoneTextInputForm extends StatefulWidget {
  const PhoneTextInputForm({
    super.key,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.controller,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onTap,
    this.borderRadius = 10,
  });

  final Function(PhoneNumber)? onChanged;
  final onSubmit;
  final onSaved;
  final validator;
  final TextEditingController? controller;
  final String? hint;
  final keyboardType, textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final double borderRadius;

  @override
  State<PhoneTextInputForm> createState() => _PhoneTextInputFormState();
}

class _PhoneTextInputFormState extends State<PhoneTextInputForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: IntlPhoneField(
              cursorColor: Colors.black,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              keyboardType: widget.keyboardType,
              style: TextStyles.style14regular.copyWith(color: Colors.black),
              validator: widget.validator,
              onSaved: (val) {
                if (widget.controller != null) {
                  widget.controller!.text = val!.completeNumber;
                }
                widget.onChanged?.call(val!);
              },
              onChanged: widget.onChanged,
              initialCountryCode: 'US',
              initialValue: '',
              showCountryFlag: false,
              showDropdownIcon: false,
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Color(0xFFebdffa),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFebdffa)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFebdffa)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFebdffa)),
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
                  borderSide: BorderSide(color: Color(0xFFebdffa)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                hintText: widget.hint,
                hintStyle:
                    TextStyles.style12medium.copyWith(color: Color(0xFF4f4b55)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
