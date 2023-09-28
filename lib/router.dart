import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screen/detail_album.dart';
import 'package:test_app/screen/list_album.dart';

final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: 'Home page',
          builder: (BuildContext context, GoRouterState state) => const MyHomePage(title: 'Flutter Demo Test'),
          routes: [
            GoRoute(
                path: 'albums',
                name: 'List album page',
                builder: (context, state) => const ListAlbum(),
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: 'detail album page',
                    builder: (BuildContext context, GoRouterState state) => const DetailAlbum(),
                  )
                ]
            )
          ]
      )
    ]
);