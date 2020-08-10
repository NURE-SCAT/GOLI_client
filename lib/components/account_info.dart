import 'package:flutter/material.dart';
import '../theme/custom_colors.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        height: 210,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: CustomColors.textColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Account Balance",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 11.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "291.01",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: Colors.white, fontWeightDelta: 2),
                  ),
                  TextSpan(text: " ETH")
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.lock, color: Colors.grey[300]),
                SizedBox(width: 5.0),
                Text(
                  "Freezing amount: 1.0173 ETH",
                  style: TextStyle(color: Colors.grey[300]),
                )
              ],
            ),
            SizedBox(
              height: 11.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                    color: CustomColors.textColor,
                    onPressed: () {},
                    child: Text(
                      'Deposit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(9.0),
                        side: BorderSide(color: Colors.white)),
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                    color: CustomColors.textColor,
                    onPressed: () {},
                    child: Text(
                      'Cash',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(9.0),
                        side: BorderSide(color: Colors.white)),
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                    color: Color(0xff1b4dff),
                    onPressed: () {},
                    child: Text(
                      'Deposit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(9.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
