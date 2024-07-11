import 'package:currency_flutter/data/source/remote/response/currency_reponse.dart';
import 'package:currency_flutter/presentation/ui/main/items/item.dart';
import 'package:currency_flutter/presentation/ui/main/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/status.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(GetCurrencyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              title: Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Currency',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        showCalendar();
                      },
                      child: Icon(
                        Icons.calendar_month_outlined,
                        size: 24.0,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 12.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        languageBottom();
                      },
                      child: Icon(
                        Icons.language_outlined,
                        size: 24.0,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 16.0,
                  )
                ],
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: BlocConsumer<MainBloc, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == Status.loading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey!,
                  child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        title: Container(
                          height: 20,
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 8),
                        ),
                        subtitle: Container(
                          height: 16,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                );
              } else {
                if (state.status == Status.fail) {
                  return const Placeholder();
                } else {
                  return ListView.builder(
                      itemCount: state.list?.length,
                      itemBuilder: (context, index) {
                        CurrencyModel? data = state.list?[index];
                        if (data != null) {
                          double? isColors = double.tryParse(data.diff!) ?? 0;
                          Color color = Colors.red;
                          if (isColors > 0) {
                            color = Colors.greenAccent;
                          }
                          return GestureDetector(
                            onTap: () {},
                            child: item(
                                context,
                                data.ccyNmUz.toString(),
                                data.diff.toString(),
                                data.nominal.toString(),
                                data.ccy.toString(),
                                data.rate.toString(),
                                data.date.toString(),
                                color),
                          );
                        } else {}
                      });
                }
              }
            },
          ),
        ));
  }

  void languageBottom() {
    int selectedRadioGroup1 = 1; // Group 1: O'zbekcha
    int selectedRadioGroup2 = 1; // Group 2: Узбекча
    int selectedRadioGroup3 = 1; // Group 3: Русский
    int selectedRadioGroup4 = 1; // Group 4: English

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 260.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: 56,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black12,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioGroup1,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioGroup1 = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'O\'zbekcha',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18.0),
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black12),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioGroup1,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioGroup1 = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'Узбекча',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18.0),
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black12),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: selectedRadioGroup1,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioGroup1 = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'Русский',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18.0),
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black12),
                    Row(
                      children: [
                        Radio(
                          value: 4,
                          groupValue: selectedRadioGroup1,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioGroup1 = value as int;
                            });
                          },
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'English',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18.0),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Future<void> showCalendar() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        _selectedDate = pickedDate;
        context
            .read<MainBloc>()
            .add(GetCurrencyEventByDate(date: formattedDate));
      });
    }
  }
}
