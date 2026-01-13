enum MaterialType { freePdf, paidPdf, ebook }

class StudyMaterialModel {
  final String title;
  final String description;
  final String imageUrl;
  final MaterialType type;

  StudyMaterialModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
  });
}

// Dummy Data
final List<StudyMaterialModel> dummyMaterials = [
  StudyMaterialModel(
    title: 'Modern History Notes',
    description: 'Comprehensive notes on Modern Indian History for all competitive exams. Covers all major events and personalities from the 18th century to Indian Independence.',
    imageUrl: 'assets/images/history_banner.jpg',
    type: MaterialType.freePdf,
  ),
  StudyMaterialModel(
    title: 'Quantitative Aptitude Tricks',
    description: 'A collection of shortcuts and tricks to solve quantitative aptitude questions quickly and accurately. A must-have for banking and SSC aspirants.',
    imageUrl: 'assets/images/aptitude_banner.jpg',
    type: MaterialType.freePdf,
  ),
  StudyMaterialModel(
    title: 'Polity Full Course E-Book',
    description: 'The complete guide to Indian Polity, designed as per the latest syllabus of UPSC and State PSC exams. Includes practice questions and past year analysis.',
    imageUrl: 'assets/images/polity_banner.jpg',
    type: MaterialType.ebook,
  ),
  StudyMaterialModel(
    title: 'Geography Premium Maps',
    description: 'A premium, high-resolution collection of important maps for Geography. Includes physical, political, and thematic maps of India and the World.',
    imageUrl: 'assets/images/geography_banner.jpg',
    type: MaterialType.paidPdf,
  ),
    StudyMaterialModel(
    title: 'General Science Encyclopedia',
    description: 'An exhaustive e-book covering Physics, Chemistry, and Biology from an exam perspective. Filled with diagrams, charts, and tables for easy retention.',
    imageUrl: 'assets/images/science_banner.jpg',
    type: MaterialType.ebook,
  ),
  StudyMaterialModel(
    title: 'Economics Basics Explained',
    description: 'Simplified explanations of core economic concepts. Useful for beginners and those looking for a quick revision.',
    imageUrl: 'assets/images/economics_banner.jpg',
    type: MaterialType.freePdf,
  ),
];
