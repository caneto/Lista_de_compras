import 'package:flutter/material.dart';

class DailyPopupWidget extends StatefulWidget {
  final VoidCallback onConfirm;
  final VoidCallback? onLater;

  const DailyPopupWidget({super.key, required this.onConfirm, this.onLater});

  @override
  State<DailyPopupWidget> createState() => _DailyPopupWidgetState();
}

class _DailyPopupWidgetState extends State<DailyPopupWidget> {
  bool _marketingConsent = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey/white background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Broccoli Image Placeholder
          // In real app: Image.asset('assets/images/broccoli_bell.png', height: 100)
          SizedBox(
            height: 100,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Icon(
                  Icons.eco, // Broccoli-ish
                  size: 80,
                  color: Colors.green,
                ),
                Positioned(
                  left: 0,
                  bottom: 10,
                  child: Transform.rotate(
                    angle: -0.5,
                    child: const Icon(
                      Icons.notifications_active,
                      size: 40,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Seja notificado quando:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // List Items
          _buildListItem(
            Icons.person_add,
            Colors.green,
            'Alguém faz alterações ou compartilha uma lista com você',
          ),
          const SizedBox(height: 12),
          _buildListItem(
            Icons.event,
            Colors.orange,
            'Feriados e ocasiões importantes estão próximos',
          ),
          const SizedBox(height: 12),
          _buildListItem(
            Icons.star,
            Colors.amber,
            'Temos uma dica de compras, um desconto ou uma oferta de parceiro para você',
          ),

          const SizedBox(height: 24),

          // Checkbox Container
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Concordo em receber marketing da Listonic e de seus parceiros via push & e-mail.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _marketingConsent,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      setState(() {
                        _marketingConsent = val ?? false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Activate Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50), // Green
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
              ),
              child: const Text(
                'ATIVAR NOTIFICAÇÕES',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Maybe Later Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed:
                  widget.onLater ??
                  widget.onConfirm, // Default behavior if not provided
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[300], // Light grey background
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'TALVEZ MAIS TARDE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, Color iconColor, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
