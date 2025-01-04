import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'list_view_item.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        // List view item //
        return ListViewItem(
          imageLink:
              'https://student.valuxapps.com/storage/uploads/banners/1732574054JUQcm.6.jpg',
          text: '3'.tr(),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
          width: 2.0,
        ),
    );
  }
}
