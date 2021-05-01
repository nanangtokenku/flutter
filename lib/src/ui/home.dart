import 'package:aztira/src/models/todoModel0.dart';
import 'package:flutter/material.dart';
import 'package:aztira/src/blocs/todoBloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    bloc.fetchAllTodo();
    super.initState();
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TOdo List"),
        ),
        body: StreamBuilder(
          stream: bloc.allTodo,
          builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget buildList(AsyncSnapshot<List<Todo>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: snapshot.data[index].done == 'true' ? true : false,
          title: Text(snapshot.data[index].name),
          subtitle: Text(
              snapshot.data[index].id != null ? snapshot.data[index].id : ''),
          onChanged: (bool isChecked) {},
        );
      },
    );
  }
}
