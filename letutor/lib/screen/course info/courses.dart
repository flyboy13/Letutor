import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letutor/screen/course%20info/book_tab.dart';
import 'package:letutor/screen/course%20info/course_tab.dart';


class CoursesSearchPage extends StatefulWidget {
  const CoursesSearchPage({Key? key}) : super(key: key);

  @override
  State<CoursesSearchPage> createState() => _CoursesSearchPageState();
}

class _CoursesSearchPageState extends State<CoursesSearchPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          "asset/svg/ic_course.svg",
                          width: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Courses",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          "asset/svg/ic_books.svg",
                          width: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Books",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  CourseTab(),
                  BookTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
