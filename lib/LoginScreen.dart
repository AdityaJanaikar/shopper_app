import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME!!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'User ID',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catalog');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[450],
                ),
                child: const Text('ENTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}