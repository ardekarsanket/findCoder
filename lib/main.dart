import 'package:findcoder/repositories/user_repository.dart';
import 'package:findcoder/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'bloc/blocDelegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository _userRepository = UserRepository();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: _userRepository)
        ..add(AppStarted()),
      child: Home(userRepository: _userRepository)));
}
