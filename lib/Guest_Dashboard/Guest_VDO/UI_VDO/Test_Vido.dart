import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/UI_News_Event/Up_Event_Detail.dart';


const apiEndpoint =
    'http://192.168.3.34/hosting_api/Guest/fetch_guest_event_upcoming.php';

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse(apiEndpoint));

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);

    if (jsonBody is List) {
      return jsonBody;
    } else if (jsonBody is Map) {
      // Handle object response
      return [jsonBody];
    } else {
      throw Exception('Invalid API response');
    }
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<dynamic> _data = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await fetchData();
      setState(() {
        _data = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _data = [];
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to load data: ${e.toString()}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  String getImageUrl(String imageName) {
    return 'http://192.168.3.34/hosting_api/Guest/event_image/$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF5F5F7FE),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _data.isEmpty
                ? const Center(child: Text('No data available'))
                : Center(
                    child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        final item = _data[index];
                        final imageUrl = getImageUrl(item['upcoming_image']);
                        return Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            elevation: 3,
                            shadowColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Up_Event_Detail(
                                              data: item,
                                            )));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 125,
                                      width: double.maxFinite,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          imageUrl,
                                          width: double.maxFinite,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Text(
                                              item['upcoming_title'],
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      'KhmerOSBattambang'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Text(
                                              item['upcoming_detail'],
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      'KhmerOSBattambang'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/image/Event_Date.png',
                                                  width: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Text(
                                                  'ថ្ងៃ' + item['upcoming_day'],
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'KhmerOSBattambang',
                                                      color:
                                                          Colors.indigo[900]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                child: Text(
                                                  'ទី' + item['upcoming_date'],
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'KhmerOSBattambang',
                                                      color:
                                                          Colors.indigo[900]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                child: Text(
                                                  'ខែ' + item['upcoming_month'],
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'KhmerOSBattambang',
                                                      color:
                                                          Colors.indigo[900]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                child: Text(
                                                  'ឆ្នាំ' +
                                                      item['upcoming_year'],
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'KhmerOSBattambang',
                                                      color:
                                                          Colors.indigo[900]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                child: Image.asset(
                                                  'assets/image/Event_Time.png',
                                                  width: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Text(
                                                  item['upcoming_time'],
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'KhmerOSBattambang',
                                                      color:
                                                          Colors.indigo[900]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ));
  }
}
