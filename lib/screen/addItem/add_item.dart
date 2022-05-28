import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/widgets/costom_text_field.dart';
import 'package:flutter/material.dart';

class AddItemDetails extends StatefulWidget {
  const AddItemDetails({Key? key}) : super(key: key);

  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddItemDetails> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Item Details",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
          child:Center(
            child: Text(
              "Add Item",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
         ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
             // controller: checkoutProvider.firstName,
            ),
            CostomTextField(
              labText: "Last name",
              //controller: checkoutProvider.lastName,
            ),
            CostomTextField(
              labText: "Mobile No",
             // controller: checkoutProvider.mobileNo,
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
              //controller: checkoutProvider.alternateMobileNo,
            ),
            CostomTextField(
              labText: "Scoiety",
             // controller: checkoutProvider.scoiety,
            ),
            CostomTextField(
              labText: "Street",
             // controller: checkoutProvider.street,
            ),
            CostomTextField(
              labText: "Landmark",
              //controller: checkoutProvider.landmark,
            ),
            CostomTextField(
              labText: "City",
              //controller: checkoutProvider.city,
            ),
            CostomTextField(
              labText: "Area",
              //controller: checkoutProvider.aera,
            ),
            CostomTextField(
              labText: "PinCode",
              //controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //checkoutProvider.setLoaction == null? Text("Set Location"):
                    Text("Done!"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}