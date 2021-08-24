import 'package:country_picker/country_picker.dart' as c;
import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CountryPicker extends StatefulWidget {
//   static const id = 'country_picker';
//   const CountryPicker({Key? key}) : super(key: key);
//
//   @override
//   _CountryPickerState createState() => _CountryPickerState();
// }
//
// Widget _buildDialogItem(Country country) {
//   return Container(
//     height: 50,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       border: Border(
//         bottom: BorderSide(
//           color: greenColor,
//           width: 0.5,
//         ),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text("${country.name}"),
//       ],
//     ),
//   );
// }
//
// Country _countryPicker = CountryPickerUtils.getCountryByPhoneCode("91");
// String _countryCode = "+91";
//
// class _CountryPickerState extends State<CountryPicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Choose your country',
//               style: TextStyle(
//                 color: Color(0xFF209782),
//                 fontSize: MediaQuery.of(context).size.height * 0.025,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search,
//                 color: textColor,
//               ),
//             )
//           ],
//         ),
//       ),
//       body: Container(
//         child: CountryPickerDialog(
//           isSearchable: true,
//           titlePadding: EdgeInsets.all(8.0),
//           searchCursorColor: Colors.black,
//           searchInputDecoration: InputDecoration(hintText: 'Search'),
//           title: Text('Choose a country'),
//           onValuePicked: (Country country) {
//             setState(() {
//               _countryPicker = country;
//               _countryCode = country.phoneCode;
//               Navigator.pop(context, country);
//             });
//           },
//           itemBuilder: _buildDialogItem,
//         ),
//       ),
//     );
//   }
// }

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo for country picker package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
        const Locale('el'),
        const Locale('nb'),
        const Locale('nn'),
        const Locale('pl'),
        const Locale('pt'),
        const Locale('ru'),
        const Locale('hi'),
        const Locale('ne'),
        const Locale('uk'),
        const Locale('tr'),
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: [
        c.CountryLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const id = 'Country Picker';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo for country picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            c.showCountryPicker(
              context: context,
              showPhoneCode: true,
              onSelect: (c.Country country) {
                print('Select country: ${country.displayName}');
              },
              countryListTheme: c.CountryListThemeData(
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(40.0),
                //     topRight: Radius.circular(40.0),
                //   ),
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
          },
          child: const Text('Show country picker'),
        ),
      ),
    );
  }
}
