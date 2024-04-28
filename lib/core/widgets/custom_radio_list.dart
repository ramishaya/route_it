import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/features/register/presentation/view_models/radio_cubit/radio_cubit.dart';

class CustomRadioList extends StatelessWidget {
  const CustomRadioList({super.key,required this.options, required this.size});

  final List<String> options;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        return SizedBox(
          height: size,
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(options[index]),
                value: index,
                activeColor: secondaryColor2,
                groupValue: RadioCubit.get(context).currentIndex,
                onChanged: (value) {
                  RadioCubit.get(context).changeRadioIndex(value ?? 0);
                },
              );
            },
          ),
        );
      },
    );
  }
}
