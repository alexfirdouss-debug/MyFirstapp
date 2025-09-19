// GENERATED CODE - DO NOT MODIFY
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../views/startup/startup_view.dart';
import '../views/login/login_view.dart';
import '../views/home/home_view.dart';
import '../views/focus/focus_view.dart';
import '../views/planner/planner_view.dart';
import '../views/goals/goals_view.dart';
import '../views/music/music_view.dart';

class Routes {
  static const String startupView = '/';
  static const String loginView = '/login';
  static const String homeView = '/home';
  static const String focusView = '/focus';
  static const String plannerView = '/planner';
  static const String goalsView = '/goals';
  static const String musicView = '/music';
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.focusView, page: FocusView),
    RouteDef(Routes.plannerView, page: PlannerView),
    RouteDef(Routes.goalsView, page: GoalsView),
    RouteDef(Routes.musicView, page: MusicView),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) => MaterialPageRoute(builder: (context) => StartupView()),
    LoginView: (data) => MaterialPageRoute(builder: (context) => LoginView()),
    HomeView: (data) => MaterialPageRoute(builder: (context) => HomeView()),
    FocusView: (data) => MaterialPageRoute(builder: (context) => FocusView()),
    PlannerView: (data) => MaterialPageRoute(builder: (context) => PlannerView()),
    GoalsView: (data) => MaterialPageRoute(builder: (context) => GoalsView()),
    MusicView: (data) => MaterialPageRoute(builder: (context) => MusicView()),
  };
}
