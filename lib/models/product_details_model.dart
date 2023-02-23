class ProductDetailsModel {
  int? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  dynamic? slug;
  String? productName;
  String? model;
  String? commissionType;
  dynamic? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  Null? badge;
  bool? isActive;
  String? sackEquivalent;
  String? createdAt;
  String? updatedAt;
  Null? language;
  String? seller;
  Null? combo;
  String? createdBy;
  Null? updatedBy;
  List<int>? category;
  List<Null>? relatedProduct;
  List<Null>? filterValue;
  List<String>? distributors;

  ProductDetailsModel(
      {this.id,
      this.brand,
      this.image,
      this.charge,
      this.images,
      this.slug,
      this.productName,
      this.model,
      this.commissionType,
      this.amount,
      this.tag,
      this.description,
      this.note,
      this.embaddedVideoLink,
      this.maximumOrder,
      this.stock,
      this.isBackOrder,
      this.specification,
      this.warranty,
      this.preOrder,
      this.productReview,
      this.isSeller,
      this.isPhone,
      this.willShowEmi,
      this.badge,
      this.isActive,
      this.sackEquivalent,
      this.createdAt,
      this.updatedAt,
      this.language,
      this.seller,
      this.combo,
      this.createdBy,
      this.updatedBy,
      this.category,
      this.relatedProduct,
      this.filterValue,
      this.distributors});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge =
        json['charge'] != null ? new Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    badge = json['badge'];
    isActive = json['is_active'];
    sackEquivalent = json['sack_equivalent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    seller = json['seller'];
    combo = json['combo'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    category = json['category'].cast<int>();
    // if (json['related_product'] != null) {
    //   relatedProduct = <Null>[];
    //   json['related_product'].forEach((v) {
    //     relatedProduct!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['filter_value'] != null) {
    //   filterValue = <Null>[];
    //   json['filter_value'].forEach((v) {
    //     filterValue!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['distributors'] != null) {
    //   distributors = <Null>[];
    //   json['distributors'].forEach((v) {
    //     distributors!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['image'] = this.image;
    if (this.charge != null) {
      data['charge'] = this.charge!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['product_name'] = this.productName;
    data['model'] = this.model;
    data['commission_type'] = this.commissionType;
    data['amount'] = this.amount;
    data['tag'] = this.tag;
    data['description'] = this.description;
    data['note'] = this.note;
    data['embadded_video_link'] = this.embaddedVideoLink;
    data['maximum_order'] = this.maximumOrder;
    data['stock'] = this.stock;
    data['is_back_order'] = this.isBackOrder;
    data['specification'] = this.specification;
    data['warranty'] = this.warranty;
    data['pre_order'] = this.preOrder;
    data['product_review'] = this.productReview;
    data['is_seller'] = this.isSeller;
    data['is_phone'] = this.isPhone;
    data['will_show_emi'] = this.willShowEmi;
    data['badge'] = this.badge;
    data['is_active'] = this.isActive;
    data['sack_equivalent'] = this.sackEquivalent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['language'] = this.language;
    data['seller'] = this.seller;
    data['combo'] = this.combo;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['category'] = this.category;
    // if (this.relatedProduct != null) {
    //   data['related_product'] =
    //       this.relatedProduct!.map((v) => v.toJson()).toList();
    // }
    // if (this.filterValue != null) {
    //   data['filter_value'] = this.filterValue!.map((v) => v.toJson()).toList();
    // }
    // if (this.distributors != null) {
    //   data['distributors'] = this.distributors!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Brand {
  String? name;
  String? image;
  String? headerImage;
  String? slug;

  Brand({this.name, this.image, this.headerImage, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['header_image'] = this.headerImage;
    data['slug'] = this.slug;
    return data;
  }
}

class Charge {
  dynamic? bookingPrice;
  dynamic? currentCharge;
  dynamic? discountCharge;
  dynamic? sellingPrice;
  dynamic? profit;
  bool? isEvent;
  Null? eventId;
  bool? highlight;
  Null? highlightId;
  bool? groupping;
  Null? grouppingId;
  Null? campaignSectionId;
  bool? campaignSection;
  Null? message;

  Charge(
      {this.bookingPrice,
      this.currentCharge,
      this.discountCharge,
      this.sellingPrice,
      this.profit,
      this.isEvent,
      this.eventId,
      this.highlight,
      this.highlightId,
      this.groupping,
      this.grouppingId,
      this.campaignSectionId,
      this.campaignSection,
      this.message});

  Charge.fromJson(Map<String, dynamic> json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = json['discount_charge'];
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_price'] = this.bookingPrice;
    data['current_charge'] = this.currentCharge;
    data['discount_charge'] = this.discountCharge;
    data['selling_price'] = this.sellingPrice;
    data['profit'] = this.profit;
    data['is_event'] = this.isEvent;
    data['event_id'] = this.eventId;
    data['highlight'] = this.highlight;
    data['highlight_id'] = this.highlightId;
    data['groupping'] = this.groupping;
    data['groupping_id'] = this.grouppingId;
    data['campaign_section_id'] = this.campaignSectionId;
    data['campaign_section'] = this.campaignSection;
    data['message'] = this.message;
    return data;
  }
}

class Images {
  int? id;
  String? image;
  bool? isPrimary;
  int? product;

  Images({this.id, this.image, this.isPrimary, this.product});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_primary'] = this.isPrimary;
    data['product'] = this.product;
    return data;
  }
}