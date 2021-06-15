import 'package:flutter/material.dart';
import 'package:my_flutter_tests/flavor.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: ChangeNotifierProvider<ValueNotifier<bool>>(
        create: (BuildContext context) {
          return ValueNotifier<bool>(false);
        },
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ValueNotifier<bool>>(context, listen: false);
    final flavor = Provider.of<Flavor>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$flavor',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              Consumer<ValueNotifier<bool>>(
                builder: (_, counter, __) => Text(
                  '${counter.value}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // child: Text(
                //   '${counter.value}',
                //   style: TextStyle(
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counter.value = !counter.value;
          },
        ));
  }
}
