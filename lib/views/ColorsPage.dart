import 'package:flutter/material.dart';
import 'package:english_app/models/Words.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;

class ColorsPage extends StatefulWidget {
  final String fileName;
  final List<Color> images;
  final Color backgroundColor;

  ColorsPage(
      {@required this.fileName,
        @required this.backgroundColor,
        @required this.images});

  @override
  _ColorsPageState createState() => _ColorsPageState(
      fileName: this.fileName, backgroundColor: this.backgroundColor,images: this.images);
}

class _ColorsPageState extends State<ColorsPage> {
  String fileName;
  List<Color> images;
  Color backgroundColor;
  Words _wordsList;

  _ColorsPageState(
      {@required this.fileName,
        @required this.backgroundColor,
        @required this.images});

  @override
  void initState() {
    super.initState();
    this._loadData().then((words) {
      setState(() {
        _wordsList = words;
      });
    });
  }

  Future<Words> _loadData() async {
    var json = await rootBundle.loadString(fileName);
    Words words = wordFromJson(json);
    return words;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backgroundColor,
      child: ListView.separated(
        itemCount: _wordsList == null ? 0 : _wordsList.ar.length,
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
      leading: CircleAvatar(
        backgroundColor: images[index],
      ),
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
      onTap: () {},
    );
  }
}
