import './vote_detail.dart';

class Vote {
  String title;
  String type;
  double indicatorValue;
  int timestamp;
  String content;
  VoteDetail voteDetail;

  Vote({
    this.title,
    this.type,
    this.indicatorValue,
    this.timestamp,
    this.content,
    this.voteDetail,
  });
}
