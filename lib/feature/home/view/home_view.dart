import 'dart:developer';

import 'package:cardesignapp/core/colors.dart';
import 'package:cardesignapp/feature/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [primaryColor, secondaryColor]),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            // height: 160,
            child: Container(
              margin: const EdgeInsets.only(
                  top: 45, left: 12, right: 12, bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('CAR ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: white)),
                              const Text('BX',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.amber)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.filter_alt,
                            color: white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.calendar_view_day_rounded,
                            color: white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: Obx(() => ListView.builder(
                          itemCount: controller.categoryList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: white,
                                      child: const Icon(Icons.add),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 0),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: controller.categoryList[index]
                                                    ['status'] ==
                                                true
                                            ? white
                                            : white.withOpacity(0.25),
                                        border: Border.all(color: white)),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.categoryList[index]
                                              ['name'],
                                          style: TextStyle(
                                            color:
                                                controller.categoryList[index]
                                                        ['status']
                                                    ? black
                                                    : white,
                                            fontSize: 13,
                                            fontWeight:
                                                controller.categoryList[index]
                                                            ['status'] ==
                                                        true
                                                    ? FontWeight.w600
                                                    : FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: white,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  );
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: 0.25,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Vechicle')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.carList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 6),
                            tileColor: white,
                            horizontalTitleGap: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          controller.carList[index]['image']),
                                      fit: BoxFit.fill)),
                            ),
                            title: Text(
                              '${controller.carList[index]['name']}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                                '${controller.carList[index]['subtitle']}',
                                style: TextStyle(fontSize: 12.5, color: grey)),
                            trailing: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '10 mins',
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.red),
                                ),
                                Text(
                                  'Not Bid',
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            onTap: () {
                              showModalSheet();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showModalSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const DraggableBottomSheet();
      },
    );
  }
}

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({super.key});

  @override
  _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  double _dragContainerHeight = 0.5; // Initial height as half of screen height
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          // Update container height while dragging
          log("details : $details");
          log("details : ${details.primaryDelta}");
          double? primaryDelta = details.primaryDelta;
          if (primaryDelta != null) {
            if (primaryDelta.toString().contains('-')) {
              _dragContainerHeight = 0.95;
            } else {
              if (_dragContainerHeight == 0.5) {
                Get.back();
              } else {
                _dragContainerHeight = 0.5;
              }
            }
          }
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          height: MediaQuery.of(context).size.height * _dragContainerHeight,
          // height: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffd9dbdb)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Maruti Scropio N',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            Text('MH 32 DF 7865 2016',
                                style: TextStyle(fontSize: 13, color: grey)),
                            StoryView(
                              controller: StoryController(),
                              repeat: true,
                              storyItems: controller.storyItem,
                            )
                          ],
                        ),
                        const Icon(
                          CupertinoIcons.heart,
                          color: Colors.red,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          hintText: '₹ 1,35,000',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: grey)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          suffixIcon: Container(
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.7),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              child: Icon(
                                Icons.add,
                                color: white,
                              ))),
                    )),
                    SizedBox(
                      width: Get.width * 0.1,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(children: [
                        Icon(
                          Icons.handyman,
                          color: white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Bid (12)',
                          style: TextStyle(
                              color: white, fontSize: 16, letterSpacing: 1.3),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
