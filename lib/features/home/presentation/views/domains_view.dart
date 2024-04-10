import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/features/home/presentation/views/widgets/domains_view_body.dart';

class DomainsView extends StatelessWidget {
  const DomainsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: DomainsViewBody(),
    );
  }
}
