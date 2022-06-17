const String _jsonKeyShopTypeId = 'id';
const String _jsonKeyShopTypeName = 'name';
class ShopType {
  int? id;
  String? name;

  ShopType({
    this.id,
    this.name,
  });
  ShopType.fromJson(Map<String, dynamic> json) {
    id = json[_jsonKeyShopTypeId]?.toInt();
    name = json[_jsonKeyShopTypeName]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyShopTypeId] = id;
    data[_jsonKeyShopTypeName] = name;
    return data;
  }


  static List<Map> toJsonList(List<ShopType> modelList) {
    List<Map> _output = modelList.map<Map>((item) => item.toJson()).toList();
    return _output;
  }
}
