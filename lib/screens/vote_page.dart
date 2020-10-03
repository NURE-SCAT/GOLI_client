import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polls/polls.dart';
import 'package:provider/provider.dart';
import '../providers/vote_provider.dart';
import '../theme/hex_color.dart';
import '../models/vote.dart';

class VotePage extends StatelessWidget {
  final Vote lesson;
  VotePage({Key key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: HexColor("C4C4C4"),
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: HexColor("FFB803")),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        new DateFormat.yMMMd().format(
            DateTime.fromMillisecondsSinceEpoch(lesson.timestamp * 1000)),
        style: TextStyle(color: HexColor("FFB803")),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          lesson.title,
          style: TextStyle(color: HexColor("FFB803"), fontSize: 45.0),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 4, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.type,
                      style: TextStyle(color: HexColor("FFB803")),
                    ))),
            Expanded(flex: 4, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: HexColor("FFEFC8")),
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
            child: Icon(Icons.arrow_back, color: HexColor("FFB803")),
          ),
        )
      ],
    );

    final bottomContentText = Polls(
      children: [
        // This cannot be less than 2, else will throw an exception
        Polls.options(title: 'Cairo', value: lesson.voteDetail.option1),
        Polls.options(title: 'Mecca', value: lesson.voteDetail.option2),
        Polls.options(title: 'Denmark', value: lesson.voteDetail.option3),
        Polls.options(title: 'Mogadishu', value: lesson.voteDetail.option4),
      ],
      question: Text(lesson.description),
      currentUser: lesson.voteDetail.user,
      creatorID: lesson.voteDetail.creator,
      voteData: lesson.voteDetail.usersWhoVoted,
      userChoice: lesson.voteDetail.usersWhoVoted[lesson.voteDetail.user],
      onVoteBackgroundColor: HexColor("F2C94C"),
      leadingBackgroundColor: HexColor("FFB803"),
      backgroundColor: HexColor("C4C4C4"),
      onVote: (choice) {
        Provider.of<VoteProvider>(
          context,
          listen: true,
        ).vote(lesson.id, choice, lesson.voteDetail.user); //todo:set user
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
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
