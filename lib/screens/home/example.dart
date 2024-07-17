import 'package:flutter/material.dart';

class ContainerBehindExample extends StatefulWidget {
  @override
  _ContainerBehindExampleState createState() => _ContainerBehindExampleState();
}

class _ContainerBehindExampleState extends State<ContainerBehindExample> {
  late ScrollController _scrollController;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    setState(() {
      _opacity = 1 -
          (offset /
              300); // Adjust 300 to change the scroll length for opacity transition
      if (_opacity < 0) _opacity = 0; // Ensure opacity doesn't go negative
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Opacity Example'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: _opacity,
              child: Container(
                height: 300,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'First Container',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          ListView(
            controller: _scrollController,
            children: <Widget>[
              SizedBox(height: 300),
              Container(
                height: 300,
                color: const Color.fromARGB(255, 13, 27, 38),
                child: Center(
                  child: Text(
                    'First sec Container',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ), // Placeholder to offset the ListView content
              Container(
                height: 300,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Second Container',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('List Item $i'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}


// Positioned(
                    //   child: Container(
                    //     width: mq.width,
                    //     height: mq.height * 0.36,
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //         colors: [
                    //           Theme.of(context).splashColor,
                    //           Colors.transparent,
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: mq.height * 0.29,
                    //   child: Container(
                    //     width: mq.width * 0.75,
                    //     height: mq.height * 0.35,
                    //     decoration:
                    //         BoxDecoration(color: Theme.of(context).cardColor),
                    //   ),
                    // ),