
const String _jsonKeyDashboardTotalOrders = 'total_orders';
const String _jsonKeyDashboardTotalSales = 'total_sales';
const String _jsonKeyDashboardTotalProducts = 'total_products';
const String _jsonKeyDashboardTotalCampaign = 'total_campaign';
const String _jsonKeyDashboardPendingOrders = 'pending_orders';
const String _jsonKeyDashboardProcessingOrders = 'processing_orders';
const String _jsonKeyDashboardDeliveredOrders = 'delivered_orders';
const String _jsonKeyDashboardOrderState = 'order_state';
const String _jsonKeyDashboardSalesState = 'sales_state';
const String _jsonKeyDashboardSalesStateMonth = 'month';
const String _jsonKeyDashboardSalesStateSales = 'sales';
class DashboardSalesState {

  String? month;
  int? sales;

  DashboardSalesState({
    this.month,
    this.sales,
  });
  DashboardSalesState.fromJson(Map<String, dynamic> json) {
    month = json[_jsonKeyDashboardSalesStateMonth]?.toString();
    sales = json[_jsonKeyDashboardSalesStateSales]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyDashboardSalesStateMonth] = month;
    data[_jsonKeyDashboardSalesStateSales] = sales;
    return data;
  }
}

const String _jsonKeyDashboardOrderStateMonth = 'month';
const String _jsonKeyDashboardOrderStateOrder = 'order';
class DashboardOrderState {

  String? month;
  int? order;

  DashboardOrderState({
    this.month,
    this.order,
  });
  DashboardOrderState.fromJson(Map<String, dynamic> json) {
    month = json[_jsonKeyDashboardOrderStateMonth]?.toString();
    order = json[_jsonKeyDashboardOrderStateOrder]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyDashboardOrderStateMonth] = month;
    data[_jsonKeyDashboardOrderStateOrder] = order;
    return data;
  }
}

class Dashboard {

  int? totalOrders;
  int? totalSales;
  int? totalProducts;
  int? totalCampaign;
  int? pendingOrders;
  int? processingOrders;
  int? deliveredOrders;
  List<DashboardOrderState?>? orderState;
  List<DashboardSalesState?>? salesState;

  Dashboard({
    this.totalOrders,
    this.totalSales,
    this.totalProducts,
    this.totalCampaign,
    this.pendingOrders,
    this.processingOrders,
    this.deliveredOrders,
    this.orderState,
    this.salesState,
  });
  Dashboard.fromJson(Map<String, dynamic> json) {
    totalOrders = json[_jsonKeyDashboardTotalOrders]?.toInt();
    totalSales = json[_jsonKeyDashboardTotalSales]?.toInt();
    totalProducts = json[_jsonKeyDashboardTotalProducts]?.toInt();
    totalCampaign = json[_jsonKeyDashboardTotalCampaign]?.toInt();
    pendingOrders = json[_jsonKeyDashboardPendingOrders]?.toInt();
    processingOrders = json[_jsonKeyDashboardProcessingOrders]?.toInt();
    deliveredOrders = json[_jsonKeyDashboardDeliveredOrders]?.toInt();
    if (json[_jsonKeyDashboardOrderState] != null) {
      final v = json[_jsonKeyDashboardOrderState];
      final arr0 = <DashboardOrderState>[];
      v.forEach((v) {
        arr0.add(DashboardOrderState.fromJson(v));
      });
      orderState = arr0;
    }
    if (json[_jsonKeyDashboardSalesState] != null) {
      final v = json[_jsonKeyDashboardSalesState];
      final arr0 = <DashboardSalesState>[];
      v.forEach((v) {
        arr0.add(DashboardSalesState.fromJson(v));
      });
      salesState = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyDashboardTotalOrders] = totalOrders;
    data[_jsonKeyDashboardTotalSales] = totalSales;
    data[_jsonKeyDashboardTotalProducts] = totalProducts;
    data[_jsonKeyDashboardTotalCampaign] = totalCampaign;
    data[_jsonKeyDashboardPendingOrders] = pendingOrders;
    data[_jsonKeyDashboardProcessingOrders] = processingOrders;
    data[_jsonKeyDashboardDeliveredOrders] = deliveredOrders;
    if (orderState != null) {
      final v = orderState;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data[_jsonKeyDashboardOrderState] = arr0;
    }
    if (salesState != null) {
      final v = salesState;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data[_jsonKeyDashboardSalesState] = arr0;
    }
    return data;
  }

static List<Map<String, dynamic>> toJsonList(List<Dashboard> modelList) {
    List<Map<String, dynamic>> _output = modelList.map<Map<String, dynamic>>((item) => item.toJson()).toList();
    return _output;
  }

  static List<Dashboard> fromJsonList(List<dynamic> jsonList) {
    List<Dashboard> _output = jsonList.map<Dashboard>((item) => Dashboard.fromJson(item)).toList();
    return _output;
  }
  //
  // factory Dashboard.fromJsonToData(String str) =>
  //     List<Dashboard>.from(json.decode(str).map((x)=> Dashboard.fromJson(x)).toList();

}
