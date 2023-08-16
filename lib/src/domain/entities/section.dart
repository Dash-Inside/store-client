// ignore_for_file: public_member_api_docs, sort_constructors_first
class Section {
  final int id;
  String title;
  int? topicId;

  Section({
    required this.id,
    required this.title,
    this.topicId,
  });
}
