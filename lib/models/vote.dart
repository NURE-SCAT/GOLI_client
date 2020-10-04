import 'dart:math';
import './vote_detail.dart';

class Vote {
  int id;
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

  Vote.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        type = json['quiz_type'],
        timestamp = json['timestamp'],
        goal = json['goal'],
        description = json['description'] ??
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
        indicatorValue = json['indicator_value'],
        voteDetail = VoteDetail.fromJson(json['vote_detail']);

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
