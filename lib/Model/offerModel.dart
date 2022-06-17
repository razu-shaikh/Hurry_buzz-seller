class OfferModel {
  OfferModel({
      List<Offers>? offers,}){
    _offers = offers;
}

  OfferModel.fromJson(dynamic json) {
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }
  List<Offers>? _offers;

  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Offers {
  Offers({
      int? id, 
      String? userId, 
      String? campaignId, 
      String? productId, 
      String? status, 
      String? discount, 
      String? discountType, 
      String? createdAt, 
      String? updatedAt, 
      Campaign? campaign, 
      Product? product,}){
    _id = id;
    _userId = userId;
    _campaignId = campaignId;
    _productId = productId;
    _status = status;
    _discount = discount;
    _discountType = discountType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _campaign = campaign;
    _product = product;
}

  Offers.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _campaignId = json['campaign_id'];
    _productId = json['product_id'];
    _status = json['status'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _campaign = json['campaign'] != null ? Campaign.fromJson(json['campaign']) : null;
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? _id;
  String? _userId;
  String? _campaignId;
  String? _productId;
  String? _status;
  String? _discount;
  String? _discountType;
  String? _createdAt;
  String? _updatedAt;
  Campaign? _campaign;
  Product? _product;

  int? get id => _id;
  String? get userId => _userId;
  String? get campaignId => _campaignId;
  String? get productId => _productId;
  String? get status => _status;
  String? get discount => _discount;
  String? get discountType => _discountType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Campaign? get campaign => _campaign;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['campaign_id'] = _campaignId;
    map['product_id'] = _productId;
    map['status'] = _status;
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_campaign != null) {
      map['campaign'] = _campaign?.toJson();
    }
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      int? id, 
      String? brandId, 
      String? categoryId, 
      String? userId, 
      String? createdBy, 
      String? slug, 
      String? price, 
      String? specialDiscount, 
      String? specialDiscountType, 
      String? specialDiscountStart, 
      String? specialDiscountEnd, 
      String? purchaseCost, 
      String? barcode, 
      dynamic videoProvider, 
      dynamic videoUrl, 
      dynamic vatTaxes, 
      String? hasVariant, 
      Thumbnail? thumbnail, 
      String? thumbnailId, 
      dynamic imageIds, 
      String? currentStock, 
      String? minimumOrderQuantity, 
      String? stockNotification, 
      String? lowStockToNotify, 
      String? stockVisibility, 
      String? totalSale, 
      String? status, 
      String? isApproved, 
      String? isCatalog, 
      dynamic externalLink, 
      String? isFeatured, 
      String? isClassified, 
      String? isWholesale, 
      String? isDigital, 
      String? isRefundable, 
      String? todaysDeal, 
      int? rating, 
      String? viewed, 
      dynamic shippingType, 
      String? shippingFee, 
      String? shippingFeeDependOnQuantity, 
      String? estimatedShippingDays, 
      String? cashOnDelivery, 
      MetaImage? metaImage, 
      dynamic productFile, 
      dynamic productFileId, 
      String? metaImageId, 
      String? reward, 
      String? isDeleted, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? productName, 
      String? image190x230, 
      String? image40x40, 
      String? image72x72, 
      String? image110x122, 
      int? specialDiscountCheck, 
      int? discountPercentage, 
      List<ProductLanguages>? productLanguages,}){
    _id = id;
    _brandId = brandId;
    _categoryId = categoryId;
    _userId = userId;
    _createdBy = createdBy;
    _slug = slug;
    _price = price;
    _specialDiscount = specialDiscount;
    _specialDiscountType = specialDiscountType;
    _specialDiscountStart = specialDiscountStart;
    _specialDiscountEnd = specialDiscountEnd;
    _purchaseCost = purchaseCost;
    _barcode = barcode;
    _videoProvider = videoProvider;
    _videoUrl = videoUrl;
    _vatTaxes = vatTaxes;
    _hasVariant = hasVariant;
    _thumbnail = thumbnail;
    _thumbnailId = thumbnailId;
    _imageIds = imageIds;
    _currentStock = currentStock;
    _minimumOrderQuantity = minimumOrderQuantity;
    _stockNotification = stockNotification;
    _lowStockToNotify = lowStockToNotify;
    _stockVisibility = stockVisibility;
    _totalSale = totalSale;
    _status = status;
    _isApproved = isApproved;
    _isCatalog = isCatalog;
    _externalLink = externalLink;
    _isFeatured = isFeatured;
    _isClassified = isClassified;
    _isWholesale = isWholesale;
    _isDigital = isDigital;
    _isRefundable = isRefundable;
    _todaysDeal = todaysDeal;
    _rating = rating;
    _viewed = viewed;
    _shippingType = shippingType;
    _shippingFee = shippingFee;
    _shippingFeeDependOnQuantity = shippingFeeDependOnQuantity;
    _estimatedShippingDays = estimatedShippingDays;
    _cashOnDelivery = cashOnDelivery;
    _metaImage = metaImage;
    _productFile = productFile;
    _productFileId = productFileId;
    _metaImageId = metaImageId;
    _reward = reward;
    _isDeleted = isDeleted;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productName = productName;
    _image190x230 = image190x230;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image110x122 = image110x122;
    _specialDiscountCheck = specialDiscountCheck;
    _discountPercentage = discountPercentage;
    _productLanguages = productLanguages;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _brandId = json['brand_id'];
    _categoryId = json['category_id'];
    _userId = json['user_id'];
    _createdBy = json['created_by'];
    _slug = json['slug'];
    _price = json['price'];
    _specialDiscount = json['special_discount'];
    _specialDiscountType = json['special_discount_type'];
    _specialDiscountStart = json['special_discount_start'];
    _specialDiscountEnd = json['special_discount_end'];
    _purchaseCost = json['purchase_cost'];
    _barcode = json['barcode'];
    _videoProvider = json['video_provider'];
    _videoUrl = json['video_url'];
    _vatTaxes = json['vat_taxes'];
    _hasVariant = json['has_variant'];
    _thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    _thumbnailId = json['thumbnail_id'];
    _imageIds = json['image_ids'];
    _currentStock = json['current_stock'];
    _minimumOrderQuantity = json['minimum_order_quantity'];
    _stockNotification = json['stock_notification'];
    _lowStockToNotify = json['low_stock_to_notify'];
    _stockVisibility = json['stock_visibility'];
    _totalSale = json['total_sale'];
    _status = json['status'];
    _isApproved = json['is_approved'];
    _isCatalog = json['is_catalog'];
    _externalLink = json['external_link'];
    _isFeatured = json['is_featured'];
    _isClassified = json['is_classified'];
    _isWholesale = json['is_wholesale'];
    _isDigital = json['is_digital'];
    _isRefundable = json['is_refundable'];
    _todaysDeal = json['todays_deal'];
    _rating = json['rating'];
    _viewed = json['viewed'];
    _shippingType = json['shipping_type'];
    _shippingFee = json['shipping_fee'];
    _shippingFeeDependOnQuantity = json['shipping_fee_depend_on_quantity'];
    _estimatedShippingDays = json['estimated_shipping_days'];
    _cashOnDelivery = json['cash_on_delivery'];
    _metaImage = json['meta_image'] != null ? MetaImage.fromJson(json['meta_image']) : null;
    _productFile = json['product_file'];
    _productFileId = json['product_file_id'];
    _metaImageId = json['meta_image_id'];
    _reward = json['reward'];
    _isDeleted = json['is_deleted'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _productName = json['product_name'];
    _image190x230 = json['image_190x230'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image110x122 = json['image_110x122'];
    _specialDiscountCheck = json['special_discount_check'];
    _discountPercentage = json['discount_percentage'];
    if (json['product_languages'] != null) {
      _productLanguages = [];
      json['product_languages'].forEach((v) {
        _productLanguages?.add(ProductLanguages.fromJson(v));
      });
    }
  }
  int? _id;
  String? _brandId;
  String? _categoryId;
  String? _userId;
  String? _createdBy;
  String? _slug;
  String? _price;
  String? _specialDiscount;
  String? _specialDiscountType;
  String? _specialDiscountStart;
  String? _specialDiscountEnd;
  String? _purchaseCost;
  String? _barcode;
  dynamic _videoProvider;
  dynamic _videoUrl;
  dynamic _vatTaxes;
  String? _hasVariant;
  Thumbnail? _thumbnail;
  String? _thumbnailId;
  dynamic _imageIds;
  String? _currentStock;
  String? _minimumOrderQuantity;
  String? _stockNotification;
  String? _lowStockToNotify;
  String? _stockVisibility;
  String? _totalSale;
  String? _status;
  String? _isApproved;
  String? _isCatalog;
  dynamic _externalLink;
  String? _isFeatured;
  String? _isClassified;
  String? _isWholesale;
  String? _isDigital;
  String? _isRefundable;
  String? _todaysDeal;
  int? _rating;
  String? _viewed;
  dynamic _shippingType;
  String? _shippingFee;
  String? _shippingFeeDependOnQuantity;
  String? _estimatedShippingDays;
  String? _cashOnDelivery;
  MetaImage? _metaImage;
  dynamic _productFile;
  dynamic _productFileId;
  String? _metaImageId;
  String? _reward;
  String? _isDeleted;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _productName;
  String? _image190x230;
  String? _image40x40;
  String? _image72x72;
  String? _image110x122;
  int? _specialDiscountCheck;
  int? _discountPercentage;
  List<ProductLanguages>? _productLanguages;

  int? get id => _id;
  String? get brandId => _brandId;
  String? get categoryId => _categoryId;
  String? get userId => _userId;
  String? get createdBy => _createdBy;
  String? get slug => _slug;
  String? get price => _price;
  String? get specialDiscount => _specialDiscount;
  String? get specialDiscountType => _specialDiscountType;
  String? get specialDiscountStart => _specialDiscountStart;
  String? get specialDiscountEnd => _specialDiscountEnd;
  String? get purchaseCost => _purchaseCost;
  String? get barcode => _barcode;
  dynamic get videoProvider => _videoProvider;
  dynamic get videoUrl => _videoUrl;
  dynamic get vatTaxes => _vatTaxes;
  String? get hasVariant => _hasVariant;
  Thumbnail? get thumbnail => _thumbnail;
  String? get thumbnailId => _thumbnailId;
  dynamic get imageIds => _imageIds;
  String? get currentStock => _currentStock;
  String? get minimumOrderQuantity => _minimumOrderQuantity;
  String? get stockNotification => _stockNotification;
  String? get lowStockToNotify => _lowStockToNotify;
  String? get stockVisibility => _stockVisibility;
  String? get totalSale => _totalSale;
  String? get status => _status;
  String? get isApproved => _isApproved;
  String? get isCatalog => _isCatalog;
  dynamic get externalLink => _externalLink;
  String? get isFeatured => _isFeatured;
  String? get isClassified => _isClassified;
  String? get isWholesale => _isWholesale;
  String? get isDigital => _isDigital;
  String? get isRefundable => _isRefundable;
  String? get todaysDeal => _todaysDeal;
  int? get rating => _rating;
  String? get viewed => _viewed;
  dynamic get shippingType => _shippingType;
  String? get shippingFee => _shippingFee;
  String? get shippingFeeDependOnQuantity => _shippingFeeDependOnQuantity;
  String? get estimatedShippingDays => _estimatedShippingDays;
  String? get cashOnDelivery => _cashOnDelivery;
  MetaImage? get metaImage => _metaImage;
  dynamic get productFile => _productFile;
  dynamic get productFileId => _productFileId;
  String? get metaImageId => _metaImageId;
  String? get reward => _reward;
  String? get isDeleted => _isDeleted;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get productName => _productName;
  String? get image190x230 => _image190x230;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image110x122 => _image110x122;
  int? get specialDiscountCheck => _specialDiscountCheck;
  int? get discountPercentage => _discountPercentage;
  List<ProductLanguages>? get productLanguages => _productLanguages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand_id'] = _brandId;
    map['category_id'] = _categoryId;
    map['user_id'] = _userId;
    map['created_by'] = _createdBy;
    map['slug'] = _slug;
    map['price'] = _price;
    map['special_discount'] = _specialDiscount;
    map['special_discount_type'] = _specialDiscountType;
    map['special_discount_start'] = _specialDiscountStart;
    map['special_discount_end'] = _specialDiscountEnd;
    map['purchase_cost'] = _purchaseCost;
    map['barcode'] = _barcode;
    map['video_provider'] = _videoProvider;
    map['video_url'] = _videoUrl;
    map['vat_taxes'] = _vatTaxes;
    map['has_variant'] = _hasVariant;
    if (_thumbnail != null) {
      map['thumbnail'] = _thumbnail?.toJson();
    }
    map['thumbnail_id'] = _thumbnailId;
    map['image_ids'] = _imageIds;
    map['current_stock'] = _currentStock;
    map['minimum_order_quantity'] = _minimumOrderQuantity;
    map['stock_notification'] = _stockNotification;
    map['low_stock_to_notify'] = _lowStockToNotify;
    map['stock_visibility'] = _stockVisibility;
    map['total_sale'] = _totalSale;
    map['status'] = _status;
    map['is_approved'] = _isApproved;
    map['is_catalog'] = _isCatalog;
    map['external_link'] = _externalLink;
    map['is_featured'] = _isFeatured;
    map['is_classified'] = _isClassified;
    map['is_wholesale'] = _isWholesale;
    map['is_digital'] = _isDigital;
    map['is_refundable'] = _isRefundable;
    map['todays_deal'] = _todaysDeal;
    map['rating'] = _rating;
    map['viewed'] = _viewed;
    map['shipping_type'] = _shippingType;
    map['shipping_fee'] = _shippingFee;
    map['shipping_fee_depend_on_quantity'] = _shippingFeeDependOnQuantity;
    map['estimated_shipping_days'] = _estimatedShippingDays;
    map['cash_on_delivery'] = _cashOnDelivery;
    if (_metaImage != null) {
      map['meta_image'] = _metaImage?.toJson();
    }
    map['product_file'] = _productFile;
    map['product_file_id'] = _productFileId;
    map['meta_image_id'] = _metaImageId;
    map['reward'] = _reward;
    map['is_deleted'] = _isDeleted;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['product_name'] = _productName;
    map['image_190x230'] = _image190x230;
    map['image_40x40'] = _image40x40;
    map['image_72x72'] = _image72x72;
    map['image_110x122'] = _image110x122;
    map['special_discount_check'] = _specialDiscountCheck;
    map['discount_percentage'] = _discountPercentage;
    if (_productLanguages != null) {
      map['product_languages'] = _productLanguages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductLanguages {
  ProductLanguages({
      int? id, 
      String? productId, 
      String? lang, 
      String? name, 
      String? shortDescription, 
      String? description, 
      dynamic pdfSpecificationId, 
      String? tags, 
      String? unit, 
      String? metaTitle, 
      String? metaDescription, 
      String? metaKeywords, 
      String? createdAt, 
      String? updatedAt, 
      bool? specification,}){
    _id = id;
    _productId = productId;
    _lang = lang;
    _name = name;
    _shortDescription = shortDescription;
    _description = description;
    _pdfSpecificationId = pdfSpecificationId;
    _tags = tags;
    _unit = unit;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _metaKeywords = metaKeywords;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _specification = specification;
}

  ProductLanguages.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _lang = json['lang'];
    _name = json['name'];
    _shortDescription = json['short_description'];
    _description = json['description'];
    _pdfSpecificationId = json['pdf_specification_id'];
    _tags = json['tags'];
    _unit = json['unit'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaKeywords = json['meta_keywords'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _specification = json['specification'];
  }
  int? _id;
  String? _productId;
  String? _lang;
  String? _name;
  String? _shortDescription;
  String? _description;
  dynamic _pdfSpecificationId;
  String? _tags;
  String? _unit;
  String? _metaTitle;
  String? _metaDescription;
  String? _metaKeywords;
  String? _createdAt;
  String? _updatedAt;
  bool? _specification;

  int? get id => _id;
  String? get productId => _productId;
  String? get lang => _lang;
  String? get name => _name;
  String? get shortDescription => _shortDescription;
  String? get description => _description;
  dynamic get pdfSpecificationId => _pdfSpecificationId;
  String? get tags => _tags;
  String? get unit => _unit;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  String? get metaKeywords => _metaKeywords;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  bool? get specification => _specification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['lang'] = _lang;
    map['name'] = _name;
    map['short_description'] = _shortDescription;
    map['description'] = _description;
    map['pdf_specification_id'] = _pdfSpecificationId;
    map['tags'] = _tags;
    map['unit'] = _unit;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['meta_keywords'] = _metaKeywords;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['specification'] = _specification;
    return map;
  }

}

class MetaImage {
  MetaImage({
      String? storage, 
      String? originalImage, 
      String? image40x40, 
      String? image72x72, 
      String? image190x230, 
      String? image110x122, 
      String? image320x320, 
      String? imageThumbnail,}){
    _storage = storage;
    _originalImage = originalImage;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image190x230 = image190x230;
    _image110x122 = image110x122;
    _image320x320 = image320x320;
    _imageThumbnail = imageThumbnail;
}

  MetaImage.fromJson(dynamic json) {
    _storage = json['storage'];
    _originalImage = json['original_image'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image190x230 = json['image_190x230'];
    _image110x122 = json['image_110x122'];
    _image320x320 = json['image_320x320'];
    _imageThumbnail = json['image_thumbnail'];
  }
  String? _storage;
  String? _originalImage;
  String? _image40x40;
  String? _image72x72;
  String? _image190x230;
  String? _image110x122;
  String? _image320x320;
  String? _imageThumbnail;

  String? get storage => _storage;
  String? get originalImage => _originalImage;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image190x230 => _image190x230;
  String? get image110x122 => _image110x122;
  String? get image320x320 => _image320x320;
  String? get imageThumbnail => _imageThumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['storage'] = _storage;
    map['original_image'] = _originalImage;
    map['image_40x40'] = _image40x40;
    map['image_72x72'] = _image72x72;
    map['image_190x230'] = _image190x230;
    map['image_110x122'] = _image110x122;
    map['image_320x320'] = _image320x320;
    map['image_thumbnail'] = _imageThumbnail;
    return map;
  }

}
class Campaign {
  Campaign({
      int? id, 
      String? slug, 
      String? backgroundColor, 
      String? textColor, 
      String? bannerId, 
      Banner? banner, 
      Thumbnail? thumbnail, 
      String? thumbnailId, 
      String? startDate, 
      String? endDate, 
      String? status, 
      String? featured, 
      String? flashSale, 
      String? createdAt, 
      String? updatedAt, 
      String? title, 
      String? image1920x412, 
      String? image406x235, 
      String? image374x374, 
      String? shortDescription, 
      String? campaignStartDate, 
      String? campaignEndDate, 
      List<CurrentLanguage>? currentLanguage,}){
    _id = id;
    _slug = slug;
    _backgroundColor = backgroundColor;
    _textColor = textColor;
    _bannerId = bannerId;
    _banner = banner;
    _thumbnail = thumbnail;
    _thumbnailId = thumbnailId;
    _startDate = startDate;
    _endDate = endDate;
    _status = status;
    _featured = featured;
    _flashSale = flashSale;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _image1920x412 = image1920x412;
    _image406x235 = image406x235;
    _image374x374 = image374x374;
    _shortDescription = shortDescription;
    _campaignStartDate = campaignStartDate;
    _campaignEndDate = campaignEndDate;
    _currentLanguage = currentLanguage;
}

  Campaign.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _backgroundColor = json['background_color'];
    _textColor = json['text_color'];
    _bannerId = json['banner_id'];
    _banner = json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    _thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    _thumbnailId = json['thumbnail_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _status = json['status'];
    _featured = json['featured'];
    _flashSale = json['flash_sale'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _image1920x412 = json['image_1920x412'];
    _image406x235 = json['image_406x235'];
    _image374x374 = json['image_374x374'];
    _shortDescription = json['short_description'];
    _campaignStartDate = json['campaign_start_date'];
    _campaignEndDate = json['campaign_end_date'];
    if (json['current_language'] != null) {
      _currentLanguage = [];
      json['current_language'].forEach((v) {
        _currentLanguage?.add(CurrentLanguage.fromJson(v));
      });
    }
  }
  int? _id;
  String? _slug;
  String? _backgroundColor;
  String? _textColor;
  String? _bannerId;
  Banner? _banner;
  Thumbnail? _thumbnail;
  String? _thumbnailId;
  String? _startDate;
  String? _endDate;
  String? _status;
  String? _featured;
  String? _flashSale;
  String? _createdAt;
  String? _updatedAt;
  String? _title;
  String? _image1920x412;
  String? _image406x235;
  String? _image374x374;
  String? _shortDescription;
  String? _campaignStartDate;
  String? _campaignEndDate;
  List<CurrentLanguage>? _currentLanguage;

  int? get id => _id;
  String? get slug => _slug;
  String? get backgroundColor => _backgroundColor;
  String? get textColor => _textColor;
  String? get bannerId => _bannerId;
  Banner? get banner => _banner;
  Thumbnail? get thumbnail => _thumbnail;
  String? get thumbnailId => _thumbnailId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get status => _status;
  String? get featured => _featured;
  String? get flashSale => _flashSale;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get title => _title;
  String? get image1920x412 => _image1920x412;
  String? get image406x235 => _image406x235;
  String? get image374x374 => _image374x374;
  String? get shortDescription => _shortDescription;
  String? get campaignStartDate => _campaignStartDate;
  String? get campaignEndDate => _campaignEndDate;
  List<CurrentLanguage>? get currentLanguage => _currentLanguage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['background_color'] = _backgroundColor;
    map['text_color'] = _textColor;
    map['banner_id'] = _bannerId;
    if (_banner != null) {
      map['banner'] = _banner?.toJson();
    }
    if (_thumbnail != null) {
      map['thumbnail'] = _thumbnail?.toJson();
    }
    map['thumbnail_id'] = _thumbnailId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['status'] = _status;
    map['featured'] = _featured;
    map['flash_sale'] = _flashSale;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['image_1920x412'] = _image1920x412;
    map['image_406x235'] = _image406x235;
    map['image_374x374'] = _image374x374;
    map['short_description'] = _shortDescription;
    map['campaign_start_date'] = _campaignStartDate;
    map['campaign_end_date'] = _campaignEndDate;
    if (_currentLanguage != null) {
      map['current_language'] = _currentLanguage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrentLanguage {
  CurrentLanguage({
      int? id, 
      String? campaignId, 
      String? lang, 
      String? title, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _campaignId = campaignId;
    _lang = lang;
    _title = title;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CurrentLanguage.fromJson(dynamic json) {
    _id = json['id'];
    _campaignId = json['campaign_id'];
    _lang = json['lang'];
    _title = json['title'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _campaignId;
  String? _lang;
  String? _title;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get campaignId => _campaignId;
  String? get lang => _lang;
  String? get title => _title;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['campaign_id'] = _campaignId;
    map['lang'] = _lang;
    map['title'] = _title;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Thumbnail {
  Thumbnail({
      String? storage, 
      String? originalImage, 
      String? image40x40, 
      String? image72x72, 
      String? image190x230, 
      String? image110x122, 
      String? image320x320, 
      String? imageThumbnail, 
      String? image406x235, 
      String? image374x374,}){
    _storage = storage;
    _originalImage = originalImage;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image190x230 = image190x230;
    _image110x122 = image110x122;
    _image320x320 = image320x320;
    _imageThumbnail = imageThumbnail;
    _image406x235 = image406x235;
    _image374x374 = image374x374;
}

  Thumbnail.fromJson(dynamic json) {
    _storage = json['storage'];
    _originalImage = json['original_image'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image190x230 = json['image_190x230'];
    _image110x122 = json['image_110x122'];
    _image320x320 = json['image_320x320'];
    _imageThumbnail = json['image_thumbnail'];
    _image406x235 = json['image_406x235'];
    _image374x374 = json['image_374x374'];
  }
  String? _storage;
  String? _originalImage;
  String? _image40x40;
  String? _image72x72;
  String? _image190x230;
  String? _image110x122;
  String? _image320x320;
  String? _imageThumbnail;
  String? _image406x235;
  String? _image374x374;

  String? get storage => _storage;
  String? get originalImage => _originalImage;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image190x230 => _image190x230;
  String? get image110x122 => _image110x122;
  String? get image320x320 => _image320x320;
  String? get imageThumbnail => _imageThumbnail;
  String? get image406x235 => _image406x235;
  String? get image374x374 => _image374x374;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['storage'] = _storage;
    map['original_image'] = _originalImage;
    map['image_40x40'] = _image40x40;
    map['image_72x72'] = _image72x72;
    map['image_190x230'] = _image190x230;
    map['image_110x122'] = _image110x122;
    map['image_320x320'] = _image320x320;
    map['image_thumbnail'] = _imageThumbnail;
    map['image_406x235'] = _image406x235;
    map['image_374x374'] = _image374x374;
    return map;
  }

}

class Banner {
  Banner({
      String? storage, 
      String? originalImage, 
      String? image40x40, 
      String? image72x72, 
      String? image190x230, 
      String? image110x122, 
      String? image320x320, 
      String? imageThumbnail, 
      String? image1260x452, 
      String? image620x320, 
      String? image400x235, 
      String? image300x170, 
      String? image1905x464, 
      String? image1920x412,}){
    _storage = storage;
    _originalImage = originalImage;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image190x230 = image190x230;
    _image110x122 = image110x122;
    _image320x320 = image320x320;
    _imageThumbnail = imageThumbnail;
    _image1260x452 = image1260x452;
    _image620x320 = image620x320;
    _image400x235 = image400x235;
    _image300x170 = image300x170;
    _image1905x464 = image1905x464;
    _image1920x412 = image1920x412;
}

  Banner.fromJson(dynamic json) {
    _storage = json['storage'];
    _originalImage = json['original_image'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image190x230 = json['image_190x230'];
    _image110x122 = json['image_110x122'];
    _image320x320 = json['image_320x320'];
    _imageThumbnail = json['image_thumbnail'];
    _image1260x452 = json['image_1260x452'];
    _image620x320 = json['image_620x320'];
    _image400x235 = json['image_400x235'];
    _image300x170 = json['image_300x170'];
    _image1905x464 = json['image_1905x464'];
    _image1920x412 = json['image_1920x412'];
  }
  String? _storage;
  String? _originalImage;
  String? _image40x40;
  String? _image72x72;
  String? _image190x230;
  String? _image110x122;
  String? _image320x320;
  String? _imageThumbnail;
  String? _image1260x452;
  String? _image620x320;
  String? _image400x235;
  String? _image300x170;
  String? _image1905x464;
  String? _image1920x412;

  String? get storage => _storage;
  String? get originalImage => _originalImage;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image190x230 => _image190x230;
  String? get image110x122 => _image110x122;
  String? get image320x320 => _image320x320;
  String? get imageThumbnail => _imageThumbnail;
  String? get image1260x452 => _image1260x452;
  String? get image620x320 => _image620x320;
  String? get image400x235 => _image400x235;
  String? get image300x170 => _image300x170;
  String? get image1905x464 => _image1905x464;
  String? get image1920x412 => _image1920x412;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['storage'] = _storage;
    map['original_image'] = _originalImage;
    map['image_40x40'] = _image40x40;
    map['image_72x72'] = _image72x72;
    map['image_190x230'] = _image190x230;
    map['image_110x122'] = _image110x122;
    map['image_320x320'] = _image320x320;
    map['image_thumbnail'] = _imageThumbnail;
    map['image_1260x452'] = _image1260x452;
    map['image_620x320'] = _image620x320;
    map['image_400x235'] = _image400x235;
    map['image_300x170'] = _image300x170;
    map['image_1905x464'] = _image1905x464;
    map['image_1920x412'] = _image1920x412;
    return map;
  }

}