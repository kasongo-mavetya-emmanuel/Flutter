import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'package:http/http.dart'as http;
import 'dart:io'show Platform;

const apiKey='AAAF91D2-2CE5-464C-94F7-31FEF7113C46';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency='USD';
  Map<String,String> map={};
  bool isWaiting;

  void dataFinal() async{
    isWaiting=true;
    try{
        await getdata();
        setState(() {
          isWaiting=false;
        });

    }
    catch(e){
      print(e);
    }


  }
  Future getdata() async{
      for(String crypto in cryptoList) {
      http.Response response = await http.get(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey');
      var data = response.body;
      print(data);
      var Rate = jsonDecode(data)['rate'];
       String rate=Rate.toStringAsFixed(3);
         map.putIfAbsent(crypto, () => rate);

    }
    print(map);
    return map;
  }




  DropdownButton<String> androidDropDown(){
    List<DropdownMenuItem<String>> dropDownItems=[];
    for(String currency in currenciesList){
      var newItem=DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    // return dropDownItems;

    return DropdownButton<String>(
      value:selectedCurrency,
      items: dropDownItems,
//   items: [
//   DropdownMenuItem(
//       child:Text('USD'),
//   value: 'USD' ,),
//   DropdownMenuItem(
//     child:Text('EUR'),
//     value: 'EUR' ,),
//   DropdownMenuItem(
//     child:Text('GBP'),
//     value: 'GBP' ,)
// ],
      onChanged: (value){
        setState(() {
          map={};
          selectedCurrency=value;
          dataFinal();
          print(selectedCurrency);
        });

      },

    );
  }

  // List<DropdownMenuItem> getDropDownItems(){
  //   // List<DropdownMenuItem<String>> dropDownItems=[];
  //   // for(String currency in currenciesList){
  //   //   var newItem=DropdownMenuItem(
  //   //     child: Text(currency),
  //   //     value: currency,
  //   //   );
  //   //   dropDownItems.add(newItem);
  //   // }
  //   // return dropDownItems;
  // }

  CupertinoPicker iOSpicker(){

    List<Text> pickerItems=[];
    for(String currency in currenciesList){

      pickerItems.add(Text(currency));
    }
    return  CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged:(selectedIndex){

      },
      children: pickerItems,
    );
  }

  Widget getPicker(){
    if(Platform.isIOS){
      return iOSpicker();

    }else if(Platform.isAndroid){
      return androidDropDown();

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataFinal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${isWaiting==true? '?': map['BTC']} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${isWaiting==true? '?': map['ETH']} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = ${isWaiting==true? '?': map['LTC']} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:getPicker(),
          ),
        ],
      ),
    );
  }
}


