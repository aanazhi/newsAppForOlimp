import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_for_olimp/presentation/auth_screen.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: AuthScreen())));
}
