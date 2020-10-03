import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polls/polls.dart';
import '../models/vote.dart';

class VotePage extends StatefulWidget {
  final Vote lesson;
  VotePage({Key key, this.lesson}) : super(key: key);

  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: widget.lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        new DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(
            widget.lesson.timestamp * 1000)),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 30.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          widget.lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
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
                      widget.lesson.type,
                      style: TextStyle(color: Colors.white),
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
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
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
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Polls(
      children: [
        // This cannot be less than 2, else will throw an exception
        Polls.options(title: 'Cairo', value: widget.lesson.voteDetail.option1),
        Polls.options(title: 'Mecca', value: widget.lesson.voteDetail.option2),
        Polls.options(
            title: 'Denmark', value: widget.lesson.voteDetail.option3),
        Polls.options(
            title: 'Mogadishu', value: widget.lesson.voteDetail.option4),
      ],
      question: Text(widget.lesson.content),
      currentUser: widget.lesson.voteDetail.user,
      creatorID: widget.lesson.voteDetail.creator,
      voteData: widget.lesson.voteDetail.usersWhoVoted,
      userChoice:
          widget.lesson.voteDetail.usersWhoVoted[widget.lesson.voteDetail.user],
      onVoteBackgroundColor: Colors.blue,
      leadingBackgroundColor: Colors.blue,
      backgroundColor: Colors.white,
      onVote: (choice) {
        setState(() {
          this
              .widget
              .lesson
              .voteDetail
              .usersWhoVoted[this.widget.lesson.voteDetail.user] = choice;
        });
        if (choice == 1) {
          setState(() {
            widget.lesson.voteDetail.option1 += 1.0;
          });
        }
        if (choice == 2) {
          setState(() {
            widget.lesson.voteDetail.option2 += 1.0;
          });
        }
        if (choice == 3) {
          setState(() {
            widget.lesson.voteDetail.option3 += 1.0;
          });
        }
        if (choice == 4) {
          setState(() {
            widget.lesson.voteDetail.option4 += 1.0;
          });
        }
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
