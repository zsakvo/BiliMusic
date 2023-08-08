// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class CustomLoadMoreDelegate extends LoadMoreDelegate {
  final BuildContext context;
  const CustomLoadMoreDelegate(this.context);

  @override
  Widget buildChild(LoadMoreStatus status,
      {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.chinese}) {
    String text = builder(status);
    TextStyle style = TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
    );
    if (status == LoadMoreStatus.fail) {
      return Text(text, style: style);
    }
    if (status == LoadMoreStatus.idle) {
      return Text(text, style: style);
    }
    if (status == LoadMoreStatus.loading) {
      return Text(text, style: style);
    }
    if (status == LoadMoreStatus.nomore) {
      return Text(text, style: style);
    }

    return Text(text);
  }
}
