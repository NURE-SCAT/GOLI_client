import 'package:flutter/material.dart';
import '../models/vote.dart';
import '../models/vote_detail.dart';

class VoteProvider with ChangeNotifier {
  List _list = [
    Vote(
      id: "a",
      title: "Introduction to Driving",
      type: "City",
      goal: 100,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: "b",
      title: "Observation at Junctions",
      type: "House",
      goal: 100,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: "c",
      title: "Reverse parallel Parking",
      type: "Group",
      goal: 1,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: "d",
      title: "Reversing around the corner",
      type: "Organization",
      goal: 10,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: "e",
      title: "Incorrect Use of Signal",
      type: "Company",
      goal: 123,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
  ];

  List getVotes() {
    return _list;
  }

  void vote(String voteId, int choice, String userId) {
    Vote lesson = _list.firstWhere((element) => element.id == voteId);

    lesson.voteDetail.usersWhoVoted[userId] = choice;
    if (choice == 1) {
      lesson.voteDetail.option1 += 1.0;
    }
    if (choice == 2) {
      lesson.voteDetail.option2 += 1.0;
    }
    if (choice == 3) {
      lesson.voteDetail.option3 += 1.0;
    }
    if (choice == 4) {
      lesson.voteDetail.option4 += 1.0;
    }

    lesson.recalculateProgress();

    // todo: send to backend my choice --> id option
    notifyListeners();
  }
}
