import 'package:tlu_students/gen/assets.gen.dart';

class Intro {
  final String animationPath;
  final String title;
  final String description;
  final bool isLast;
  Intro({
    required this.animationPath,
    this.title = '',
    this.description = '',
    this.isLast = false,
  });

  factory Intro.first() {
    return Intro(
      animationPath: Assets.images.faceId.path,
      title: 'Smart Attendance',
      description:
          'Check-in securely with AI face recognition and GPS location',
    );
  }
  factory Intro.second() {
    return Intro(
      animationPath: Assets.images.grade.path,
      title: 'Manage Your Success',
      description: 'Track your GPA and tuition payments in one place',
    );
  }
  factory Intro.third() {
    return Intro(
      animationPath: Assets.images.aiTLU.path,
      title: 'Meet TLU AI',
      description:
          'Get instant answers to university regulations and guidelines. Your 24/7 personal campus companion.',
    );
  }
  factory Intro.fourth() {
    return Intro(
      animationPath: Assets.images.logo.path,
      title: 'Welcome to TLU Students ',
      description: 'Your all-in-one campus companion for academics and more.',
      isLast: true,
    );
  }
}
