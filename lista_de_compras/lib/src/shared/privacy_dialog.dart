import 'package:flutter/material.dart';

class PrivacyConsentDialog extends StatelessWidget {
  final VoidCallback onAgree;

  const PrivacyConsentDialog({super.key, required this.onAgree});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Preocupamo-nos com sua privacidade',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.4,
                ),
                children: [
                  const TextSpan(text: 'Com o seu acordo, nós e os '),
                  TextSpan(
                    text: 'nossos parceiros',
                    style: TextStyle(
                      color: Colors.green[700],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ' utilizamos o armazenamento de dispositivos para armazenar e acessar dados pessoais, como dados de geolocalização precisos, e identificação através da digitalização de dispositivos.\n'
                        'Processamos esses dados para fins como anúncios e conteúdos personalizados, medição de anúncios e conteúdos, perspectivas do público e desenvolvimento de produtos.\n'
                        'É possível retirar o seu consentimento ou opor-se ao processamento de dados com base em interesses legítimos a qualquer momento, acessando "Preferências de consentimento" no menu deste aplicativo.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Link action
              },
              child: Text(
                'Gerencie nossos 52 parceiros',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                // Opt out action
              },
              child: const Text(
                'SAIBA MAIS OU OPTE POR SAIR',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onAgree,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50), // Green
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'CONCORDAR & FECHAR',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
