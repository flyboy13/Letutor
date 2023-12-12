
class FeedbackRate {
  String id;
  String userId;
  String feedback;
  DateTime createdAt;
  int rating;

  FeedbackRate({
    required this.id,
    required this.userId,
    required this.feedback,
    required this.createdAt,
    required this.rating,
  });
}
