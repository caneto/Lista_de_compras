import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Olá!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('👋', style: TextStyle(fontSize: 32)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[400],
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Login CTA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'ENTRAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Faça login para compartilhar e sincronizar as listas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Settings Items
              _buildMenuItem(
                icon: Icons.settings,
                label: 'Configurações',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.palette,
                label: 'Aparência',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // Feedback Section
              _buildLargeIconMenuItem(
                icon: Icons.favorite,
                iconColor: Colors.red,
                title: 'Curtiu o aplicativo?',
                subtitle: 'Avalie-nos com ⭐⭐⭐⭐⭐ no Google Play',
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildMenuItem(
                icon:
                    Icons.help_outline, // Using help_outline as a standard icon
                label:
                    'Ajuda e feedback', // This might need a custom icon to match exact image (lifebuoy)
                customIcon: FontAwesomeIcons.lifeRing,
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.translate,
                label: 'Ajude-nos traduzir',
                onTap: () {},
              ),

              const SizedBox(height: 48),

              // Footer
              Center(
                child: Text(
                  'POLÍTICA DE PRIVACIDADE  •  TERMOS DE SERVIÇO',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    IconData? customIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            if (customIcon != null)
              FaIcon(customIcon, color: Colors.grey[600], size: 24)
            else
              Icon(icon, color: Colors.grey[600], size: 28),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeIconMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    children: [
                      const TextSpan(text: 'Avalie-nos com '),
                      const TextSpan(
                        text: '⭐⭐⭐⭐⭐',
                        style: TextStyle(color: Colors.amber, fontSize: 10),
                      ),
                      const TextSpan(text: ' no Google Play'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
