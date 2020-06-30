import 'package:flutter/material.dart';
import './editData.dart';
import 'package:http/http.dart' as http;
import './AdminPage.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void confirm (id){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Anda yakin akan menghapus data ?'${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Hapus"),
          color: Colors.blueGrey,
          onPressed: (){
            deletePenjualan(id);
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=>new AdminPage(),
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Batal"),
          color: Colors.orangeAccent,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama']}"),),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['nama'], style: new TextStyle(fontSize: 20.0),),
                new Text("Harga : ${widget.list[widget.index]['harga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Stok : ${widget.list[widget.index]['stok']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tanggal : ${widget.list[widget.index]['tanggal']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.blueGrey[200],
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    new RaisedButton(
                      child: new Text("Hapus"),
                      color: Colors.orangeAccent,
                      onPressed: ()=>confirm(widget.list[widget.index]['id']),
                    ),
                  ],
                )
              ],
            )
          ),
        )
      ),
    );
  }

  Future<http.Response> deletePenjualan(id) async {
    final http.Response response= await http.delete("http://192.168.43.251/my_store/deleteData.php/$id");

    return response;
  }
}