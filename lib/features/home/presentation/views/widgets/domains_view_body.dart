import 'package:flutter/material.dart';
import 'package:route_it/core/widgets/gradient_container.dart';

class DomainsViewBody extends StatelessWidget {
  const DomainsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            child: GradientContainer(
      size: size,
      child: const Center(
        child: Text("data"),
      ),
    )));
  }
}
