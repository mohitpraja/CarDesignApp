import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currCourselIndex = 0.obs;
  RxList categoryList = [
    {
      'name': 'All(150)',
      'status': true,
    },
    {
      'name': 'Maruti + 2018 (110)',
      'status': false,
    },
    {
      'name': 'Honda + 2019 (110)',
      'status': false,
    },
    {
      'name': 'Verna + 2018 (10)',
      'status': false,
    },
    {
      'name': 'Ciaz + 2018 (110)',
      'status': false,
    },
    {
      'name': 'Toyota + 2022 (110)',
      'status': false,
    },
    {
      'name': 'Renault + 2010 (110)',
      'status': false,
    },
  ].obs;

  RxList carList = [
    {
      'name': 'Honda City DFRE Auto',
      'image': 'assets/images/verna.jpg',
      'year': '2016',
      'subtitle': 'MH 56 WP 2346',
      'id': '# AUC4534789974',
      'amount': '1,35,000',
    },
    {
      'name': 'Creta N',
      'image': 'assets/images/creta.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra Scropio N',
      'image': 'assets/images/scorpio.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Swift fronx N',
      'image': 'assets/images/fronx.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Swift fronx DLR',
      'image': 'assets/images/fronx_1.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra Thar',
      'image': 'assets/images/thar.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Classic Scorpio',
      'image': 'assets/images/classic_scorpio.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra  XYLO SUV',
      'image': 'assets/images/suv.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Honda City DFRE Auto',
      'image': 'assets/images/verna.jpg',
      'year': '2016',
      'subtitle': 'MH 56 WP 2346',
      'id': '# AUC4534789974',
      'amount': '1,35,000',
    },
    {
      'name': 'Creta N',
      'image': 'assets/images/creta.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra Scropio N',
      'image': 'assets/images/scorpio.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Swift fronx N',
      'image': 'assets/images/fronx.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 2358',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Swift fronx DLR',
      'image': 'assets/images/fronx_1.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra Thar',
      'image': 'assets/images/thar.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Classic Scorpio',
      'image': 'assets/images/classic_scorpio.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
    {
      'name': 'Mahindra  XYLO SUV',
      'image': 'assets/images/suv.jpg',
      'year': '2017',
      'subtitle': 'MH 56 WP 45',
      'id': '# AUC45347899458',
      'amount': '1,56,000',
    },
  ].obs;

  List carScrollList = [
    'assets/images/classic_scorpio.jpg',
    'assets/images/fronx.jpg',
    'assets/images/creta.jpg',
    'assets/images/classic_scorpio.jpg',
    'assets/images/verna.jpg',
    'assets/images/suv.jpg',
  ];

  List keyInformation = [
    {'icon': Icons.car_repair, 'title': 'MFG Year', 'value': '2021'},
    {
      'icon': Icons.calendar_month,
      'title': 'Repo Date',
      'value': '26 Jul 2023'
    },
    {
      'icon': Icons.oil_barrel_outlined,
      'title': 'Fuel Type',
      'value': 'Petrol'
    },
    {'icon': Icons.speed, 'title': "KM's Driven", 'value': '20,000'},
    {
      'icon': Icons.location_pin,
      'title': "Yard Location",
      'value': 'Thane | 100  P/D'
    },
    {
      'icon': Icons.electric_bolt,
      'title': "Transmission",
      'value': 'Automatic'
    },
  ];

  List legalIdentification = [
    {
      'name': 'RC no. :',
      'value': '78686765443346',
    },
    {
      'name': 'Chasis no. :',
      'value': '980876658GFU',
    },
    {
      'name': 'LAN no. :',
      'value': '78686765443346',
    },
  ];

  List insuranceInformation = [
    {
      'name': 'Insurance :',
      'value': 'Yes',
    },
    {
      'name': 'Company :',
      'value': 'Acko Car insurance',
    },
    {
      'name': 'Valid till :',
      'value': '12 June, 2024',
    },
  ];
}
