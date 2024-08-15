

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/features/competition/data/models/competitor_models.dart';

class CompetitorListScreen extends StatelessWidget {
  const CompetitorListScreen({super.key, required this.competitors});

  final List<Competitor> competitors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
        title: const Text('All Competitors'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: competitors.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                  competitors[index].competitorImage ??
                      'https://via.placeholder.com/150',
                ),
              ),
              title: Text(
                competitors[index].competitorName!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Competitor',
                style: TextStyle(color: Colors.grey[100]),
              ),
            ),
          );
        },
      ),
    );
  }
}
