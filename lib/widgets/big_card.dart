import 'package:flutter/material.dart';
import '../providers/my_app_state.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(color: Colors.pink);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          appState.current.asLowerCase,
          style: style,
          semanticsLabel:
              "${appState.current.first} ${appState.current.second}",
        ),
      ),
    );
  }
}