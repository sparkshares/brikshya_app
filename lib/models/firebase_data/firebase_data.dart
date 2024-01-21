class FirebaseData {
  double? humidity;
  int? soilMoisture;
  double? temp;

  FirebaseData({this.humidity, this.soilMoisture, this.temp});

  FirebaseData.fromJson(Map<String, dynamic> json) {
    humidity = (json['humidity'] as num).toDouble();
    soilMoisture = json['soilMoisture'];
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['humidity'] = this.humidity;
    data['soilMoisture'] = this.soilMoisture;
    data['temp'] = this.temp;
    return data;
  }
}
