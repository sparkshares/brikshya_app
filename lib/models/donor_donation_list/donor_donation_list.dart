class DonorDonationList {
  int? id;
  String? donationName;
  String? donationDescription;
  int? treeCount;
  int? donationAmount;
  String? status;
  String? createdAt;
  int? donarId;
  String? treeDonationStatusStatus;
  String? treeDonationStatusComments;
  String? treeDonationStatusImagePath;

  DonorDonationList(
      {this.id,
      this.donationName,
      this.donationDescription,
      this.treeCount,
      this.donationAmount,
      this.status,
      this.createdAt,
      this.donarId,
      this.treeDonationStatusStatus,
      this.treeDonationStatusComments,
      this.treeDonationStatusImagePath});

  DonorDonationList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donationName = json['donation_name'];
    donationDescription = json['donation_description'];
    treeCount = json['tree_count'];
    donationAmount = json['donation_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    donarId = json['donar_id'];
    treeDonationStatusStatus = json['tree_donation_status_status'];
    treeDonationStatusComments = json['tree_donation_status_comments'];
    treeDonationStatusImagePath = json['tree_donation_status_image_path'];
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
    data['tree_donation_status_status'] = this.treeDonationStatusStatus;
    data['tree_donation_status_comments'] = this.treeDonationStatusComments;
    data['tree_donation_status_image_path'] = this.treeDonationStatusImagePath;
    return data;
  }
}
