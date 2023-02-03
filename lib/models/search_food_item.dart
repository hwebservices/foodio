class SearchItems {
  String? foodName;
  String? servingUnit;
  String? nixBrandId;
  String? brandNameItemName;
  int? servingQty;
  int? nfCalories;
  Photo? photo;
  String? brandName;
  int? region;
  int? brandType;
  String? nixItemId;
  String? locale;

  SearchItems(
      {this.foodName,
      this.servingUnit,
      this.nixBrandId,
      this.brandNameItemName,
      this.servingQty,
      this.nfCalories,
      this.photo,
      this.brandName,
      this.region,
      this.brandType,
      this.nixItemId,
      this.locale});

  SearchItems.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    servingUnit = json['serving_unit'];
    nixBrandId = json['nix_brand_id'];
    brandNameItemName = json['brand_name_item_name'];
    servingQty = json['serving_qty'];
    nfCalories = json['nf_calories'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    brandName = json['brand_name'];
    region = json['region'];
    brandType = json['brand_type'];
    nixItemId = json['nix_item_id'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_name'] = foodName;
    data['serving_unit'] = servingUnit;
    data['nix_brand_id'] = nixBrandId;
    data['brand_name_item_name'] = brandNameItemName;
    data['serving_qty'] = servingQty;
    data['nf_calories'] = nfCalories;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    data['brand_name'] = brandName;
    data['region'] = region;
    data['brand_type'] = brandType;
    data['nix_item_id'] = nixItemId;
    data['locale'] = locale;
    return data;
  }
}

class Photo {
  String? thumb;

  Photo({this.thumb});

  Photo.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    return data;
  }
}
