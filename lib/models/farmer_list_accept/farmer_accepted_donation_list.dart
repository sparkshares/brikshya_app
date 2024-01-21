class FarmerAcceptedDonationList {
  int? id;
  int? treeTransId;
  int? farmerId;
  String? status;
  String? createdAt;

  FarmerAcceptedDonationList(
      {this.id, this.treeTransId, this.farmerId, this.status, this.createdAt});

  FarmerAcceptedDonationList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    treeTransId = json['tree_trans_id'];
    farmerId = json['farmer_id'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tree_trans_id'] = this.treeTransId;
    data['farmer_id'] = this.farmerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
