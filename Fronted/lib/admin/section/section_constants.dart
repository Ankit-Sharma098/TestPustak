import 'package:flutter/material.dart';

class AdminSectionConfig {
  final String title;
  final IconData icon;
  final String sectionKey;

  const AdminSectionConfig({
    required this.title,
    required this.icon,
    required this.sectionKey,
  });
}

/// ✅ FINAL 12 ADMIN SECTIONS
const List<AdminSectionConfig> adminSections = [
  AdminSectionConfig(
    title: 'Free PDFs',
    icon: Icons.picture_as_pdf,
    sectionKey: 'free_pdf',
  ),
  AdminSectionConfig(
    title: 'Paid PDFs',
    icon: Icons.lock,
    sectionKey: 'paid_pdf',
  ),
  AdminSectionConfig(
    title: 'Free Test Series',
    icon: Icons.quiz,
    sectionKey: 'free_test_series',
  ),
  AdminSectionConfig(
    title: 'Paid Test Series',
    icon: Icons.assignment,
    sectionKey: 'paid_test_series',
  ),
  AdminSectionConfig(
    title: 'YouTube',
    icon: Icons.play_circle_fill,
    sectionKey: 'youtube',
  ),
  AdminSectionConfig(
    title: 'Jobs',
    icon: Icons.work,
    sectionKey: 'job',
  ),
  AdminSectionConfig(
    title: 'Daily Current Affairs',
    icon: Icons.public,
    sectionKey: 'current_affairs',
  ),
  AdminSectionConfig(
    title: 'Daily Quiz',
    icon: Icons.help_outline,
    sectionKey: 'daily_quiz',
  ),
  AdminSectionConfig(
    title: 'Previous Year Papers',
    icon: Icons.history_edu,
    sectionKey: 'previous_year_paper',
  ),
  AdminSectionConfig(
    title: 'E-Books',
    icon: Icons.menu_book,
    sectionKey: 'ebook',
  ),
  AdminSectionConfig(
    title: 'Paid Course',
    icon: Icons.school,
    sectionKey: 'paid_course',
  ),
  AdminSectionConfig(
    title: 'Exam Syllabus',
    icon: Icons.list_alt,
    sectionKey: 'exam_syllabus',
  ),
];
