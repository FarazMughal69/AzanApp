import 'package:flutter/material.dart';
// import 'package:solar_icons/solar_icons.dart';

class AzanContentWidget extends StatefulWidget {
  final String prayerName;
  final String prayerTime;
  final IconData icon;
  final int index;
  const AzanContentWidget({
    super.key,
    required this.prayerName,
    required this.prayerTime,
    required this.icon,
    required this.index,
  });

  @override
  State<AzanContentWidget> createState() => _AzanContentWidgetState();
}

class _AzanContentWidgetState extends State<AzanContentWidget> {
  late int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: widget.index == _activeIndex
            ? Theme.of(context).primaryColor
            : Colors.transparent,
        title: Text(
          widget.prayerName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          widget.prayerTime,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Icon(
          widget.icon,
          size: 29,
        ),
        onTap: () => setState(() => _activeIndex = widget.index)
        // onTap: () {
        // setState(() {
        //   for (int i = 0; i < _isSelected.length; i++) {
        //     _isSelected[i] = false; // Deselect all first
        //   }
        //   _isSelected[index] = true; // Select the tapped tile
        // });}
        );
  }
}
