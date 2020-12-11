import 'package:flutter/material.dart';

import 'package:country_list_pick/country_list_pick.dart';

class CountrySearchWidget extends StatefulWidget {
  final String _countrySelected;
  final Function(String countryCode) _changeCountry;
  CountrySearchWidget(this._countrySelected, this._changeCountry);
  @override
  _CountrySearchWidgetState createState() => _CountrySearchWidgetState();
}

class _CountrySearchWidgetState extends State<CountrySearchWidget> {
  @override
  Widget build(BuildContext context) {
    return CountryListPick(
      pickerBuilder: (context, countryCode) {
        return Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Row(
            children: [
              Image.asset(
                countryCode.flagUri,
                package: 'country_list_pick',
                fit: BoxFit.cover,
                height: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                countryCode.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        );
      },
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      theme: CountryTheme(
        isShowFlag: true,
        isShowTitle: true,
        isShowCode: false,
        isDownIcon: true,
        showEnglishName: true,
      ),
      initialSelection: widget._countrySelected ?? 'VN',
      onChanged: (CountryCode code) {
        print(code.name);
        print(code.code);
        widget._changeCountry(code.code);
      },
    );
  }
}
