import 'package:flutter/material.dart';


class Friend{
  Friend(this.name,this.level, this.badge, this.color, this.lastMessage, this.lastSeen);

  final String name;
  final int level;
  final Image badge;
  final Color color;
  final String lastMessage;
  final DateTime lastSeen;


}