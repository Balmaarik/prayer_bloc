import 'package:prayer_bloc/bloc/bloc.dart';
import 'package:prayer_bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_bloc/models/Options.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedRadio;
  OptionsBloc optionsBloc;
  Options selectedOption;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio=0;
    optionsBloc = BlocProvider.of<OptionsBloc>(context);
    optionsBloc.add(FetchOptionsEvent());
  }



  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    //final methodBloc=BlocProvider.of<MethodBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: BlocListener<OptionsBloc, OptionsState>(
          listener: (context, state) {

          },
          child: BlocBuilder<OptionsBloc, OptionsState>(
            builder: (context, state) {
              if (state is InitialOptionsState) {
                return buildLoading();
              } else if (state is OptionsLoadedState) {
                return buildArticleList(state.options);
              }
            },
          )
        )));
  }




  Widget buildArticleList(Options options) {

    selectedRadio = options.selectedMethod;

        return ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Prayer Methods",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "Egyptian General Authority of Survey",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        value: 2,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "University Of Islamic Sciences, Karachi (Shafi)",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        value: 3,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "University Of Islamic Sciences, Karachi (Hanafi)",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        value: 4,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "	Islamic Circle of North America ",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        value: 5,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "Muslim World League",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        value: 6,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        title: Text(
                          "Umm Al-Qura",
                        ),
                        onChanged: (val) {
                          print(val);
                          setSelectedRadio(val);
                        }),
                    FloatingActionButton(
                      onPressed: (){
                        selectedOption.selectedMethod = selectedRadio;
                        optionsBloc.add(SaveOptionsEvent(selectedOption));
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        );
  }
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}



