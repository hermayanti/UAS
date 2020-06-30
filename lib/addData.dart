import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import './AdminPage.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerTanggal = new TextEditingController();
  final format=DateFormat('yyyy-MM-dd');

  void addData(){
    var url="http://192.168.43.251/my_store/adddata.php";

    http.post(url, body: {
      "nama": controllerNama.text,
      "harga": controllerStok.text,
      "stok": controllerStok.text,
      "tanggal": controllerTanggal.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TAMBAH DATA"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama"
                  )
                 ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga"
                  )
                ),
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(
                    hintText: "Stok",
                    labelText: "Stok"
                  )
                ),
                new DateTimeField(
                  controller: controllerTanggal,
                  format: format, 
                  onShowPicker: (context, currentValue){
                    return showDatePicker(
                      context: context, 
                      initialDate: currentValue??DateTime.now(), 
                      firstDate: DateTime(2020), 
                      lastDate: DateTime(2045)
                    );
                  },
                  decoration: new InputDecoration(
                    hintText: "Tanggal",
                    labelText: "Tanggal"
                  )
                ),

                new Padding(padding: const EdgeInsets.all(10.0),),

                new RaisedButton(
                  child: new Text("TAMBAH DATA"),
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    addData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new AdminPage()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}