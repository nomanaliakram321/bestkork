import 'package:bestkrok_easykrok/database/qb_db_provider.dart';
import 'package:bestkrok_easykrok/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = true;
  List<Questions> qna;

  @override
  void initState() {
    getLanguage();
    loadCategory();
    super.initState();
  }

  String language = 'english';
  getLanguage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String getLanguage = _prefs.getString('language');

    if (getLanguage == null) {
      setState(() {});
    }
    if (getLanguage != null) {
      setState(() {
        language = getLanguage;
      });
    }
  }

  loadCategory() {
    var english = language == 'english';
    var russian = language == 'russian';
    if (english) {
      setState(() {
        isLoading = false;
      });
      return QuestionDbProvider.db
          .questionAndAnswerSearch('english')
          .asStream();
    }
    if (russian) {
      setState(() {
        isLoading = false;
      });
      return QuestionDbProvider.db
          .questionAndAnswerSearch('russian')
          .asStream();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Search'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage<Questions>(
                    barTheme: Theme.of(context).copyWith(
                      backgroundColor: Colors.green[500],
                      textTheme: TextTheme(
                        headline1: TextStyle(color: Colors.white),
                        headline2: TextStyle(color: Colors.white),
                        headline3: TextStyle(color: Colors.white),
                        headline4: TextStyle(color: Colors.white),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                    onQueryUpdate: (s) => print(s),
                    items: qna,
                    searchLabel: 'Search here',
                    suggestion: Center(
                      child: Text('Filter by category'),
                    ),
                    failure: Center(
                      child: Text(
                        'No Items found :(',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    filter: (list) => [
                      list.question,
                      list.answer,
                      list.shortcut,
                    ],
                    builder: (list) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset.zero,
                                blurRadius: 5)
                          ]),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            child: Text(
                              list.shortcut,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  backgroundColor: Colors.yellow,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.green[500],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Text(
                              list.question,
                              style: TextStyle(color: Colors.white),
                            ),
                            // 'The dialog route created by this method is pushed to the root navigator.'
                            // ' If the application has multiple Navigator objects, it may be necessary to cal',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            child: Text(
                              list.answer,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
      body: StreamBuilder(
        stream: loadCategory(),
        builder: (context, snapshot) {
          qna = snapshot.data;

          try {
            print(snapshot.data.length);
          } catch (e) {
            print(e);
          }
          if (snapshot.hasData) {
            return ListView.separated(
              // itemCount: snapshot.data.length,
              itemCount: qna.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset.zero,
                            blurRadius: 5)
                      ]),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Text(
                          qna[index].shortcut == null
                              ? "null"
                              : qna[index].shortcut,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.yellow),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Text(
                          qna[index].question == null
                              ? "I am done"
                              : qna[index].question,
                          style: TextStyle(color: Colors.white),
                        ),
                        // 'The dialog route created by this method is pushed to the root navigator.'
                        // ' If the application has multiple Navigator objects, it may be necessary to cal',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Text(
                          qna[index].answer == null
                              ? "null"
                              : qna[index].answer,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green[500]),
            ));
          }
        },
      ),
    );
  }
}
