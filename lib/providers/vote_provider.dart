import 'package:flutter/material.dart';
import '../models/vote.dart';
import '../models/vote_detail.dart';

class VoteProvider with ChangeNotifier {
  List _list = [
    Vote(
      title: "Introduction to Driving",
      type: "City",
      indicatorValue: 0.33,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Observation at Junctions",
      type: "House",
      indicatorValue: 0.33,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Reverse parallel Parking",
      type: "Group",
      indicatorValue: 0.66,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Reversing around the corner",
      type: "Organization",
      indicatorValue: 0.66,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Incorrect Use of Signal",
      type: "Company",
      indicatorValue: 1.0,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Engine Challenges",
      type: "City",
      indicatorValue: 1.0,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.",
      voteDetail: VoteDetail(),
    ),
    Vote(
      title: "Self Driving Car",
      type: "City",
      indicatorValue: 1.0,
      timestamp: 1601723511,
      content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ",
      voteDetail: VoteDetail(),
    )
  ];

  List getVotes() {
    return _list;
  }
}
