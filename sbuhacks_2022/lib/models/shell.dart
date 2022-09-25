class Shell {
  List list = [];

  Map toJson() => {
    'list': list,
  };
  ///this is the shell we will be passing to the backend API
}
