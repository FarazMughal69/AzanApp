import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../themeModes/themes.dart';

class FixedFirstItemListView extends StatefulWidget {
  @override
  _FixedFirstItemListViewState createState() => _FixedFirstItemListViewState();
}

class _FixedFirstItemListViewState extends State<FixedFirstItemListView> {
  final ScrollController _scrollController = ScrollController();
  double _firstItemOffset = 0;
  bool _isFixed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      // Calculate the position of the first item based on its size and other factors
      // For example, if the first item height is 50:
      _firstItemOffset = offset - 68;

      setState(() {
        _isFixed = _firstItemOffset >= 10.88797;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // Handle other scroll notifications if needed
          return false;
        },
        child: Stack(
          children: [
            if (_isFixed)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: buildFirstItem(), // Your first item widget
              ),
            ListView.builder(
              controller: _scrollController,
              itemCount: 20, // Replace with your item count
              itemBuilder: (context, index) {
                if (_isFixed && index == 0) {
                  return const SizedBox
                      .shrink(); // To prevent duplicate rendering
                }
                return buildListItem(index); // Your list item builder
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFirstItem() {
    // Your first item widget
    var _opacity;
    return Center(
      child: Container(
        height: mq.height * 0.08,
        width: _opacity == 0 ? mq.width : mq.width * 0.8,
        decoration: ThemeStyle.decoration(
          color: Theme.of(context).cardColor,
        ),
        child: ListTile(
          // leading: Text(
          //   'Today',
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
          title: Text(
            'Today',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            'Muharram 10, 1446 AH',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            'Wednesday',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  Widget buildListItem(int index) {
    // Your list item builder
    var _opacity;
    return Center(
      child: Container(
        height: mq.height * 0.08,
        width: _opacity == 0 ? mq.width : mq.width * 0.8,
        decoration: ThemeStyle.decoration(
          color: Theme.of(context).cardColor,
        ),
        child: ListTile(
          // leading: Text(
          //   'Today',
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
          title: Text(
            'Today',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            'Muharram 11, 1446 AH',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            'Wednesday',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
