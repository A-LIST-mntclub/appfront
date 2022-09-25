class series {
  var String chapterName;
  var String chapterLink;
  var String chapterDate;
  var String chapterImg;
  bool isRead;

  ///this is all of the data we need to populate the main page. we will make an array that contains multiple objects of "series"
  series({this.chapterName, this.chapterLink, this.chapterDate, this.chapterImg, this.isRead=true});

}