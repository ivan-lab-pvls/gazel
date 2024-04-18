import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:finance_app2_0/bottom_bar.dart';
import 'package:finance_app2_0/model/Income_item.dart';
import 'package:finance_app2_0/model/expense_item.dart';
import 'package:finance_app2_0/model/result_item.dart';
import 'package:finance_app2_0/model/user.dart';
import 'package:finance_app2_0/pages/home_page.dart';
import 'package:finance_app2_0/pages/quiz_page.dart';
import 'package:finance_app2_0/pages/read_terms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

UserItem user = UserItem();

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController textControllerUserName = TextEditingController();
  TextEditingController textControllerEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
    getData(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 60, 16, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Row(children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 57,
                          width: 57,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/user_icon.png',
                                  )),
                              shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      user.name == null || user.name!.isEmpty
                                          ? 'UserName'
                                          : user.name!,
                                      style: const TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                user.userEmail == null ||
                                        user.userEmail!.isEmpty
                                    ? 'useremail@gmail.com'
                                    : user.userEmail!,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              content: Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Enter your nickname',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        style: const TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                        controller: textControllerUserName,
                                        decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                borderSide:
                                                    BorderSide(width: 1)),
                                            label: Text('Nickname ',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text('Enter your email',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        style: const TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                        controller: textControllerEmail,
                                        decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                borderSide:
                                                    BorderSide(width: 1)),
                                            label: Text('Email ',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400))),
                                      ),
                                    ]),
                              ),
                              actions: [
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16))),
                                        InkWell(
                                            onTap: () {
                                              user.userEmail =
                                                  textControllerEmail.text;
                                              user.name =
                                                  textControllerUserName.text;
                                              addData();
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16)))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                        color: const Color(0xFF5E81FF),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const TermsForReadPrivacy(
                          termsData:
                              'https://docs.google.com/document/d/16u5gFee76P4di6IP0PMCG25smWFCko6-_E3YdDQlDW8/edit?usp=sharing',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDFEAF9),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      Image.asset('assets/privacy.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Privacy policy',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: InkWell(
                  onTap: () {
                    InAppReview.instance
                        .openStoreListing(appStoreId: '6498786343');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDFEAF9),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      Image.asset('assets/rate.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Rate app',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: InkWell(
                  onTap: () {
                    _shareContent();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDFEAF9),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Image.asset('assets/share.png'),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Share app',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        BottomBar(
          callBack: () {},
        )
      ]),
    );
  }
}

Future<void> _shareContent() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    if (iosDeviceInfo.model.contains('iPad')) {
      _shareFriends();
    } else {
      Share.share(
          'Check out GAZEL: Invest in AppStore! https://apps.apple.com/us/app/gazel-invest/id6498786343');
    }
  } else {
    _shareFriends();
  }
}

Future<void> _shareFriends() async {
  const url = 'https://apps.apple.com/us/app/gazel-invest/id6498786343';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void getData(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('user') != null) {
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    user = UserItem.fromJson(userMap);
  }
  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('incomes') ?? '[]');
  final List<dynamic> jsonData2 =
      jsonDecode(prefs.getString('expenses') ?? '[]');
  final List<dynamic> jsonData3 =
      jsonDecode(prefs.getString('results') ?? '[]');
  incomes = jsonData1.map<IncomeItem>((jsonList) {
    {
      return IncomeItem.fromJson(jsonList);
    }
  }).toList();
  expenses = jsonData2.map<ExpenseItem>((jsonList) {
    {
      return ExpenseItem.fromJson(jsonList);
    }
  }).toList();
  results = jsonData3.map<ResultItem>((jsonList) {
    {
      return ResultItem.fromJson(jsonList);
    }
  }).toList();

  callBack();
}

Future<void> addData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('incomes', jsonEncode(incomes));
  prefs.setString('expenses', jsonEncode(expenses));
  prefs.setString('results', jsonEncode(results));
  prefs.setString('user', jsonEncode(user));
}
