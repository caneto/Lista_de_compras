import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 30),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Bem-vindo(a) de volta! 👋',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Illustration / Carousel Placeholder
            Column(
              children: [
                // Illustration placeholder
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: Colors.orange[300],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Text
                const Text(
                  'Uma lista para todos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Compartilhe suas listas, rastreie alterações e economize ligações desnecessárias.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(active: false),
                    _buildDot(active: false),
                    _buildDot(active: true), // Example active state
                    _buildDot(active: false),
                  ],
                ),
              ],
            ),

            const Spacer(),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Facebook
                  ElevatedButton.icon(
                    onPressed: () {
                      // Action for Facebook
                    },
                    icon: const Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                    ),
                    label: const Text('Continuar com Facebook'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1877F2),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Google
                  OutlinedButton.icon(
                    onPressed: () {
                      // Action for Google
                    },
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                    ), // Multi-colored usually, simply using icon here
                    label: const Text('Continuar com Google'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey[300]!),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'OU',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Email Login
            TextButton(
              onPressed: () {
                context.go('/login/email');
              },
              child: const Text(
                'ENTRAR COM E-MAIL',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Register Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tem uma conta? ',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    // Action for Register
                  },
                  child: const Text(
                    'Registre-se',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({required bool active}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.grey[700] : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }
}
