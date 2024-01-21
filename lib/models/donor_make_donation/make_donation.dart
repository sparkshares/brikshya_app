class MakeDonation {
  int? id;
  String? donationName;
  String? donationDescription;
  int? treeCount;
  int? donationAmount;
  String? status;
  String? createdAt;
  int? donarId;

  MakeDonation(
      {this.id,
      this.donationName,
      this.donationDescription,
      this.treeCount,
      this.donationAmount,
      this.status,
      this.createdAt,
      this.donarId});

  MakeDonation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donationName = json['donation_name'];
    donationDescription = json['donation_description'];
    treeCount = json['tree_count'];
    donationAmount = json['donation_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    donarId = json['donar_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['donation_name'] = this.donationName;
    data['donation_description'] = this.donationDescription;
    data['tree_count'] = this.treeCount;
    data['donation_amount'] = this.donationAmount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['donar_id'] = this.donarId;
    return data;
  }
}
