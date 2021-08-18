import 'package:flutter/material.dart';
class noteDetail extends StatefulWidget {
  String appBarTitle;
  noteDetail(this.appBarTitle);
  @override
  _noteDetailState createState() => _noteDetailState(this.appBarTitle);
}

class _noteDetailState extends State<noteDetail> {
 static var priorities = ["high", "low"];
 String appBarTitle;
 TextEditingController titleController = TextEditingController();
 TextEditingController descriptionController = TextEditingController();
 _noteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return WillPopScope(
      onWillPop: (){
        moveToLastScreen();
      },
     child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          moveToLastScreen();
        },),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: textStyle,
                value:'low',
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint("user selected $valueSelectedByUser");
                  });
                },
              ),
            ),
            // second elements
            Padding(
              padding: EdgeInsets.only(top:15.0,bottom: 15.0),
              child : TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                 debugPrint("something changed in title filed");   
                },
                decoration: InputDecoration(
                  labelText: 'title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            // third elements
              Padding(
              padding: EdgeInsets.only(top:15.0,bottom: 15.0),
              child : TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                 debugPrint("something changed in description text filed");   
                },
                decoration: InputDecoration(
                  labelText: 'description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            // forth element
            Padding(padding: EdgeInsets.only(top:15.0, bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      "save",
                      textScaleFactor: 1.5,
                    ),
                    onPressed: (){
                      setState(() {
                        debugPrint("save button clicked");
                      });
                    },
                  ),
                  ),
                  Container(width:5.0),
                     Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      "delete",
                      textScaleFactor: 1.5,
                    ),
                    onPressed: (){
                      setState(() {
                        debugPrint("delete button clicked");
                      });
                    },
                  ),
                  ),
                  
              ],
            ),
            ),
          ],
        ), 
        ),
      
    ));
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}