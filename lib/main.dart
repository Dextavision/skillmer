import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/skillmer.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Skillmer(),
    ),
  );
}
