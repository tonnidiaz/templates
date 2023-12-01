import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String getRoute(BuildContext context) {
  return GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
}
