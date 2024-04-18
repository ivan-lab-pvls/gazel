import 'package:finance_app2_0/bottom_bar.dart';
import 'package:finance_app2_0/model/Income_item.dart';
import 'package:finance_app2_0/model/expense_item.dart';
import 'package:finance_app2_0/pages/add_incomes_expenses_page.dart';
import 'package:finance_app2_0/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

EPageOnSelect page = EPageOnSelect.homePage;
List<IncomeItem> incomes = [];
List<ExpenseItem> expenses = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 60, 16, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Operations',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            if (incomes.isNotEmpty || expenses.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                  incomes.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: getIncomes(),
                        ))
                      : expenses.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon.png'),
                                  const Text(
                                    'Add your incomes to track your history',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon.png'),
                                  const Text(
                                    'There\'s no info',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF5E81FF), fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      'Add your expenses and incomes to track your history',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                  expenses.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: getExpenses(),
                        ))
                      : incomes.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon.png'),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 68),
                                    child: Text(
                                      'Add your expenses to track your history',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon.png'),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 68),
                                    child: Text(
                                      'Add your expenses and incomes to track your history',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                AddIncomesExpensesPage(
                                  callBackIncome: (income) {
                                    incomes.add(income);
                                    addData();
                                  },
                                  callBackExpense: (expense) {
                                    expenses.add(expense);
                                    addData();
                                    setState(() {});
                                  },
                                )),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xFF5E81FF),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Add new',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                BottomBar(
                  callBack: () {
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getIncomes() {
    List<Widget> list = [];
    for (var income in incomes) {
      list.add(Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFFDFEAF9),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    '\$ ${income.cost!.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFF5E81FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  DateFormat("MM/dd/yy").format(income.date!),
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFF343434),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Text(
              income.type!.text,
              style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  color: Color(0xFF343434),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getExpenses() {
    List<Widget> list = [];
    for (var expense in expenses) {
      list.add(Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFFDFEAF9),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    '-\$ ${expense.cost!.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFF5E81FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  DateFormat("MM/dd/yy").format(expense.date!),
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFF343434),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Text(
              expense.type!.text,
              style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  color: Color(0xFF343434),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
