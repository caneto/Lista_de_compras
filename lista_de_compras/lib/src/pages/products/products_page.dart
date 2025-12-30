import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar um produto',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Toca em um produto para saber mais sobre nutrientes, usos e dicas de armazenamento.',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0, // In case we want to switch to standard Wrap later
            children: [
              _buildFilterChip(
                'Vegan',
                const Color(0xFFE8F5E9),
                Colors.green[800]!,
              ),
              _buildFilterChip(
                'Keto',
                const Color(0xFFFCE4EC),
                Colors.pink[800]!,
              ),
              _buildFilterChip(
                'Vegetariano',
                const Color(0xFFFFF9C4),
                Colors.brown[800]!,
              ),
              _buildFilterChip(
                'Sem glúten',
                const Color(0xFFFFE0B2),
                Colors.orange[800]!,
              ),
              _buildFilterChip(
                'Baixo carb',
                const Color(0xFFE0F2F1),
                Colors.teal[800]!,
              ),
              _buildFilterChip(
                'Frigorífico',
                const Color(0xFFEDE7F6),
                Colors.deepPurple[800]!,
              ),
              _buildFilterChip(
                'A granel',
                const Color(0xFFDCEDC8),
                Colors.lightGreen[800]!,
              ),
              _buildFilterChip(
                'Rico em proteína',
                const Color(0xFFFFCCBC),
                Colors.deepOrange[800]!,
              ),
              _buildFilterChip(
                'Congelador',
                const Color(0xFFE1F5FE),
                Colors.lightBlue[800]!,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.8,
            ),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final product = _products[index];
              return _buildProductCard(product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(
    String label,
    Color backgroundColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '#$label',
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: product['color'] ?? Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              product['emoji'] ?? '🍎',
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product['name'],
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> _products = [
    {'name': 'Abacates', 'emoji': '🥑', 'color': Color(0xFFF1F8E9)},
    {'name': 'Amendoins', 'emoji': '🥜', 'color': Color(0xFFEFEBE9)},
    {'name': 'Carne de vaca', 'emoji': '🥩', 'color': Color(0xFFFFEBEE)},
    {'name': 'Hortelã', 'emoji': '🌿', 'color': Color(0xFFE8F5E9)},
    {'name': 'Leite', 'emoji': '🥛', 'color': Color(0xFFFAFAFA)},
    {'name': 'Leite sem lact...', 'emoji': '🥛', 'color': Color(0xFFEEEEEE)},
    {'name': 'Manga', 'emoji': '🥭', 'color': Color(0xFFFFF3E0)},
    {'name': 'Manteiga', 'emoji': '🧈', 'color': Color(0xFFFFF8E1)},
    {'name': 'Margarina', 'emoji': '🧈', 'color': Color(0xFFFFECB3)},
  ];
}
