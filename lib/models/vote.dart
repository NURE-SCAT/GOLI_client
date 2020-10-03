import 'dart:math';
import './vote_detail.dart';

class Vote {
  String id;
  String title;
  String type;
  int timestamp;
  int goal;
  String description;
  VoteDetail voteDetail;
  double indicatorValue;

  Vote({
    this.id,
    this.title,
    this.type,
    this.timestamp,
    this.goal,
    this.description,
    this.voteDetail,
  }) {
    recalculateProgress();
  }

  void recalculateProgress() {
    double optionsSum = 0;
    if (voteDetail != null) {
      optionsSum += voteDetail.option1;
      optionsSum += voteDetail.option2;
      optionsSum += voteDetail.option3;
      optionsSum += voteDetail.option4;
    }

    indicatorValue = min(1.0, optionsSum / goal);
    print(indicatorValue);
  }
}
