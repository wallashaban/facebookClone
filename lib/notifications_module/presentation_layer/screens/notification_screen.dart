import 'package:flutter/material.dart';

import '../controllers/notifications_cubit.dart';

import '../../../core/utils/exports.dart';
import '../../../home_module/ppresentation_layer/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // var cubit = BlocProvider.of<NotificationsCubit>(context);
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notifications')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var notifications = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationWidget(
                      notifications: notifications[index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}
