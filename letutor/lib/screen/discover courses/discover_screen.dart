import 'package:flutter/material.dart';
import 'package:letutor/screen/bottom%20bar/footer.dart';
import 'package:letutor/screen/discover%20courses/card.dart';
import 'package:letutor/screen/discover%20courses/tab.dart';
import 'package:letutor/screen/history%20screen/history_items.dart';
import 'package:letutor/screen/discover%20courses/select.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  DiscoverScreenState createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> options = ["Beginner", "Intermediate", "Advanced"];
    List<String> category = [
      "For studying abroad",
      "English for Traveling",
      "Conversational English",
      "English for Beginners",
      "Business English",
      "STARTERS",
      "English for Kid",
      "PET",
      "KET",
      "MOVERS"
    ];
    List<String> sort = [
      "Level decreasing",
      "Level ascending",
    ];
    List<String> tabs = ["Course", "E-Book", "Interactive E-Book"];
    // String placeholder = "";
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenWidth * 0.05,
          title: Image.asset(
            "Let_logo.png",
            width: screenWidth * 0.15,
            // Adjust the logo width as needed
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'avatar.png',
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.1,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text(
                                        "Discover",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    //Add an input text under Discover,
                                    Expanded(
                                      child: Container(
                                        width: screenWidth * 0.3,
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: TextFormField(
                                          // placeholder:
                                          //     'Search for tutors or topics',
                                          controller: controller,
                                          decoration: InputDecoration(
                                            hintText: "Courses",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(Icons.search),
                                              onPressed: () {
                                                // TODO: Implement the search functionality
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                        "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields."),
                    SizedBox(
                      height: screenWidth * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: FlutterSelect(
                            options: options,
                            placeholder: "Select level",
                            selectedValues: [],
                            onChanged: (selectedValues) {
                              // TODO: Implement the functionality to handle the selected values
                            },
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Expanded(
                          flex: 1,
                          child: FlutterSelect(
                            options: options,
                            placeholder: "Select category",
                            selectedValues: [],
                            onChanged: (selectedValues) {
                              // TODO: Implement the functionality to handle the selected values
                            },
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Expanded(
                          flex: 1,
                          child: FlutterSelect(
                            options: sort,
                            placeholder: "Sort filter",
                            selectedValues: [],
                            onChanged: (selectedValues) {
                              // TODO: Implement the functionality to handle the selected values
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.01,
                    ),
                    FlutterTabs(
                      tabs: tabs,
                      content: Text("This is the content for the first tab."),
                    ),
                    SizedBox(
                      height: screenWidth * 0.01,
                    ),
                    Wrap(
                      spacing: screenWidth * 0.02,
                      children: List.generate(
                        8,
                        (index) => FlutterCourseCard(
                          imageUrl: "course1.png",
                          title: "Life in the Internet Age",
                          description:
                              "Let's discuss how technology is changing the way we live",
                          level: "Intermediate",
                          lessonCount: 9,
                          screenWidth: screenWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                /* LIST BEGIN HERE */
              ],
            ),
          ),
          Footer()
        ])));
  }
}
