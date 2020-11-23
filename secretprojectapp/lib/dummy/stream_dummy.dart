Stream<String> getStreamDummy(int cnt) async* {
  for(int i=0; i<cnt; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i.toString();
  }
}