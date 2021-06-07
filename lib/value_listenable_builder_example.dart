import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValueListenableBuilderExample extends StatefulWidget {
  @override
  _ValueListenableBuilderExampleState createState() =>
      _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState
    extends State<ValueListenableBuilderExample> {
  Counter _counter = Counter(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Value Listenable Builder Example',
        ),
        actions: [
          IconButton(
            tooltip: 'Copy',
            onPressed: () {
              Clipboard.setData(new ClipboardData(text: ''));
            },
            icon: Icon(
              Icons.copy,
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (context, _notifierValue, _) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, _) {
                    return Text(
                      _notifierValue.toString(),
                      style: TextStyle(fontSize: 32.0),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 15.0,
                left: 15.0,
                child: _buildFloatingActionButton(
                    heroTag: '1',
                    iconData: Icons.remove,
                    onPressed: () {
                      _counter.decrease();
                    },
                    isDisabled: int.parse(_notifierValue.toString()) <= 0),
              ),
              Positioned(
                bottom: 15.0,
                right: 15.0,
                child: _buildFloatingActionButton(
                  heroTag: '2',
                  iconData: Icons.add,
                  onPressed: () {
                    _counter.increase();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton({
    required String heroTag,
    required IconData iconData,
    required void Function()? onPressed,
    bool isDisabled = false,
  }) {
    return FloatingActionButton(
      backgroundColor: isDisabled ? Colors.grey : Colors.blue,
      elevation: 0,
      heroTag: heroTag,
      child: Icon(iconData),
      onPressed: isDisabled ? () {} : onPressed,
    );
  }
}

class Counter extends ValueNotifier {
  Counter(value) : super(value);
  void increase() {
    value += 1;
    notifyListeners();
  }

  void decrease() {
    value -= 1;
    notifyListeners();
  }
}
