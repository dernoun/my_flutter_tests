import 'package:flutter/material.dart';

import 'dimen.dart';
import 'icon_action.dart';

enum UserAction { profile, logout, about, imprint, dataPrivacy, recommend }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: DashboardHeader(),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          children: [
            Expanded(
              child: _GreetingUserText(
                username: 'med dernoun ',
              ),
            ),
            _ActionButton(icon: Icon(Icons.search), onPressed: () {}),
            NotificationBadge(),
            UserActionButton(),
          ],
        ),
        if (!XPlainDimensions.isPhone(context)) UserActionButton(),
      ],
    );
  }
}

class _GreetingUserText extends StatelessWidget {
  final String username;

  const _GreetingUserText({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Text(
        username,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Function onPressed;
  final Widget icon;

  const _ActionButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed(),
      color: Colors.grey,
    );
  }
}

class NotificationBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications),
      onPressed: null,
      color: Colors.grey,
    );
  }
}

class UserActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<UserAction>(
      itemBuilder: _buildActions,
      icon: Icon(
        Icons.account_circle,
        color: Colors.grey,
      ),
      onSelected: (action) {
        print(action);
      },
    );
  }

  List<PopupMenuEntry<UserAction>> _buildActions(BuildContext context) {
    return <PopupMenuEntry<UserAction>>[
      IconAction(
        title: Text(
            // FlutterI18n.translate(context, 'AccountSettings_Title_Text'),
            'Account Settings',
            style: TextStyle(fontWeight: FontWeight.w800)),
        value: UserAction.profile,
        icon: Icon(Icons.headset),
      ),
      IconAction(
        title: Text(
            // FlutterI18n.translate(context, 'AccountSettings_Title_Text'),
            'Logout',
            style: TextStyle(fontWeight: FontWeight.w800)),
        value: UserAction.logout,
        icon: Icon(Icons.headset),
      ),
    ];
  }
}
