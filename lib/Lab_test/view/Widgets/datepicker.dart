import 'package:alemeno/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:intl/intl.dart';

class DayPickerPage extends StatefulWidget {
  Function callback4;
  Function callback5;

  var textValue;
  DayPickerPage({
    this.textValue,
    required this.callback4,
    required this.callback5,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DayPickerPageState();
}

class _DayPickerPageState extends State<DayPickerPage> {
  DateTime _selectedDate = DateTime.now();
  bool date_selected = false;
  final DateTime _firstDate = DateTime.now().subtract(Duration(days: 180));
  final DateTime _lastDate = DateTime.now().add(Duration(days: 180));

  Color selectedDateStyleColor = darkblue;
  Color selectedSingleDateDecorationColor = darkblue;

  @override
  @override
  Widget build(BuildContext context) {
    dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
      defaultDateTextStyle: TextStyle(fontSize: 13),
      selectedDateStyle: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Colors.white, fontSize: 10),
      selectedSingleDateDecoration: BoxDecoration(
        color: date_selected
            ? selectedSingleDateDecorationColor
            : Colors.transparent,
        shape: BoxShape.circle,
      ),
      dayHeaderTitleBuilder: _dayHeaderTitleBuilder,
    );

    return Expanded(
      child: dp.DayPicker.single(
        selectedDate: _selectedDate,
        onChanged: _onSelectedDateChanged,
        firstDate: _firstDate,
        lastDate: _lastDate,
        datePickerStyles: styles,
        selectableDayPredicate: _isSelectableCustom,
      ),
    );
  }

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
      date_selected = true;
      widget.callback4(
        DateFormat('MM/dd/yyyy').format(_selectedDate).toString(),
      );
      widget.callback5(
        date_selected,
      );
    });
  }

  bool _isSelectableCustom(DateTime day) {
    return true;
  }
}

String _dayHeaderTitleBuilder(
        int dayOfTheWeek, List<String> localizedHeaders) =>
    localizedHeaders[dayOfTheWeek].substring(0, 2);
