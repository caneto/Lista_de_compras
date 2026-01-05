import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/login_cta_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _openListOnStart = true;
  bool _keepScreenOn = false;

  bool _multiplyPriceQuantity = true;
  bool _autoAddLastPrices = true;

  bool _isGeralExpanded = true;
  bool _isListasExpanded = true;
  bool _isApoioExpanded = true;
  bool _isAplicativoExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginCtaWidget(),
            const SizedBox(height: 24),
            _buildSectionHeader(
              title: 'GERAL',
              isExpanded: _isGeralExpanded,
              onTap: () => setState(() => _isGeralExpanded = !_isGeralExpanded),
            ),
            if (_isGeralExpanded) ...[
              const SizedBox(height: 8),
              _buildListTile(
                title: 'Aparência',
                onTap: () => context.push('/settings/appearance'),
                showChevron: true,
              ),
              _buildListTile(
                title: 'Sugestões de produtos',
                subtitle: 'Selecione um idioma para sugestões de produtos',
                trailing: const Text(
                  'PORTUGUÊS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {},
              ),
              _buildListTile(title: 'Notificações', onTap: () {}),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: const Color(0xFF4CAF50),
                title: const Text(
                  'Abrir a última lista usada ao iniciar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                value: _openListOnStart,
                onChanged: (bool value) {
                  setState(() {
                    _openListOnStart = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: const Color(0xFF4CAF50),
                title: const Text(
                  'Manter a tela ligada',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                value: _keepScreenOn,
                onChanged: (bool value) {
                  setState(() {
                    _keepScreenOn = value;
                  });
                },
              ),
              _buildListTile(
                title: 'Remover propagandas',
                subtitle: 'Torne-se um usuário premium do Listonic 💎',
                trailing: const Icon(Icons.block, color: Colors.grey),
                onTap: () {},
              ),
            ],

            const SizedBox(height: 24),
            const SizedBox(height: 24),
            _buildSectionHeader(
              title: 'LISTAS',
              isExpanded: _isListasExpanded,
              onTap: () =>
                  setState(() => _isListasExpanded = !_isListasExpanded),
            ),
            if (_isListasExpanded) ...[
              const SizedBox(height: 8),
              _buildListTile(
                title: 'Gerenciar categorias',
                onTap: () {},
                showChevron: true,
              ),
              _buildListTile(
                title: 'Gerenciar gestos',
                onTap: () {},
                showChevron: true,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: const Color(0xFF4CAF50),
                title: const Text(
                  'Multiplicar (preço x quantidade)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                value: _multiplyPriceQuantity,
                onChanged: (bool value) {
                  setState(() {
                    _multiplyPriceQuantity = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: const Color(0xFF4CAF50),
                title: const Text(
                  'Adicionar automaticamente os últimos preços',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                value: _autoAddLastPrices,
                onChanged: (bool value) {
                  setState(() {
                    _autoAddLastPrices = value;
                  });
                },
              ),
              _buildListTile(
                title: 'Mudar a moeda',
                subtitle: 'Atualiza suas listas com todas as alterações 💎',
                trailing: const Text(
                  'BRL',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {},
              ),
            ],

            const SizedBox(height: 24),
            const SizedBox(height: 24),
            _buildSectionHeader(
              title: 'APOIO',
              isExpanded: _isApoioExpanded,
              onTap: () => setState(() => _isApoioExpanded = !_isApoioExpanded),
            ),
            if (_isApoioExpanded) ...[
              const SizedBox(height: 8),
              _buildListTile(
                title: 'FAQ',
                trailing: const Icon(
                  Icons.north_east,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {},
              ),
              _buildListTile(
                title: 'Relatar um problema',
                trailing: const Icon(
                  Icons.north_east,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {},
              ),
              _buildListTile(
                title: 'Feedback geral',
                showChevron: true,
                onTap: () {},
              ),
              _buildListTile(
                title: 'Atualizar listas',
                subtitle: 'Atualiza suas listas com todas as alterações',
                trailing: const Icon(Icons.refresh, color: Colors.grey),
                onTap: () {},
              ),
            ],

            const SizedBox(height: 24),
            _buildSectionHeader(
              title: 'APLICATIVO',
              isExpanded: _isAplicativoExpanded,
              onTap: () => setState(
                () => _isAplicativoExpanded = !_isAplicativoExpanded,
              ),
            ),
            if (_isAplicativoExpanded) ...[
              const SizedBox(height: 8),
              _buildLargeIconMenuItem(
                title: 'Avalie-nos com ',
                subtitle: 'Ótimas avaliações nos ajudam muito! 👋',
                onTap: () {},
              ),
              _buildListTile(title: 'Ajude-nos traduzir', onTap: () {}),
              _buildListTile(title: 'Proteção de dados', onTap: () {}),
            ],

            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Versão',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '9.5.2',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    String? subtitle,
    Widget? trailing,
    bool showChevron = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight
                          .bold, // Looking at screenshot, titles seem boldish
                      color: Color(0xFF333333),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing,
            if (showChevron)
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeIconMenuItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
                children: [
                  TextSpan(text: title),
                  const TextSpan(
                    text: '⭐⭐⭐⭐⭐',
                    style: TextStyle(fontSize: 12),
                  ), // Using text stars for simplicity, could be icons
                  const TextSpan(text: ' no Google Play'),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
