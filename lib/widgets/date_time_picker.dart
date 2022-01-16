import 'package:flutter/material.dart';
import 'package:tcc_app/utils/formatacoes.dart';

typedef OnPickDate = void Function(DateTime dateTime);

class DateTimePicker extends StatelessWidget {
  String hintText;
  OnPickDate? onPickDate;
  bool enabled;
  DateTime actualDate;
  DateTime beginCallendar;
  DateTime endCallendar;

  DateTimePicker(
      {required this.actualDate,
      required this.beginCallendar,
      required this.endCallendar,
      required this.enabled,
      required this.onPickDate,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hintText,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => pickDate(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pickDate(context);
                              },
                              child: Text(
                                diaComAno(
                                  actualDate,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                pickHour(context);
                              },
                              child: Text(
                                horario(
                                  actualDate,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> pickDate(
    BuildContext context,
  ) async {
    if (enabled) {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: actualDate,
        firstDate: beginCallendar,
        lastDate: endCallendar,
      );
      if (date != null && onPickDate != null) {
        onPickDate!(date);
      }
    }
  }

  pickHour(BuildContext context) async {
    if (enabled) {
      TimeOfDay? t = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(actualDate),
      );
      if (t != null && onPickDate != null) {
        onPickDate!(
          DateTime(
            actualDate.year,
            actualDate.month,
            actualDate.year,
            t.hour,
            t.minute,
          ),
        );
      }
    }
  }
}
