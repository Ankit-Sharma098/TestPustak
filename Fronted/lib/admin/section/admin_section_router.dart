import 'package:flutter/material.dart';

// IMPORT ALL FORMS
import '../forms/add_free_pdf_form.dart';
import '../forms/add_paid_pdf_form.dart';
import '../forms/Free_test_series/add_free_test_series_form.dart';
import '../forms/add_paid_test_series_form.dart';
import '../forms/add_youtube_form.dart';
import '../forms/add_daily_current_affairs_form.dart';
import '../forms/add_daily_quiz_form.dart';
import '../forms/add_previous_year_paper_form.dart';
import '../forms/add_job_notification_form.dart';
import '../forms/add_ebook_form.dart';
import '../forms/add_paid_course_form.dart';
import '../forms/add_exam_syllabus_form.dart';

class AdminSectionRouter {
  static void openAddForm(BuildContext context, String sectionKey) {
    Widget? page;

    switch (sectionKey) {
      case 'free_pdf':
        page = const AddFreePdfForm();
        break;

      case 'paid_pdf':
        page = const AddPaidPdfForm();
        break;

      case 'free_test_series':
        page = const AddFreeTestSeriesForm();
        break;

      case 'paid_test':
        page = const AddPaidTestSeriesForm();
        break;

      case 'youtube':
        page = const AddYoutubeForm();
        break;

      case 'current_affairs':
        page = const AddDailyCurrentAffairsForm();
        break;

      case 'daily_quiz':
        page = const AddDailyQuizForm();
        break;

      case 'previous_year':
        page = const AddPreviousYearPaperForm();
        break;

      case 'jobs':
        page = const AddJobNotificationForm();
        break;

      case 'ebooks':
        page = const AddEbookForm();
        break;

      case 'paid_course':
        page = const AddPaidCourseForm();
        break;

      case 'exam_syllabus':
        page = const AddExamSyllabusForm();
        break;

      default:
        page = null;
    }

    if (page == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form not implemented yet'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page!),
    );
  }
}
