import 'package:flutter/material.dart';
import 'package:sqf/screens/note.details.dart';
class notelist extends StatefulWidget {
  @override
  _notelistState createState() => _notelistState();

}

class _notelistState extends State<notelist> {
  int count = 0;
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteListView(),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              debugPrint("fab clicled");
             navigateToDetail('add note');
            },
            tooltip: 'add note',
            child: Icon(Icons.add),
            ),       
    );
  }
  ListView getNoteListView(){
    TextStyle titlestyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext contex,int position){
       return Card(
         color:  Colors.white,
         elevation: 2.0,
         child:  ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),

            ),
            title: Text("dummy title",style: titlestyle,),
            subtitle: Text("dummy date"),
            trailing: Icon(Icons.delete, color: Colors.grey,),
            onTap: (){
              debugPrint("listtile tapped");
             navigateToDetail('edit note');
            },       
         ),
       );
      },
      );
  }
  void navigateToDetail(String title){
     Navigator.push(context, MaterialPageRoute(builder: (context){
                return noteDetail(title);
              }));
  }
}