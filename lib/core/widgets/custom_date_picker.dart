// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:route_it/core/utils/app_colors.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key , required this.dateController});

  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: darkPrimaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: darkPrimaryColor.withOpacity(0.3),
              blurRadius: 40,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: TextField(
          controller: dateController,
          keyboardType: TextInputType.none,
          textAlign: TextAlign.center,
          showCursor: false,
          enableInteractiveSelection: false,
          cursorColor: Colors.transparent,
          cursorErrorColor: Colors.transparent,
          style: const TextStyle(
              color: lightPrimaryColor, fontStyle: FontStyle.normal
          ),
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "Enter your birthdate",
            hintStyle: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                color: lightPrimaryColor,
                fontStyle: FontStyle.normal,
                fontSize: 15),
          ),
          // onTap: (){
          //   showDatePicker(
          //     context: context,
          //     initialDate: DateTime.parse('2007-01-01'),
          //     firstDate: DateTime.parse('1980-01-01'),
          //     lastDate: DateTime.parse('2007-12-30'),
          //   ).then((value) {
          //     // print(DateFormat.yMMMd().format(value!));
          //     print(dateController.text);
          //     print(dateController.text);
          //     print(dateController.text);
          //     print(dateController.text);
          //     dateController.text = DateFormat.yMMMd().format(value!);
          //   });
          // },
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.parse('2007-01-01'),
              firstDate: DateTime.parse('1980-01-01'),
              lastDate: DateTime.parse('2007-12-30'),
            );

            if (selectedDate != null) {
              final formattedDate = DateFormat.yMMMd().format(selectedDate);
              dateController.text = formattedDate;
            }
          },
        ),
      ),
    );
  }
}
