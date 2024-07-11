import 'package:currency_flutter/presentation/ui/main/items/item_calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget item(
  BuildContext context,
  String ccyNmUz,
  String diff,
  String nominal,
  String ccy,
  String rate,
  String date,
  Color color,
) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: ExpansionTile(
            title: Row(
              children: [
                Text(
                  ccyNmUz,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 8),
                Text(
                  diff,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: color),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Text(nominal),
                Text(ccy),
                SizedBox(width: 2.0),
                Text('=>'),
                SizedBox(width: 2.0),
                Text(rate),
                SizedBox(width: 4.0),
                Text('UZS|'),
                SizedBox(width: 2.0),
                SvgPicture.asset(
                  'assets/images/calendar.svg',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 2.0),
                Text(date),
              ],
            ),
            children: [
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        myBottomSheetDialog(
                          context,
                          rate,
                          ccy,
                          ccyNmUz,
                        );
                      },
                      child: itemCalculate()),
                  SizedBox(width: 16.0),
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    ),
  );
}

void myBottomSheetDialog(
    BuildContext context, String rate, String ccy, String ccyNmUz) {
  var controller = TextEditingController();
  bool isCLick = false;
  controller.text = '1';
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final controller2 = TextEditingController();
  var ccode = ccy;
  var uzbCode = "UZB";
  controller2.text = rate.toString();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(0.0)
              .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 260.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0), color: Colors.white),
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
                      color: Colors.black12),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                    child: Text(
                  ccyNmUz,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                )),
                Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        TextField(
                          controller: controller,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          focusNode: _focusNode,
                          onChanged: (value) {
                            if (isCLick == true) {
                              double firstValue = double.tryParse(value) ?? 0.0;
                              double first = double.tryParse(rate) ?? 0.0;
                              double secondValue =
                                  first != 0 ? firstValue / first : 0.0;
                              controller2.text =
                                  (secondValue / first).toString();
                              controller2.text = secondValue.toString();
                            } else if (isCLick == false) {
                              double firstValue = double.tryParse(value) ?? 0.0;
                              double addFirst =
                                  double.tryParse(rate.toString()) ?? 0.0;
                              double secondValue = firstValue * addFirst;
                              controller2.text = secondValue.toString();
                            }
                          },
                          decoration: InputDecoration(
                              labelText: ccode,
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(16.0),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                color: _focusNode.hasFocus
                                    ? Colors.blue
                                    : Colors.black87,
                              )),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: controller2,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          focusNode: _focusNode2,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              labelText: uzbCode,
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(16.0),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                  color: _focusNode2.hasFocus
                                      ? Colors.blue
                                      : Colors.black12)),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        InkWell(
                          onTap: () {
                            var d = controller.text;
                            var n = int.parse(d);
                            controller.text = controller2.text;
                            controller2.text = n.toString();
                            isCLick = !isCLick;
                            if (!isCLick) {
                              ccode = ccy;
                              uzbCode = "UZB";
                            } else {
                              ccode = "UZB";
                              uzbCode = ccy;
                            }
                          },
                          child: Row(
                            children: [
                              Spacer(),
                              converter(),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      });
}

// labelStyle: MaterialStateTextStyle.resolveWith((states){
// if(states.contains(MaterialState.focused)){
//
// }
//
// }),
