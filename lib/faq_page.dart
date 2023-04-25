import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
      ),
      body: ListView(
        children: const [
          FaqTileWidget(
            title:
                'Apakah saya harus mempunyai background IT untuk mengikuti program ini?',
            content:
                'Tidak, kamu tidak harus berasal dari jurusan IT. Program ini terbuka untuk kamu yang berasal dari jurusan IT, non-IT, atau mau pindah karir!',
          ),
          FaqTileWidget(
            title: 'Apakah ada persyaratan usia untuk mengikuti program ini?',
            content:
                'Ada. Peserta minimal berusia 18 tahun dan maksimal 28 tahun.',
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ada pertanyaan?',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.97, 0.99),
              child: FloatingActionButton.small(
                elevation: 0,
                onPressed: () => debugPrint('TAPPED'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                backgroundColor: Colors.orange,
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqTileWidget extends StatelessWidget {
  final String title;
  final String content;
  const FaqTileWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(right: 32),
      childrenPadding:
          const EdgeInsets.only(right: 16.0, left: 40, top: 4, bottom: 8),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SvgPicture.asset(
          'assets/leading_faq_icon.svg',
        ),
      ),
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading,
      children: [Text(content)],
    );
  }
}
