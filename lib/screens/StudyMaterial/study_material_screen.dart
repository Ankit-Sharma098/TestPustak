import 'package:flutter/material.dart' hide MaterialType;
import '../../model/study_material_model.dart';
import 'study_material_detail_screen.dart';

class StudyMaterialScreen extends StatelessWidget {
  const StudyMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filtering materials by type
    final freePdfs = dummyMaterials.where((m) => m.type == MaterialType.freePdf).toList();
    final paidPdfs = dummyMaterials.where((m) => m.type == MaterialType.paidPdf).toList();
    final ebooks = dummyMaterials.where((m) => m.type == MaterialType.ebook).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Material'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(context, 'Free PDFs', freePdfs),
              _buildSection(context, 'Paid PDFs', paidPdfs),
              _buildSection(context, 'E-Books', ebooks),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<StudyMaterialModel> materials) {
    if (materials.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: materials.length,
            itemBuilder: (context, index) {
              return _buildMaterialCard(context, materials[index]);
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildMaterialCard(BuildContext context, StudyMaterialModel material) {
    return SizedBox(
      width: 160,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // The whole card is not tappable, only the button
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.asset(
                  material.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  material.title,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudyMaterialDetailScreen(material: material),
                      ),
                    );
                  },
                  child: const Text('View'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
