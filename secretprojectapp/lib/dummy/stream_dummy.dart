import 'package:secretprojectapp/virus_unit.dart';

Stream<String> getStreamDummy() async* {
  List<String> jsonDummy = [
    '{"sender":"doralife11@naver.com","fileName":"gawegaweg","mailTitle":"This is Virus1.","mailContent":"This is Virus Contents1.","timestamp":"202011240001"}',
    '{"sender":"doralife12@naver.com","fileName":"porjpqoejgo","mailTitle":"This is Virus2.","mailContent":"This is Virus Contents1.","timestamp":"202011240002"}',
    '{"sender":"doralife13@naver.com","fileName":"oiviondsioneqw","mailTitle":"This is Virus3.","mailContent":"This is Virus Contents1.","timestamp":"202011240003"}',
    '{"sender":"doralife14@naver.com","fileName":"oieqhgoisnzdvkjsz","mailTitle":"This is Virus4.","mailContent":"This is Virus Contents1.","timestamp":"202011240004"}',
    '{"sender":"doralife15@naver.com","fileName":"qiowjpoasjfkdnszkl","mailTitle":"This is Virus5.","mailContent":"This is Virus Contents1.","timestamp":"202011240005"}',
  ];

  for(int i=0; i<jsonDummy.length; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield jsonDummy[i];
  }
}