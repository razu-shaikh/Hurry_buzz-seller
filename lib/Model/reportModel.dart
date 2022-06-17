class ReportModel {
  ReportModel({
      List<Reports>? reports,}){
    _reports = reports;
}

  ReportModel.fromJson(dynamic json) {
    if (json['reports'] != null) {
      _reports = [];
      json['reports'].forEach((v) {
        _reports?.add(Reports.fromJson(v));
      });
    }
  }
  List<Reports>? _reports;

  List<Reports>? get reports => _reports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_reports != null) {
      map['reports'] = _reports?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reports {
  Reports({
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
      String? ordersSumQuantity, 
      String? ordersSumPrice, 
      String? productName, 
      String? image190x230, 
      String? image40x40, 
      String? image72x72, 
      String? image110x122, 
      int? specialDiscountCheck, 
      int? discountPercentage, 
      Category? category, 
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
    _ordersSumQuantity = ordersSumQuantity;
    _ordersSumPrice = ordersSumPrice;
    _productName = productName;
    _image190x230 = image190x230;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image110x122 = image110x122;
    _specialDiscountCheck = specialDiscountCheck;
    _discountPercentage = discountPercentage;
    _category = category;
    _productLanguages = productLanguages;
}

  Reports.fromJson(dynamic json) {
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
    _ordersSumQuantity = json['orders_sum_quantity'];
    _ordersSumPrice = json['orders_sum_price'];
    _productName = json['product_name'];
    _image190x230 = json['image_190x230'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image110x122 = json['image_110x122'];
    _specialDiscountCheck = json['special_discount_check'];
    _discountPercentage = json['discount_percentage'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
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
  String? _ordersSumQuantity;
  String? _ordersSumPrice;
  String? _productName;
  String? _image190x230;
  String? _image40x40;
  String? _image72x72;
  String? _image110x122;
  int? _specialDiscountCheck;
  int? _discountPercentage;
  Category? _category;
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
  String? get ordersSumQuantity => _ordersSumQuantity;
  String? get ordersSumPrice => _ordersSumPrice;
  String? get productName => _productName;
  String? get image190x230 => _image190x230;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image110x122 => _image110x122;
  int? get specialDiscountCheck => _specialDiscountCheck;
  int? get discountPercentage => _discountPercentage;
  Category? get category => _category;
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
    map['orders_sum_quantity'] = _ordersSumQuantity;
    map['orders_sum_price'] = _ordersSumPrice;
    map['product_name'] = _productName;
    map['image_190x230'] = _image190x230;
    map['image_40x40'] = _image40x40;
    map['image_72x72'] = _image72x72;
    map['image_110x122'] = _image110x122;
    map['special_discount_check'] = _specialDiscountCheck;
    map['discount_percentage'] = _discountPercentage;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
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

class Category {
  Category({
      int? id, 
      dynamic parentId, 
      dynamic position, 
      String? slug, 
      String? commission, 
      String? status, 
      String? icon, 
      String? logoId, 
      Logo? logo, 
      String? bannerId, 
      Banner? banner, 
      String? createdAt, 
      String? updatedAt, 
      String? title, 
      String? image, 
      String? popularImage, 
      String? allPopularImage, 
      String? topImage, 
      String? headTitle, 
      String? headDescription, 
      List<CurrentLanguage>? currentLanguage,}){
    _id = id;
    _parentId = parentId;
    _position = position;
    _slug = slug;
    _commission = commission;
    _status = status;
    _icon = icon;
    _logoId = logoId;
    _logo = logo;
    _bannerId = bannerId;
    _banner = banner;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _image = image;
    _popularImage = popularImage;
    _allPopularImage = allPopularImage;
    _topImage = topImage;
    _headTitle = headTitle;
    _headDescription = headDescription;
    _currentLanguage = currentLanguage;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _slug = json['slug'];
    _commission = json['commission'];
    _status = json['status'];
    _icon = json['icon'];
    _logoId = json['logo_id'];
    _logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    _bannerId = json['banner_id'];
    _banner = json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _image = json['image'];
    _popularImage = json['popular_image'];
    _allPopularImage = json['all_popular_image'];
    _topImage = json['top_image'];
    _headTitle = json['head_title'];
    _headDescription = json['head_description'];
    if (json['current_language'] != null) {
      _currentLanguage = [];
      json['current_language'].forEach((v) {
        _currentLanguage?.add(CurrentLanguage.fromJson(v));
      });
    }
  }
  int? _id;
  dynamic _parentId;
  dynamic _position;
  String? _slug;
  String? _commission;
  String? _status;
  String? _icon;
  String? _logoId;
  Logo? _logo;
  String? _bannerId;
  Banner? _banner;
  String? _createdAt;
  String? _updatedAt;
  String? _title;
  String? _image;
  String? _popularImage;
  String? _allPopularImage;
  String? _topImage;
  String? _headTitle;
  String? _headDescription;
  List<CurrentLanguage>? _currentLanguage;

  int? get id => _id;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  String? get slug => _slug;
  String? get commission => _commission;
  String? get status => _status;
  String? get icon => _icon;
  String? get logoId => _logoId;
  Logo? get logo => _logo;
  String? get bannerId => _bannerId;
  Banner? get banner => _banner;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get title => _title;
  String? get image => _image;
  String? get popularImage => _popularImage;
  String? get allPopularImage => _allPopularImage;
  String? get topImage => _topImage;
  String? get headTitle => _headTitle;
  String? get headDescription => _headDescription;
  List<CurrentLanguage>? get currentLanguage => _currentLanguage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['position'] = _position;
    map['slug'] = _slug;
    map['commission'] = _commission;
    map['status'] = _status;
    map['icon'] = _icon;
    map['logo_id'] = _logoId;
    if (_logo != null) {
      map['logo'] = _logo?.toJson();
    }
    map['banner_id'] = _bannerId;
    if (_banner != null) {
      map['banner'] = _banner?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['image'] = _image;
    map['popular_image'] = _popularImage;
    map['all_popular_image'] = _allPopularImage;
    map['top_image'] = _topImage;
    map['head_title'] = _headTitle;
    map['head_description'] = _headDescription;
    if (_currentLanguage != null) {
      map['current_language'] = _currentLanguage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrentLanguage {
  CurrentLanguage({
      int? id, 
      String? categoryId, 
      String? lang, 
      String? title, 
      String? metaTitle, 
      String? metaDescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryId = categoryId;
    _lang = lang;
    _title = title;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CurrentLanguage.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _lang = json['lang'];
    _title = json['title'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _categoryId;
  String? _lang;
  String? _title;
  String? _metaTitle;
  String? _metaDescription;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get categoryId => _categoryId;
  String? get lang => _lang;
  String? get title => _title;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['lang'] = _lang;
    map['title'] = _title;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
      String? image835x200,}){
    _storage = storage;
    _originalImage = originalImage;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image190x230 = image190x230;
    _image110x122 = image110x122;
    _image320x320 = image320x320;
    _imageThumbnail = imageThumbnail;
    _image835x200 = image835x200;
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
    _image835x200 = json['image_835x200'];
  }
  String? _storage;
  String? _originalImage;
  String? _image40x40;
  String? _image72x72;
  String? _image190x230;
  String? _image110x122;
  String? _image320x320;
  String? _imageThumbnail;
  String? _image835x200;

  String? get storage => _storage;
  String? get originalImage => _originalImage;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image190x230 => _image190x230;
  String? get image110x122 => _image110x122;
  String? get image320x320 => _image320x320;
  String? get imageThumbnail => _imageThumbnail;
  String? get image835x200 => _image835x200;

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
    map['image_835x200'] = _image835x200;
    return map;
  }

}

class Logo {
  Logo({
      String? storage, 
      String? originalImage, 
      String? image40x40, 
      String? image72x72, 
      String? image190x230, 
      String? image110x122, 
      String? image320x320, 
      String? imageThumbnail, 
      String? image140x190, 
      String? image130x95, 
      String? image80x60,}){
    _storage = storage;
    _originalImage = originalImage;
    _image40x40 = image40x40;
    _image72x72 = image72x72;
    _image190x230 = image190x230;
    _image110x122 = image110x122;
    _image320x320 = image320x320;
    _imageThumbnail = imageThumbnail;
    _image140x190 = image140x190;
    _image130x95 = image130x95;
    _image80x60 = image80x60;
}

  Logo.fromJson(dynamic json) {
    _storage = json['storage'];
    _originalImage = json['original_image'];
    _image40x40 = json['image_40x40'];
    _image72x72 = json['image_72x72'];
    _image190x230 = json['image_190x230'];
    _image110x122 = json['image_110x122'];
    _image320x320 = json['image_320x320'];
    _imageThumbnail = json['image_thumbnail'];
    _image140x190 = json['image_140x190'];
    _image130x95 = json['image_130x95'];
    _image80x60 = json['image_80x60'];
  }
  String? _storage;
  String? _originalImage;
  String? _image40x40;
  String? _image72x72;
  String? _image190x230;
  String? _image110x122;
  String? _image320x320;
  String? _imageThumbnail;
  String? _image140x190;
  String? _image130x95;
  String? _image80x60;

  String? get storage => _storage;
  String? get originalImage => _originalImage;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image190x230 => _image190x230;
  String? get image110x122 => _image110x122;
  String? get image320x320 => _image320x320;
  String? get imageThumbnail => _imageThumbnail;
  String? get image140x190 => _image140x190;
  String? get image130x95 => _image130x95;
  String? get image80x60 => _image80x60;

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
    map['image_140x190'] = _image140x190;
    map['image_130x95'] = _image130x95;
    map['image_80x60'] = _image80x60;
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

class Thumbnail {
  Thumbnail({
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

  Thumbnail.fromJson(dynamic json) {
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