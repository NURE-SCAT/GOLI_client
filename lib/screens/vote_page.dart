import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polls/polls.dart';
import 'package:provider/provider.dart';
import '../providers/vote_provider.dart';
import '../theme/hex_color.dart';
import '../models/vote.dart';

class VotePage extends StatelessWidget {
  final Vote vote;
  VotePage({Key key, this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: LinearProgressIndicator(
          backgroundColor: HexColor("C2C2C2"),
          value: vote.indicatorValue,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "End date: " +
            new DateFormat.yMMMd().format(
                DateTime.fromMillisecondsSinceEpoch(vote.timestamp * 1000)),
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          vote.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 10.0),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Category: ${vote.type}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "Goal: ${vote.goal}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            Spacer(),
            Text(
              "Progress: ${(vote.indicatorValue * 100).toStringAsFixed(1)} %",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Expanded(flex: 1, child: levelIndicator),
        Spacer(),
        Expanded(flex: 4, child: Center(child: coursePrice)),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: HexColor("FFB803")),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Polls(
      children: [
        // This cannot be less than 2, else will throw an exception
        Polls.options(
            title: vote.voteDetail.definition1, value: vote.voteDetail.option1),
        Polls.options(
            title: vote.voteDetail.definition2, value: vote.voteDetail.option2),
        Polls.options(
            title: vote.voteDetail.definition3, value: vote.voteDetail.option3),
        Polls.options(
            title: vote.voteDetail.definition4, value: vote.voteDetail.option4),
      ],
      question: Text(
        vote.description,
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
      currentUser: vote.voteDetail.user,
      creatorID: vote.voteDetail.creator,
      voteData: vote.voteDetail.usersWhoVoted,
      userChoice: vote.voteDetail.usersWhoVoted[vote.voteDetail.user],
      onVoteBackgroundColor: HexColor("F2C94C"),
      leadingBackgroundColor: HexColor("FFB803"),
      backgroundColor: HexColor("C2C2C2"),
      onVote: (choice) {
        Provider.of<VoteProvider>(
          context,
          listen: true,
        ).vote(vote.id, choice, vote.voteDetail.user); //todo:set user
      },
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: HexColor("FFEFC8"),
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
