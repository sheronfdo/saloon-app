import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/profile/rate/rate_view_model.dart';


class RateWorkerPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RateWorkerViewModel>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rate Worker',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Please give us your rate for the worker',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color: index < viewModel.selectedRating
                        ? Colors.orange
                        : Colors.grey[300],
                  ),
                  onPressed: () => viewModel.setRating(index + 1),
                );
              }),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: viewModel.reportSaloon,
              child: Text(
                'Report Saloon',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: viewModel.selectedRating > 0
                  ? viewModel.confirmRating
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBF4011),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
