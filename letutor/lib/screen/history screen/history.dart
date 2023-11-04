import 'package:flutter/material.dart';
import 'package:letutor/screen/history%20screen/history_items.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'avatar.png',
                            width: 120,
                            height: 120,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: VerticalDivider(
                        thickness: 5,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "History",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "The following is a list of lessons you have attended",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Color(0xff787878),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "You can review the details of the lessons you have attended",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Color(0xff787878),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /* LIST BEGIN HERE */
            Container(
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                primary: false,
                children: [
                  HistoryListTile(),
                  // HistoryListTile(),
                  // HistoryListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
