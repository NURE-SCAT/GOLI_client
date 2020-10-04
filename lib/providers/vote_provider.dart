import 'package:flutter/material.dart';
import '../service/api_service.dart';
import '../service/vote_service.dart';
import '../models/vote.dart';
import '../models/vote_detail.dart';

class VoteProvider with ChangeNotifier {
  final _api = ApiService();

  List _list = [
    Vote(
      id: 1,
      title: "Introduction to Driving",
      type: "City",
      goal: 100,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: 2,
      title: "Observation at Junctions",
      type: "House",
      goal: 100,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: 3,
      title: "Reverse parallel Parking",
      type: "Group",
      goal: 1,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: 4,
      title: "Reversing around the corner",
      type: "Organization",
      goal: 10,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      id: 5,
      title: "Incorrect Use of Signal",
      type: "Company",
      goal: 123,
      timestamp: 1601723511,
      description:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
  ];

  Future<List> getVotes() async {
    final newList = await _api.getAllQuizes();
    if (newList != null) {
      _list = newList;
    }
    return _list;
  }

  void vote(int voteId, int choice, String userId) {
    Vote vote = _list.firstWhere((element) => element.id == voteId);

    vote.voteDetail.usersWhoVoted[userId] = choice;
    if (choice == 1) {
      vote.voteDetail.option1 += 1.0;
    }
    if (choice == 2) {
      vote.voteDetail.option2 += 1.0;
    }
    if (choice == 3) {
      vote.voteDetail.option3 += 1.0;
    }
    if (choice == 4) {
      vote.voteDetail.option4 += 1.0;
    }

    vote.recalculateProgress();

    _api.sendVote(voteId, choice, userId);
    notifyListeners();
  }
}
