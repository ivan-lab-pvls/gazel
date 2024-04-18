import 'package:finance_app2_0/model/Income_item.dart';
import 'package:finance_app2_0/model/expense_item.dart';
import 'package:finance_app2_0/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AddIncomesExpensesPage extends StatefulWidget {
  const AddIncomesExpensesPage(
      {super.key, required this.callBackIncome, required this.callBackExpense});
  final Function(IncomeItem) callBackIncome;
  final Function(ExpenseItem) callBackExpense;

  @override
  State<AddIncomesExpensesPage> createState() => _AddIncomesExpensesPageState();
}

class _AddIncomesExpensesPageState extends State<AddIncomesExpensesPage> {
  TextEditingController incomecostController = TextEditingController();
  TextEditingController incomeDateController = TextEditingController();
  TextEditingController incomeCategoryController = TextEditingController();
  TextEditingController expensecostController = TextEditingController();
  TextEditingController expenseDateController = TextEditingController();
  TextEditingController expenseCategoryController = TextEditingController();
  EIncomeType? currentSelectedIncome;
  ECategoryType? currentSelectedExpense;
  DateTime selectedDate = DateTime.now();
  List<ECategoryType> categoryTypeList = [
    ECategoryType.food,
    ECategoryType.financialOperations,
    ECategoryType.travel,
    ECategoryType.entertainment,
    ECategoryType.other
  ];
  List<EIncomeType> incomeTypeList = [
    EIncomeType.salary,
    EIncomeType.financialOperations,
  ];
  IncomeItem income = IncomeItem();
  ExpenseItem expense = ExpenseItem();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F6FE),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 32),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Container(
              height: 43,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: const Color(0xFFd3dffe),
                ),
                child: TabBar(
                  padding: const EdgeInsets.all(2),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.white,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Incomes',
                    ),
                    Tab(
                      text: 'Expenses',
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextField(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                      content: Card(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          const Text('Enter new category',
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FormField<EIncomeType>(
                                              builder:
                                                  (FormFieldState<EIncomeType>
                                                      state) {
                                                return InputDecorator(
                                                  decoration: InputDecoration(
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                      ),
                                                      errorStyle:
                                                          const TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: Colors
                                                                  .redAccent,
                                                              fontSize: 16.0),
                                                      hintText:
                                                          'Please select income',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0))),
                                                  isEmpty:
                                                      currentSelectedIncome ==
                                                          '',
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton<
                                                        EIncomeType>(
                                                      value:
                                                          currentSelectedIncome,
                                                      isDense: true,
                                                      onChanged: (EIncomeType?
                                                          newValue) {
                                                        setState(() {
                                                          currentSelectedIncome =
                                                              newValue;
                                                          state.didChange(
                                                              newValue);
                                                        });
                                                      },
                                                      items: incomeTypeList.map(
                                                          (EIncomeType value) {
                                                        return DropdownMenuItem<
                                                            EIncomeType>(
                                                          value: value,
                                                          child: Text(
                                                              value.text,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Text',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      16)),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16))),
                                                InkWell(
                                                    onTap: () {
                                                      income.type =
                                                          currentSelectedIncome;
                                                      incomeCategoryController
                                                              .text =
                                                          currentSelectedIncome!
                                                              .text;
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Save',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16)))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          controller: incomeCategoryController,
                          readOnly: true,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.expand_more,
                              color: Color(0xFF24262B),
                            ),
                            hintText: 'Category',
                            hintStyle: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            filled: true,
                            fillColor: const Color(0xFFDFEAF9),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          controller: incomecostController,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            hintText: '\$ Amount',
                            hintStyle: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            filled: true,
                            fillColor: const Color(0xFFDFEAF9),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (text) {
                            incomecostController.text = text;
                            income.cost = double.tryParse(text);
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Dialog(
                                          child: SizedBox(
                                            width: 300,
                                            height: 200,
                                            child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: DateTime.now(),
                                              onDateTimeChanged:
                                                  (DateTime newDate) {
                                                selectedDate = newDate;
                                                incomeDateController.text =
                                                    DateFormat("MM/dd/yy")
                                                        .format(newDate);
                                                income.date = newDate;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          readOnly: true,
                          controller: incomeDateController,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            filled: true,
                            fillColor: const Color(0xFFDFEAF9),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: InkWell(
                          onTap: () {
                            if (income.cost != null &&
                                income.type != null &&
                                income.date != null) {
                              widget.callBackIncome(income);

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const HomePage()),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: income.cost != null &&
                                        income.type != null &&
                                        income.date != null
                                    ? const Color(0xFF5E81FF)
                                    : const Color(0xFF5E81FF).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text('Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.grey,
                              controller: expenseCategoryController,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.expand_more,
                                  color: Color(0xFF24262B),
                                ),
                                hintText: 'Category',
                                hintStyle: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                filled: true,
                                fillColor: const Color(0xFFDFEAF9),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          content: Card(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            child: Column(children: [
                                              const Text('Enter new category',
                                                  style: TextStyle(
                                                      fontFamily: 'SF Pro Text',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FormField<ECategoryType>(
                                                  builder: (FormFieldState<
                                                          ECategoryType>
                                                      state) {
                                                    return InputDecorator(
                                                      decoration: InputDecoration(
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Text',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14),
                                                          errorStyle: const TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: Colors
                                                                  .redAccent,
                                                              fontSize: 16.0),
                                                          hintText:
                                                              'Please select income',
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14.0))),
                                                      isEmpty:
                                                          currentSelectedExpense ==
                                                              '',
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            ECategoryType>(
                                                          value:
                                                              currentSelectedExpense,
                                                          isDense: true,
                                                          onChanged:
                                                              (ECategoryType?
                                                                  newValue) {
                                                            setState(() {
                                                              currentSelectedExpense =
                                                                  newValue;
                                                              state.didChange(
                                                                  newValue);
                                                            });
                                                          },
                                                          items: categoryTypeList
                                                              .map(
                                                                  (ECategoryType
                                                                      value) {
                                                            return DropdownMenuItem<
                                                                ECategoryType>(
                                                              value: value,
                                                              child: Text(
                                                                  value.text,
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          16)),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ]),
                                          ),
                                          actions: [
                                            Card(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 14),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16))),
                                                    InkWell(
                                                        onTap: () {
                                                          expense.type =
                                                              currentSelectedExpense;
                                                          expenseCategoryController
                                                                  .text =
                                                              currentSelectedExpense!
                                                                  .text;
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'Save',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16)))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.grey,
                            controller: expensecostController,
                            style: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              hintText: '\$ Amount',
                              hintStyle: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                              filled: true,
                              fillColor: const Color(0xFFDFEAF9),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              expensecostController.text = value;
                              expense.cost = double.tryParse(value);
                              setState(() {});
                            },
                          ),
                        ),
                        TextField(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Dialog(
                                          child: SizedBox(
                                            width: 300,
                                            height: 200,
                                            child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: DateTime.now(),
                                              onDateTimeChanged:
                                                  (DateTime newDate) {
                                                selectedDate = newDate;
                                                expense.date = newDate;
                                                expenseDateController.text =
                                                    DateFormat("MM/dd/yy")
                                                        .format(newDate);
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          readOnly: true,
                          controller: expenseDateController,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            filled: true,
                            fillColor: const Color(0xFFDFEAF9),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: () {
                              if (expense.cost != null &&
                                  expense.type != null &&
                                  expense.date != null) {
                                widget.callBackExpense(expense);

                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomePage()),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: expense.cost != null &&
                                          expense.type != null &&
                                          expense.date != null
                                      ? const Color(0xFF5E81FF)
                                      : const Color(0xFF5E81FF)
                                          .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text('Next',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
