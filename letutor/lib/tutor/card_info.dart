import 'package:flutter/material.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/rating_start.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/Let_logo.png'),
                      radius: 30,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Techer 1',
                            style: TextStyle(fontSize: 17),
                          ),
                          const RatingStart(),
                          createListChip(['English'])
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  "I have been teaching English as a second language for kids, teenagers and adults for 5 years. I can help you gain a stronger foundation in English before furthering your studies. I'm patient, will speak slowly and clearly so don't hesitate to ask for good understanding.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Icon(
              Icons.favorite_outline,
              color: Colors.blue,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
