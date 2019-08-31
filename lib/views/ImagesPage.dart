import 'package:flutter/material.dart';
import 'package:english_app/models/Words.dart';
import 'package:english_app/models/Images.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;

class ImagesPage extends StatefulWidget {
  final String fileName;
  final Color backgroundColor;

  ImagesPage({@required this.fileName, @required this.backgroundColor});

  @override
  _ImagesPageState createState() => _ImagesPageState(
      fileName: this.fileName, backgroundColor: this.backgroundColor);
}

class WordData {
  Words wordsList;
  List<String> images;

  WordData({@required this.wordsList, @required this.images});
}

class _ImagesPageState extends State<ImagesPage> {
  String fileName;
  WordData _wordData;
  Color backgroundColor;

  _ImagesPageState({@required this.fileName, @required this.backgroundColor});

  @override
  void initState() {
    super.initState();
    this._loadData().then((words) {
      setState(() {
        _wordData = words;
      });
    });
  }

  Future<WordData> _loadData() async {
    var wordsJson = await rootBundle.loadString(fileName);
    Words words = wordFromJson(wordsJson);
    var imagesJson = await rootBundle.loadString("lib/assets/images.json");
    Images allImages = imagesFromJson(imagesJson);
    List<String> images = this.backgroundColor == Colors.orange
        ? allImages.numbers
        : allImages.family;
    return WordData(wordsList: words, images: images);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backgroundColor,
      child: ListView.separated(
        itemCount: _wordData == null ? 0 : _wordData.wordsList.ar.length,
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
        child: Image.asset(
            _wordData == null ? "" : _wordData.images[index],
            height: 50,
            width: 50,
          ),
        backgroundColor: Colors.white,
      ),
      title: Text(
        _wordData.wordsList.ar[index],
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        _wordData.wordsList.en[index],
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
