class CategoryModel {
  CategoryModel({
      List<Categories>? categories,}){
    _categories = categories;
}

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? _categories;

  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Categories {
  Categories({
      int? id, 
      String? parentId, 
      String? position, 
      String? slug, 
      String? commission, 
      String? status, 
      String? icon, 
      dynamic logoId, 
      dynamic bannerId, 
      String? createdAt, 
      String? updatedAt, 
      String? title, 
      String? image, 
      String? popularImage, 
      String? allPopularImage, 
      String? topImage, 
      String? headTitle, 
      String? headDescription, 
      List<CatLanguages>? catLanguages,}){
    _id = id;
    _parentId = parentId;
    _position = position;
    _slug = slug;
    _commission = commission;
    _status = status;
    _icon = icon;
    _logoId = logoId;
    _bannerId = bannerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _image = image;
    _popularImage = popularImage;
    _allPopularImage = allPopularImage;
    _topImage = topImage;
    _headTitle = headTitle;
    _headDescription = headDescription;
    _catLanguages = catLanguages;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _slug = json['slug'];
    _commission = json['commission'];
    _status = json['status'];
    _icon = json['icon'];
    _logoId = json['logo_id'];
    _bannerId = json['banner_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _image = json['image'];
    _popularImage = json['popular_image'];
    _allPopularImage = json['all_popular_image'];
    _topImage = json['top_image'];
    _headTitle = json['head_title'];
    _headDescription = json['head_description'];
    if (json['cat_languages'] != null) {
      _catLanguages = [];
      json['cat_languages'].forEach((v) {
        _catLanguages?.add(CatLanguages.fromJson(v));
      });
    }
  }
  int? _id;
  String? _parentId;
  String? _position;
  String? _slug;
  String? _commission;
  String? _status;
  String? _icon;
  dynamic _logoId;
  dynamic _bannerId;
  String? _createdAt;
  String? _updatedAt;
  String? _title;
  String? _image;
  String? _popularImage;
  String? _allPopularImage;
  String? _topImage;
  String? _headTitle;
  String? _headDescription;
  List<CatLanguages>? _catLanguages;

  int? get id => _id;
  String? get parentId => _parentId;
  String? get position => _position;
  String? get slug => _slug;
  String? get commission => _commission;
  String? get status => _status;
  String? get icon => _icon;
  dynamic get logoId => _logoId;
  dynamic get bannerId => _bannerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get title => _title;
  String? get image => _image;
  String? get popularImage => _popularImage;
  String? get allPopularImage => _allPopularImage;
  String? get topImage => _topImage;
  String? get headTitle => _headTitle;
  String? get headDescription => _headDescription;
  List<CatLanguages>? get catLanguages => _catLanguages;

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
    map['banner_id'] = _bannerId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['image'] = _image;
    map['popular_image'] = _popularImage;
    map['all_popular_image'] = _allPopularImage;
    map['top_image'] = _topImage;
    map['head_title'] = _headTitle;
    map['head_description'] = _headDescription;
    if (_catLanguages != null) {
      map['cat_languages'] = _catLanguages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CatLanguages {
  CatLanguages({
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

  CatLanguages.fromJson(dynamic json) {
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