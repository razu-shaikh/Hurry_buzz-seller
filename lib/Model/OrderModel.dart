class OrderModel {
  OrderModel({
      List<Orders>? orders,}){
    _orders = orders;
}

  OrderModel.fromJson(dynamic json) {
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? _orders;

  List<Orders>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Orders {
  Orders({
      int? id, 
      String? sellerId, 
      String? userId, 
      String? deliveryHeroId, 
      BillingAddress? billingAddress, 
      ShippingAddress? shippingAddress, 
      String? deliveryStatus, 
      String? paymentType, 
      String? paymentStatus, 
      String? subTotal, 
      String? discount, 
      String? couponDiscount, 
      String? totalTax, 
      String? totalAmount, 
      String? shippingCost, 
      String? totalPayable, 
      String? code, 
      String? date, 
      String? viewed, 
      String? deliveryViewed, 
      String? paymentStatusViewed, 
      String? commissionCalculated, 
      String? isCancelled, 
      String? isDeleted, 
      String? trxId, 
      String? isMailed, 
      String? offlineMethodId, 
      String? offlineMethodFile, 
      String? status, 
      String? pickupHubId, 
      String? cancelRequest, 
      String? cancelRequestAt, 
      String? deliveryHeroAssignAt, 
      String? createdBy, 
      String? createdAt, 
      String? updatedAt, 
      String? orderDate, 
      String? deliveredDays, 
      List<OrderDetails>? orderDetails, 
      String? deliveredAt,}){
    _id = id;
    _sellerId = sellerId;
    _userId = userId;
    _deliveryHeroId = deliveryHeroId;
    _billingAddress = billingAddress;
    _shippingAddress = shippingAddress;
    _deliveryStatus = deliveryStatus;
    _paymentType = paymentType;
    _paymentStatus = paymentStatus;
    _subTotal = subTotal;
    _discount = discount;
    _couponDiscount = couponDiscount;
    _totalTax = totalTax;
    _totalAmount = totalAmount;
    _shippingCost = shippingCost;
    _totalPayable = totalPayable;
    _code = code;
    _date = date;
    _viewed = viewed;
    _deliveryViewed = deliveryViewed;
    _paymentStatusViewed = paymentStatusViewed;
    _commissionCalculated = commissionCalculated;
    _isCancelled = isCancelled;
    _isDeleted = isDeleted;
    _trxId = trxId;
    _isMailed = isMailed;
    _offlineMethodId = offlineMethodId;
    _offlineMethodFile = offlineMethodFile;
    _status = status;
    _pickupHubId = pickupHubId;
    _cancelRequest = cancelRequest;
    _cancelRequestAt = cancelRequestAt;
    _deliveryHeroAssignAt = deliveryHeroAssignAt;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderDate = orderDate;
    _deliveredDays = deliveredDays;
    _orderDetails = orderDetails;
    _deliveredAt = deliveredAt;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _sellerId = json['seller_id'];
    _userId = json['user_id'];
    _deliveryHeroId = json['delivery_hero_id'];
    _billingAddress = json['billing_address'] != null ? BillingAddress.fromJson(json['billing_address']) : null;
    _shippingAddress = json['shipping_address'] != null ? ShippingAddress.fromJson(json['shipping_address']) : null;
    _deliveryStatus = json['delivery_status'];
    _paymentType = json['payment_type'];
    _paymentStatus = json['payment_status'];
    _subTotal = json['sub_total'];
    _discount = json['discount'];
    _couponDiscount = json['coupon_discount'];
    _totalTax = json['total_tax'];
    _totalAmount = json['total_amount'];
    _shippingCost = json['shipping_cost'];
    _totalPayable = json['total_payable'];
    _code = json['code'];
    _date = json['date'];
    _viewed = json['viewed'];
    _deliveryViewed = json['delivery_viewed'];
    _paymentStatusViewed = json['payment_status_viewed'];
    _commissionCalculated = json['commission_calculated'];
    _isCancelled = json['is_cancelled'];
    _isDeleted = json['is_deleted'];
    _trxId = json['trx_id'];
    _isMailed = json['is_mailed'];
    _offlineMethodId = json['offline_method_id'];
    _offlineMethodFile = json['offline_method_file'];
    _status = json['status'];
    _pickupHubId = json['pickup_hub_id'];
    _cancelRequest = json['cancel_request'];
    _cancelRequestAt = json['cancel_request_at'];
    _deliveryHeroAssignAt = json['delivery_hero_assign_at'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _orderDate = json['order_date'];
    _deliveredDays = json['delivered_days'];
    if (json['order_details'] != null) {
      _orderDetails = [];
      json['order_details'].forEach((v) {
        _orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
    _deliveredAt = json['delivered_at'];
  }
  int? _id;
  String? _sellerId;
  String? _userId;
  String? _deliveryHeroId;
  BillingAddress? _billingAddress;
  ShippingAddress? _shippingAddress;
  String? _deliveryStatus;
  String? _paymentType;
  String? _paymentStatus;
  String? _subTotal;
  String? _discount;
  String? _couponDiscount;
  String? _totalTax;
  String? _totalAmount;
  String? _shippingCost;
  String? _totalPayable;
  String? _code;
  String? _date;
  String? _viewed;
  String? _deliveryViewed;
  String? _paymentStatusViewed;
  String? _commissionCalculated;
  String? _isCancelled;
  String? _isDeleted;
  String? _trxId;
  String? _isMailed;
  String? _offlineMethodId;
  String? _offlineMethodFile;
  String? _status;
  String? _pickupHubId;
  String? _cancelRequest;
  String? _cancelRequestAt;
  String? _deliveryHeroAssignAt;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  String? _orderDate;
  String? _deliveredDays;
  List<OrderDetails>? _orderDetails;
  String? _deliveredAt;

  int? get id => _id;
  String? get sellerId => _sellerId;
  String? get userId => _userId;
  String? get deliveryHeroId => _deliveryHeroId;
  BillingAddress? get billingAddress => _billingAddress;
  ShippingAddress? get shippingAddress => _shippingAddress;
  String? get deliveryStatus => _deliveryStatus;
  String? get paymentType => _paymentType;
  String? get paymentStatus => _paymentStatus;
  String? get subTotal => _subTotal;
  String? get discount => _discount;
  String? get couponDiscount => _couponDiscount;
  String? get totalTax => _totalTax;
  String? get totalAmount => _totalAmount;
  String? get shippingCost => _shippingCost;
  String? get totalPayable => _totalPayable;
  String? get code => _code;
  String? get date => _date;
  String? get viewed => _viewed;
  String? get deliveryViewed => _deliveryViewed;
  String? get paymentStatusViewed => _paymentStatusViewed;
  String? get commissionCalculated => _commissionCalculated;
  String? get isCancelled => _isCancelled;
  String? get isDeleted => _isDeleted;
  String? get trxId => _trxId;
  String? get isMailed => _isMailed;
  String? get offlineMethodId => _offlineMethodId;
  String? get offlineMethodFile => _offlineMethodFile;
  String? get status => _status;
  String? get pickupHubId => _pickupHubId;
  String? get cancelRequest => _cancelRequest;
  String? get cancelRequestAt => _cancelRequestAt;
  String? get deliveryHeroAssignAt => _deliveryHeroAssignAt;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get orderDate => _orderDate;
  String? get deliveredDays => _deliveredDays;
  List<OrderDetails>? get orderDetails => _orderDetails;
  String? get deliveredAt => _deliveredAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_id'] = _sellerId;
    map['user_id'] = _userId;
    map['delivery_hero_id'] = _deliveryHeroId;
    if (_billingAddress != null) {
      map['billing_address'] = _billingAddress?.toJson();
    }
    if (_shippingAddress != null) {
      map['shipping_address'] = _shippingAddress?.toJson();
    }
    map['delivery_status'] = _deliveryStatus;
    map['payment_type'] = _paymentType;
    map['payment_status'] = _paymentStatus;
    map['sub_total'] = _subTotal;
    map['discount'] = _discount;
    map['coupon_discount'] = _couponDiscount;
    map['total_tax'] = _totalTax;
    map['total_amount'] = _totalAmount;
    map['shipping_cost'] = _shippingCost;
    map['total_payable'] = _totalPayable;
    map['code'] = _code;
    map['date'] = _date;
    map['viewed'] = _viewed;
    map['delivery_viewed'] = _deliveryViewed;
    map['payment_status_viewed'] = _paymentStatusViewed;
    map['commission_calculated'] = _commissionCalculated;
    map['is_cancelled'] = _isCancelled;
    map['is_deleted'] = _isDeleted;
    map['trx_id'] = _trxId;
    map['is_mailed'] = _isMailed;
    map['offline_method_id'] = _offlineMethodId;
    map['offline_method_file'] = _offlineMethodFile;
    map['status'] = _status;
    map['pickup_hub_id'] = _pickupHubId;
    map['cancel_request'] = _cancelRequest;
    map['cancel_request_at'] = _cancelRequestAt;
    map['delivery_hero_assign_at'] = _deliveryHeroAssignAt;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['order_date'] = _orderDate;
    map['delivered_days'] = _deliveredDays;
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails?.map((v) => v.toJson()).toList();
    }
    map['delivered_at'] = _deliveredAt;
    return map;
  }

}

class OrderDetails {
  OrderDetails({
      int? id, 
      String? orderId, 
      String? productId, 
      String? variation, 
      String? price, 
      String? tax, 
      String? discount, 
      CouponDiscount? couponDiscount, 
      ShippingCost? shippingCost, 
      String? quantity, 
      String? pickupHubId, 
      String? productReferralCode, 
      String? isRefundable, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _variation = variation;
    _price = price;
    _tax = tax;
    _discount = discount;
    _couponDiscount = couponDiscount;
    _shippingCost = shippingCost;
    _quantity = quantity;
    _pickupHubId = pickupHubId;
    _productReferralCode = productReferralCode;
    _isRefundable = isRefundable;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _variation = json['variation'];
    _price = json['price'];
    _tax = json['tax'];
    _discount = json['discount'];
    _couponDiscount = json['coupon_discount'] != null ? CouponDiscount.fromJson(json['coupon_discount']) : null;
    _shippingCost = json['shipping_cost'] != null ? ShippingCost.fromJson(json['shipping_cost']) : null;
    _quantity = json['quantity'];
    _pickupHubId = json['pickup_hub_id'];
    _productReferralCode = json['product_referral_code'];
    _isRefundable = json['is_refundable'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? _id;
  String? _orderId;
  String? _productId;
  String? _variation;
  String? _price;
  String? _tax;
  String? _discount;
  CouponDiscount? _couponDiscount;
  ShippingCost? _shippingCost;
  String? _quantity;
  String? _pickupHubId;
  String? _productReferralCode;
  String? _isRefundable;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;

  int? get id => _id;
  String? get orderId => _orderId;
  String? get productId => _productId;
  String? get variation => _variation;
  String? get price => _price;
  String? get tax => _tax;
  String? get discount => _discount;
  CouponDiscount? get couponDiscount => _couponDiscount;
  ShippingCost? get shippingCost => _shippingCost;
  String? get quantity => _quantity;
  String? get pickupHubId => _pickupHubId;
  String? get productReferralCode => _productReferralCode;
  String? get isRefundable => _isRefundable;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['variation'] = _variation;
    map['price'] = _price;
    map['tax'] = _tax;
    map['discount'] = _discount;
    if (_couponDiscount != null) {
      map['coupon_discount'] = _couponDiscount?.toJson();
    }
    if (_shippingCost != null) {
      map['shipping_cost'] = _shippingCost?.toJson();
    }
    map['quantity'] = _quantity;
    map['pickup_hub_id'] = _pickupHubId;
    map['product_referral_code'] = _productReferralCode;
    map['is_refundable'] = _isRefundable;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
      String? videoProvider, 
      String? videoUrl, 
      List<String>? colors, 
      List<String>? attributeSets, 
      String? vatTaxes, 
      String? hasVariant, 
      Thumbnail? thumbnail, 
      List<Images>? images, 
      String? thumbnailId, 
      String? imageIds, 
      String? currentStock, 
      String? minimumOrderQuantity, 
      String? stockNotification, 
      String? lowStockToNotify, 
      String? stockVisibility, 
      String? totalSale, 
      String? status, 
      String? isApproved, 
      String? isCatalog, 
      String? externalLink, 
      String? isFeatured, 
      String? isClassified, 
      String? isWholesale, 
      String? isDigital, 
      String? isRefundable, 
      String? todaysDeal, 
      int? rating, 
      String? viewed, 
      String? shippingType, 
      String? shippingFee, 
      String? shippingFeeDependOnQuantity, 
      String? estimatedShippingDays, 
      String? cashOnDelivery, 
      MetaImage? metaImage, 
      String? productFile, 
      String? productFileId, 
      String? metaImageId, 
      String? reward, 
      String? isDeleted, 
      String? deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? productName, 
      String? image190x230, 
      String? image40x40, 
      String? image72x72, 
      String? image110x122, 
      int? specialDiscountCheck, 
      int? discountPercentage, 
      List<CurrentLanguage>? currentLanguage,}){
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
    _colors = colors;
    _attributeSets = attributeSets;
    _vatTaxes = vatTaxes;
    _hasVariant = hasVariant;
    _thumbnail = thumbnail;
    _images = images;
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
    _currentLanguage = currentLanguage;
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
    _colors = json['colors'] != null ? json['colors'].cast<String>() : [];
    _attributeSets = json['attribute_sets'] != null ? json['attribute_sets'].cast<String>() : [];
    _vatTaxes = json['vat_taxes'];
    _hasVariant = json['has_variant'];
    //_thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
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
    //_metaImage = json['meta_image'] != null ? MetaImage.fromJson(json['meta_image']) : null;
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
    if (json['current_language'] != null) {
      _currentLanguage = [];
      json['current_language'].forEach((v) {
        _currentLanguage?.add(CurrentLanguage.fromJson(v));
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
  String? _videoProvider;
  String? _videoUrl;
  List<String>? _colors;
  List<String>? _attributeSets;
  String? _vatTaxes;
  String? _hasVariant;
  Thumbnail? _thumbnail;
  List<Images>? _images;
  String? _thumbnailId;
  String? _imageIds;
  String? _currentStock;
  String? _minimumOrderQuantity;
  String? _stockNotification;
  String? _lowStockToNotify;
  String? _stockVisibility;
  String? _totalSale;
  String? _status;
  String? _isApproved;
  String? _isCatalog;
  String? _externalLink;
  String? _isFeatured;
  String? _isClassified;
  String? _isWholesale;
  String? _isDigital;
  String? _isRefundable;
  String? _todaysDeal;
  int? _rating;
  String? _viewed;
  String? _shippingType;
  String? _shippingFee;
  String? _shippingFeeDependOnQuantity;
  String? _estimatedShippingDays;
  String? _cashOnDelivery;
  MetaImage? _metaImage;
  String? _productFile;
  String? _productFileId;
  String? _metaImageId;
  String? _reward;
  String? _isDeleted;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _productName;
  String? _image190x230;
  String? _image40x40;
  String? _image72x72;
  String? _image110x122;
  dynamic _specialDiscountCheck;
  int? _discountPercentage;
  List<CurrentLanguage>? _currentLanguage;

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
  String? get videoProvider => _videoProvider;
  String? get videoUrl => _videoUrl;
  List<String>? get colors => _colors;
  List<String>? get attributeSets => _attributeSets;
  String? get vatTaxes => _vatTaxes;
  String? get hasVariant => _hasVariant;
  Thumbnail? get thumbnail => _thumbnail;
  List<Images>? get images => _images;
  String? get thumbnailId => _thumbnailId;
  String? get imageIds => _imageIds;
  String? get currentStock => _currentStock;
  String? get minimumOrderQuantity => _minimumOrderQuantity;
  String? get stockNotification => _stockNotification;
  String? get lowStockToNotify => _lowStockToNotify;
  String? get stockVisibility => _stockVisibility;
  String? get totalSale => _totalSale;
  String? get status => _status;
  String? get isApproved => _isApproved;
  String? get isCatalog => _isCatalog;
  String? get externalLink => _externalLink;
  String? get isFeatured => _isFeatured;
  String? get isClassified => _isClassified;
  String? get isWholesale => _isWholesale;
  String? get isDigital => _isDigital;
  String? get isRefundable => _isRefundable;
  String? get todaysDeal => _todaysDeal;
  int? get rating => _rating;
  String? get viewed => _viewed;
  String? get shippingType => _shippingType;
  String? get shippingFee => _shippingFee;
  String? get shippingFeeDependOnQuantity => _shippingFeeDependOnQuantity;
  String? get estimatedShippingDays => _estimatedShippingDays;
  String? get cashOnDelivery => _cashOnDelivery;
  MetaImage? get metaImage => _metaImage;
  String? get productFile => _productFile;
  String? get productFileId => _productFileId;
  String? get metaImageId => _metaImageId;
  String? get reward => _reward;
  String? get isDeleted => _isDeleted;
  String? get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get productName => _productName;
  String? get image190x230 => _image190x230;
  String? get image40x40 => _image40x40;
  String? get image72x72 => _image72x72;
  String? get image110x122 => _image110x122;
  int? get specialDiscountCheck => _specialDiscountCheck;
  int? get discountPercentage => _discountPercentage;
  List<CurrentLanguage>? get currentLanguage => _currentLanguage;

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
    map['colors'] = _colors;
    map['attribute_sets'] = _attributeSets;
    map['vat_taxes'] = _vatTaxes;
    map['has_variant'] = _hasVariant;
    if (_thumbnail != null) {
      map['thumbnail'] = _thumbnail?.toJson();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
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
    if (_currentLanguage != null) {
      map['current_language'] = _currentLanguage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrentLanguage {
  CurrentLanguage({
      int? id, 
      String? productId, 
      String? lang, 
      String? name, 
      String? shortDescription, 
      String? description, 
      String? pdfSpecificationId, 
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

  CurrentLanguage.fromJson(dynamic json) {
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
  String? _pdfSpecificationId;
  String? _tags;
  String? _unit;
  String? _metaTitle;
  String? _metaDescription;
  String? _metaKeywords;
  String? _createdAt;
  String? _updatedAt;
  dynamic _specification;

  int? get id => _id;
  String? get productId => _productId;
  String? get lang => _lang;
  String? get name => _name;
  String? get shortDescription => _shortDescription;
  String? get description => _description;
  String? get pdfSpecificationId => _pdfSpecificationId;
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

class Images {
  Images({
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

  Images.fromJson(dynamic json) {
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
      dynamic storage,
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
  dynamic _storage;
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

class ShippingCost {
  ShippingCost({
      String? type, 
      int? dependOnQuantity, 
      int? perCost, 
      int? totalCost,}){
    _type = type;
    _dependOnQuantity = dependOnQuantity;
    _perCost = perCost;
    _totalCost = totalCost;
}

  ShippingCost.fromJson(dynamic json) {
    _type = json['type'];
    _dependOnQuantity = json['depend_on_quantity'];
    _perCost = json['per_cost'];
    _totalCost = json['total_cost'];
  }
  String? _type;
  int? _dependOnQuantity;
  int? _perCost;
  int? _totalCost;

  String? get type => _type;
  int? get dependOnQuantity => _dependOnQuantity;
  int? get perCost => _perCost;
  int? get totalCost => _totalCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['depend_on_quantity'] = _dependOnQuantity;
    map['per_cost'] = _perCost;
    map['total_cost'] = _totalCost;
    return map;
  }

}

class CouponDiscount {
  CouponDiscount({
      String? code, 
      int? discount,}){
    _code = code;
    _discount = discount;
}

  CouponDiscount.fromJson(dynamic json) {
    _code = json['code'];
    _discount = json['discount'];
  }
  String? _code;
  int? _discount;

  String? get code => _code;
  int? get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['discount'] = _discount;
    return map;
  }

}

class ShippingAddress {
  ShippingAddress({
      String? id, 
      String? userId, 
      String? name, 
      String? email, 
      String? phoneNo, 
      String? address, 
      AddressIds? addressIds, 
      String? country, 
      String? state, 
      String? city, 
      String? latitude, 
      String? longitude, 
      String? postalCode, 
      String? defaultShipping, 
      String? defaultBilling, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _phoneNo = phoneNo;
    _address = address;
    _addressIds = addressIds;
    _country = country;
    _state = state;
    _city = city;
    _latitude = latitude;
    _longitude = longitude;
    _postalCode = postalCode;
    _defaultShipping = defaultShipping;
    _defaultBilling = defaultBilling;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ShippingAddress.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _phoneNo = json['phone_no'];
    _address = json['address'];
    _addressIds = json['address_ids'] != null ? AddressIds.fromJson(json['address_ids']) : null;
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _postalCode = json['postal_code'];
    _defaultShipping = json['default_shipping'];
    _defaultBilling = json['default_billing'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _userId;
  String? _name;
  String? _email;
  String? _phoneNo;
  String? _address;
  AddressIds? _addressIds;
  String? _country;
  String? _state;
  String? _city;
  String? _latitude;
  String? _longitude;
  String? _postalCode;
  String? _defaultShipping;
  String? _defaultBilling;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get address => _address;
  AddressIds? get addressIds => _addressIds;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get postalCode => _postalCode;
  String? get defaultShipping => _defaultShipping;
  String? get defaultBilling => _defaultBilling;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['phone_no'] = _phoneNo;
    map['address'] = _address;
    if (_addressIds != null) {
      map['address_ids'] = _addressIds?.toJson();
    }
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['postal_code'] = _postalCode;
    map['default_shipping'] = _defaultShipping;
    map['default_billing'] = _defaultBilling;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class AddressIds {
  AddressIds({
      String? countryId, 
      String? stateId, 
      String? cityId,}){
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
}

  AddressIds.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
  }
  String? _countryId;
  String? _stateId;
  String? _cityId;

  String? get countryId => _countryId;
  String? get stateId => _stateId;
  String? get cityId => _cityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    return map;
  }

}

class BillingAddress {
  BillingAddress({
      String? id, 
      String? userId, 
      String? name, 
      String? email, 
      String? phoneNo, 
      String? address, 
      AddressIds? addressIds, 
      String? country, 
      String? state, 
      String? city, 
      String? latitude, 
      String? longitude, 
      String? postalCode, 
      String? defaultShipping, 
      String? defaultBilling, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _phoneNo = phoneNo;
    _address = address;
    _addressIds = addressIds;
    _country = country;
    _state = state;
    _city = city;
    _latitude = latitude;
    _longitude = longitude;
    _postalCode = postalCode;
    _defaultShipping = defaultShipping;
    _defaultBilling = defaultBilling;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  BillingAddress.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _phoneNo = json['phone_no'];
    _address = json['address'];
    _addressIds = json['address_ids'] != null ? AddressIds.fromJson(json['address_ids']) : null;
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _postalCode = json['postal_code'];
    _defaultShipping = json['default_shipping'];
    _defaultBilling = json['default_billing'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _userId;
  String? _name;
  String? _email;
  String? _phoneNo;
  String? _address;
  AddressIds? _addressIds;
  String? _country;
  String? _state;
  String? _city;
  String? _latitude;
  String? _longitude;
  String? _postalCode;
  String? _defaultShipping;
  String? _defaultBilling;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get address => _address;
  AddressIds? get addressIds => _addressIds;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get postalCode => _postalCode;
  String? get defaultShipping => _defaultShipping;
  String? get defaultBilling => _defaultBilling;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['phone_no'] = _phoneNo;
    map['address'] = _address;
    if (_addressIds != null) {
      map['address_ids'] = _addressIds?.toJson();
    }
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['postal_code'] = _postalCode;
    map['default_shipping'] = _defaultShipping;
    map['default_billing'] = _defaultBilling;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}