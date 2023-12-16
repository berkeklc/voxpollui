import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:voxpollui/home_page.dart';
import 'package:voxpollui/script/database.dart';

class SurveyPage extends StatefulWidget {
  final List<Map<dynamic, dynamic>> pollData;
  final int index;

  SurveyPage({Key? key, required this.pollData, required this.index}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late Future<List<PollOption>> _pollOptions;
  List<String> _pollOptionTitles = []; // Bu yeni listeyi ekleyin
  bool _hasVoted = false;
  bool _isLoading = true; // Yükleme durumu ekleyin

  @override
  void initState() {
    super.initState();
    _isLoading = true; // İlk başta yükleniyor olarak ayarlayın
    _pollOptions = _fetchPollOptions(); // _pollOptions'ı başlatın
    _checkIfUserVoted(); // Sonra _hasUserVoted'ı çağırın
  }

  Future<void> _checkIfUserVoted() async {
  bool hasVoted = await Database.hasUserVoted(widget.pollData);
  print("_hasVoted: $hasVoted"); // Debug için yazdırın
  setState(() {
    _hasVoted = hasVoted;
    if (!_hasVoted) {
      _pollOptions = _fetchPollOptions();
    }
    _isLoading = false; // Veriler yüklendiğinde yükleme durumunu güncelleyin
  });
}

  Future<List<PollOption>> _fetchPollOptions() async {
    var poll = widget.pollData[widget.index]['poll'];
    String pollId = poll?.get<String>('objectId') ?? 'Bilinmiyor';
    QueryBuilder<ParseObject> queryPollOptions = QueryBuilder<ParseObject>(ParseObject('PollOption'))
      ..whereEqualTo('pollId', pollId);

    final ParseResponse apiResponse = await queryPollOptions.query();

    if (apiResponse.success && apiResponse.results != null) {
      _pollOptionTitles.clear(); // Listeyi temizleyin
      return apiResponse.results!.map((e) {
        String optionId = e.get<String>('objectId') ?? 'Bilinmiyor';
        String optionTitle = e.get<String>('text') ?? 'Hata';
        _pollOptionTitles.add(optionTitle); // Başlığı listeye ekleyin
        return PollOption(
          id: optionId,
          title: Text(optionTitle),
          votes: e.get<int>('votes') ?? 0,
        );
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var poll = widget.pollData[widget.index]['poll'];

    DateTime? endDate = poll.get<DateTime>('endDate');
    bool pollEnded = endDate != null ? DateTime.now().isAfter(endDate) : false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Anket Sayfası'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _isLoading // Yükleme durumunu kontrol edin
            ? CircularProgressIndicator(color: Color(0xFF2355FF),) // Yükleme sırasında dönme çemberi göster
            : ListView(
                children: [
                  _buildCardCommunity(),
                  _hasVoted
                      ? _buildPollResults(poll)
                      : FutureBuilder<List<PollOption>>(
                          future: _pollOptions,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator(color: Color(0xFF2355FF),);
                            }

                            if (snapshot.hasError) {
                              return Text('Hata: ${snapshot.error}');
                            }

                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Text('Anket seçenekleri bulunamadı');
                            }

                            return FlutterPolls(
                              pollId: poll.objectId,
                              onVoted: (PollOption pollOption, int newTotalVotes) async {
                                ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
                                String userId = currentUser?.objectId ?? "BilinmeyenKullanıcı";
                                String optionId = pollOption.id.toString();
                                print("Kullanıcı ID: $userId, Anket ID: ${poll.objectId}, Seçenek ID: $optionId");
                                ParseCloudFunction function = ParseCloudFunction('recordPollResponse');
                                final Map<String, dynamic> params = <String, dynamic>{
                                  'userId': userId,
                                  'pollId': poll.objectId,
                                  'optionId': optionId
                                };
                                final ParseResponse result = await function.execute(parameters: params);

                                if (result.success) {
                                  print('Oy Başarıyla Kaydedildi');
                                  // _pollOptions'ı yeniden yüklemeyi burada yapabilirsiniz
                                  return true;
                                } else {
                                  print("Anket cevabı kaydedilemedi: ${result.error}");
                                  return false;
                                }
                              },
                              pollEnded: pollEnded,
                              pollTitle: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  poll.get<String>('title'),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              pollOptions: snapshot.data!,
                              votedPercentageTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                ],
              ),
      ),
    );
  }

  Widget _buildCardCommunity() {
    ParseObject? creator = widget.pollData[widget.index]['creator'];
    String creatorUsername = creator?.get<String>('username') ?? 'Bilinmiyor';
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/login.png'),
      ),
      title: Row(
        children: [
          Text('$creatorUsername'),
          SizedBox(width: 4.0),
          Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
          SizedBox(width: 4.0),
          Text('@$creatorUsername', style: TextStyle(fontSize: 12.0)),
        ],
      ),
      subtitle: Text('Topluluk Açıklaması'),
      trailing: InkWell(
        onTap: () {
          // Burada tıklama olayını işleyin
          print('Trailing ikonuna tıklandı!');
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(pollData: widget.pollData, i: 4)));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildPollResults(var poll) {
    return FutureBuilder<List<PollOption>>(
      future: _pollOptions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Color(0xFF2355FF),);
        }

        if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Anket seçenekleri bulunamadı');
        }

        List<PollOption> options = snapshot.data!;
        int totalVotes = options.fold(0, (sum, item) => sum + item.votes);
         bool pollEnded = true;
//@
        return FlutterPolls(
                              pollId: poll.objectId,
                              onVoted: (PollOption pollOption, int newTotalVotes) async {
                                ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
                                String userId = currentUser?.objectId ?? "BilinmeyenKullanıcı";
                                String optionId = pollOption.id.toString();
                                print("Kullanıcı ID: $userId, Anket ID: ${poll.objectId}, Seçenek ID: $optionId");
                                ParseCloudFunction function = ParseCloudFunction('recordPollResponse');
                                final Map<String, dynamic> params = <String, dynamic>{
                                  'userId': userId,
                                  'pollId': poll.objectId,
                                  'optionId': optionId
                                };
                                final ParseResponse result = await function.execute(parameters: params);

                                if (result.success) {
                                  print('Oy Başarıyla Kaydedildi');
                                  // _pollOptions'ı yeniden yüklemeyi burada yapabilirsiniz
                                  return true;
                                } else {
                                  print("Anket cevabı kaydedilemedi: ${result.error}");
                                  return false;
                                }
                              },
                              pollEnded: pollEnded,
                              pollTitle: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  poll.get<String>('title'),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              pollOptions: snapshot.data!,
                              votedPercentageTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            );
      },
    );
  }
}