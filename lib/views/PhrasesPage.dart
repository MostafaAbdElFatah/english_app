import 'package:flutter/material.dart';
import 'package:english_app/models/Words.dart';
import 'package:flutter/services.dart' show rootBundle;


class PhrasesPage extends StatefulWidget {
  @override
  _PhrasesPageState createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> {

  Words _wordsList;


  @override
  void initState() {
    super.initState();
    this._loadData().then((words){
      setState(() {
        _wordsList = words;
      });
    });
  }

  Future<Words> _loadData() async {
    var json = await rootBundle.loadString('lib/assets/phrases.json');
    Words words = wordFromJson(json);
    return words;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView.separated(
        itemCount: _wordsList == null? 0:_wordsList.ar.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
        ),
        itemBuilder: (context, index) {
          return _getListViewRow(index);
        },
      ),
    );
  }

  Widget _getListViewRow(int index) {
    return ListTile(
      title: Text(
        _wordsList.ar[index],
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        _wordsList.en[index],
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      trailing: Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
      onTap: () {

      },
    );
  }


}
