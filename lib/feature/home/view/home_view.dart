import 'dart:developer';

import 'package:cardesignapp/core/colors.dart';
import 'package:cardesignapp/core/widgets.dart';
import 'package:cardesignapp/feature/home/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

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
                    value: 0.2,
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
                              showModalSheet(
                                  id: controller.carList[index]['id'],
                                  title: controller.carList[index]['name'],
                                  subtitle: controller.carList[index]
                                      ['subtitle']);
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

  showModalSheet(
      {required String title, required String subtitle, required String id}) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableBottomSheet(
          id: id,
          subtitle: subtitle,
          title: title,
        );
      },
    );
  }
}

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.id});

  final String title;
  final String subtitle;
  final String id;

  @override
  _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  double _dragContainerHeight = 0.55;
  HomeController controller = Get.put(HomeController());
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(keepScrollOffset: false);
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    log("scroll listner cld");
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _dragContainerHeight = 0.95;
        scrollController = ScrollController(initialScrollOffset: 0);
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        log("forard ");
        _dragContainerHeight = 0.55;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: Get.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        height: MediaQuery.of(context).size.height * _dragContainerHeight,
        // height: 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height * 0.75 * _dragContainerHeight,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_dragContainerHeight == 0.955) {
                          _dragContainerHeight = 0.55;
                        } else {
                          _dragContainerHeight = 0.955;
                        }
                      },
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
                              _dragContainerHeight = 0.55;
                            }
                          }
                        });
                      },
                      child: SizedBox(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text(widget.subtitle,
                                  style: TextStyle(fontSize: 13, color: grey)),
                            ],
                          ),
                          const Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 180,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                              items: controller.carScrollList.map((e) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Image.asset(
                                        e,
                                        fit: BoxFit.fill,
                                      )),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                onPageChanged: (index, reason) =>
                                    controller.currCourselIndex.value = index,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 10),
                                viewportFraction: 2,
                                aspectRatio: 16 / 9,
                                height: 180,
                              )),
                          Positioned(
                            top: 15,
                            child: Row(
                              children: List.generate(
                                  controller.carScrollList.length,
                                  (index) => Obx(() => Container(
                                        width: 40,
                                        margin: const EdgeInsets.only(right: 6),
                                        height: 3.5,
                                        decoration: BoxDecoration(
                                            color: controller.currCourselIndex
                                                        .value ==
                                                    index
                                                ? Colors.grey[200]
                                                : Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text(
                            widget.id,
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.blueGrey.withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: const Text('Key Information : ')),
                    SizedBox(
                      height: 230,
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            controller.keyInformation.length, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                controller.keyInformation[index]['icon'],
                                color: Colors.black54,
                              ),
                              Text(
                                controller.keyInformation[index]['title'],
                                style: TextStyle(color: grey, fontSize: 11.5),
                              ),
                              Text(
                                controller.keyInformation[index]['value'],
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Set Bid Limit',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.edit,
                                size: 16,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Auto Bid',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: FittedBox(
                                  child: Switch(
                                    value: true,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                        width: Get.width,
                        color: Colors.blueGrey.withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: const Text('Bank Notes : ')),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: grey)),
                      child: Column(
                        children: [
                          bulletPointText(
                              'Once approval received Payment has to be deposited in 2 working days.'),
                          const SizedBox(
                            height: 5,
                          ),
                          bulletPointText(
                              'All RTO fine need to be check before bidding')
                        ],
                      ),
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.blueGrey.withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: const Text('Legal Identification : ')),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.legalIdentification.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(controller
                                        .legalIdentification[index]['name'])),
                                Expanded(
                                    flex: 2,
                                    child: Text(controller
                                        .legalIdentification[index]['value']))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.blueGrey.withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: const Text('Insurance Information : ')),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.insuranceInformation.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(controller
                                        .insuranceInformation[index]['name'])),
                                Expanded(
                                    flex: 2,
                                    child: Text(controller
                                        .insuranceInformation[index]['value']))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.blueGrey.withOpacity(0.15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: TextStyle(color: grey),
                              children: const [
                            TextSpan(text: "Start's At :  "),
                            TextSpan(text: ' ₹ 1,35,000')
                          ])),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(color: grey),
                              children: const [
                            TextSpan(text: "Time Left :  "),
                            TextSpan(
                                text: ' 15 mins',
                                style: TextStyle(color: Colors.red))
                          ])),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
            ),
          ],
        ));
  }
}
