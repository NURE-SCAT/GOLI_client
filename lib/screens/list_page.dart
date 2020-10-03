import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vote_provider.dart';
import './vote_page.dart';
import '../models/vote.dart';
import '../theme/hex_color.dart';
import './camera_page.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List votes;

  bool _isInit = true;
  bool _isLoading = false;

  Future<void> _fetchData(BuildContext context) async {
    votes = Provider.of<VoteProvider>(
      context,
      listen: true,
    ).getVotes();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      _fetchData(context).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Vote vote) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black))),
            child: Icon(Icons.autorenew, color: Colors.black),
          ),
          title: Text(
            vote.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    child: LinearProgressIndicator(
                        backgroundColor: HexColor("C4C4C4"),
                        value: vote.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child:
                        Text(vote.type, style: TextStyle(color: Colors.black))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VotePage(lesson: vote)));
          },
        );

    Card makeCard(Vote vote) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: HexColor("F9F9F9")),
            child: makeListTile(vote),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: votes.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(votes[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: HexColor("FFB803"),
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.camera,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: HexColor("FFEFC8"),
      appBar: topAppBar,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : makeBody,
    );
  }
}
