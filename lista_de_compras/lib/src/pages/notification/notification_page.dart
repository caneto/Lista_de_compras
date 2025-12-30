import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Header Icon
              const Center(
                child: Icon(
                  Icons.notifications_active,
                  size: 80,
                  color: Color(0xFFFFC107), // Amber/Yellow color
                ),
              ),
              const SizedBox(height: 40),

              // Title
              const Text(
                'Seja notificado quando:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 32),

              // Notification Items
              _buildNotificationItem(
                icon: Icons.person_add,
                iconColor: Colors.green,
                text: 'Alguém faz alterações ou compartilha uma lista com você',
              ),
              const SizedBox(height: 24),
              _buildNotificationItem(
                icon: Icons.event,
                iconColor: Colors.orange,
                text: 'Feriados e ocasiões importantes estão próximos',
              ),
              const SizedBox(height: 24),
              _buildNotificationItem(
                icon: Icons.star,
                iconColor: Colors.redAccent,
                text:
                    'Temos uma dica de compras, um desconto ou uma oferta de parceiro para você',
              ),

              const Spacer(),

              // Privacy Note
              Text(
                'Ao ativar, você aceita o marketing da Listonic e de seus parceiros via push e e-mail',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

              // Buttons
              ElevatedButton(
                onPressed: () {
                  // Action for Enable Notifications
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'ATIVAR NOTIFICAÇÕES',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // Action for Maybe Later
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'TALVEZ MAIS TARDE',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF444444),
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
