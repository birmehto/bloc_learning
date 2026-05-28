import 'package:bloc_learning/login/bloc/auth_bloc.dart';
import 'package:bloc_learning/login/pages/a_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AHomePage extends StatelessWidget {
  const AHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.userId, style: const TextStyle(fontSize: 20)),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutRequest());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ALoginPage()),
                      );
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            }

            return const Text('User not logged in');
          },
        ),
      ),
    );
  }
}
