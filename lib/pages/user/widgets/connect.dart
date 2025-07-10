import 'package:flutter/material.dart';
import 'connectionmanager.dart';

class ConnectionStatus extends StatelessWidget {
  const ConnectionStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: ConnectionManager.isOnline ? Colors.green : Colors.red,
          size: 12,
        ),
        SizedBox(width: 6),
        Text(
          ConnectionManager.isOnline ? 'Online' : 'Offline',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
