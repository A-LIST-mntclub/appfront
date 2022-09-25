class Series {
  String chapterName;
  String chapterLink;
  String chapterCount;
  String chapterDate;
  String chapterImg;

  ///this is all of the data we need to populate the main page. we will make an array that contains multiple objects of "series"
  Map<String, dynamic> toJson() => {
    "chapterLink": chapterLink,
  };
  Series(this.chapterName, this.chapterLink, this.chapterCount, this.chapterDate, this.chapterImg);
/*
  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      chapterName: json["chapterName"],
      chapterCount: json["chapterLink"],
      chapterDate: json["chapterDate"],
      chapterImg: json["chapterImg"],
    );

  }

 */

}