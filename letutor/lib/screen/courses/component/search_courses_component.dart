import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/conponent/text_form_field_custom_component.dart';
import 'package:letutor/model/title_string.dart';

class SearchCoursesComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: Get.width / 2 - 20,
            child: TextFormFieldCustomComponent(
                onChanged: (value) {},
                controller: null,
                hintText: TitleString.chooseLevel,
                icon: const Icon(Icons.expand_more)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: Get.width / 2 - 20,
            child: TextFormFieldCustomComponent(
                onChanged: (value) {},
                controller: null,
                hintText: TitleString.chooseCategory,
                icon: const Icon(Icons.expand_more)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: Get.width / 2 - 20,
            child: TextFormFieldCustomComponent(
                onChanged: (value) {},
                controller: null,
                hintText: TitleString.sortByDifficult,
                icon: const Icon(Icons.expand_more)),
          ),
        ),
      ],
    );
  }

}