import 'package:go_router/go_router.dart';
import 'package:task_manager/features/tasks/presentation/page/task_page.dart';

GoRouter route = GoRouter(
  routes: [GoRoute(path: "/", builder: (context, state) => TaskPage())],
);
