import 'package:meta/meta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final List<String> _roles;

  final String name;

  User({
    required this.name,
    List<String>? roles
  }) :
    _roles = List.unmodifiable(roles ?? <String>[]);

  User copyWith({
    String? name
  }) => User(
        name: name ?? this.name
    );
}

@immutable
class AppState {
  final User? user;

  const AppState({
    this.user
  });

  AppState copyWith({User? user})
    => AppState(user: user);

  bool isSignedIn() => user != null;
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState());

  void setUser(User? user) => state = state.copyWith(user: user);
}

final appState = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier()
);