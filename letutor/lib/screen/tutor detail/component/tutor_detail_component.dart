import 'package:flutter/material.dart';
import 'package:letutor/conponent/text_container_component.dart';
import 'package:letutor/screen/tutor%20detail/component/list_selection_component.dart';
import '../tutor_detail_controller.dart';

class TutorDetailComponent extends StatelessWidget {
  final TutorDetailController controller;

  const TutorDetailComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListSelectionComponent(
          title: "Languages",
          child: TextContainerComponent(
            title: controller.tutor.value.languages,
            color: Colors.blue,
            textColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: "Specialized",
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              ...controller.listSpecial.map(
                (e) => TextContainerComponent(
                  title: e,
                  color: Colors.blue,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: "Interest",
          child: Text(
            controller.tutor.value.interests,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: "Experience",
          child: Text(
            controller.tutor.value.experience,
          ),
        ),
      ],
    );
  }
}
