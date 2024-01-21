class FarmerDonationStatus {
  int? id;
  int? treeAcceptId;
  String? status;
  String? comments;
  String? imagePath;
  String? createdAt;

  FarmerDonationStatus(
      {this.id,
      this.treeAcceptId,
      this.status,
      this.comments,
      this.imagePath,
      this.createdAt});

  FarmerDonationStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    treeAcceptId = json['tree_accept_id'];
    status = json['status'];
    comments = json['comments'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tree_accept_id'] = this.treeAcceptId;
    data['status'] = this.status;
    data['comments'] = this.comments;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    return data;
  }
}
