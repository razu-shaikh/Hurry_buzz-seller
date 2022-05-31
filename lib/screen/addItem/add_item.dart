import 'dart:io';

import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/widgets/costom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../notification/notification.dart';

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

  Widget bonntonNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String? title,
    IconData? iconData,
    Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
  var myType = AddressTypes.Home;
  PickedFile?imageFile= null;
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Add Item Details",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon:Image.asset("assets/notification.png",width: 25,height: 25,color: Colors.white,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: Color(0xff1ed9d9),
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Save Draft",
              onTap: () {
              }),
          bonntonNavigatorBar(
              backgroundColor: Color(0xff1749e2),
              color: Colors.white70,
              iconColor: Colors.white70,
              title: "Published",
              onTap: () {
              }),
        ],
      ),

      body:ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffd92e1e),
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(0),
                  child:( imageFile == null)?Text(""):Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                  padding:const EdgeInsets.only(bottom: 30,top: 30,left: 30),
                  child: Row(
                    children: [
                      Stack (
                        children: [
                          Container(
                            width:100,
                            height:100,
                            decoration: BoxDecoration(
                              color: Color(0xffd1ad17),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(2),
                              child:( imageFile == null)?Text(""):Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25,top: 25),
                            child:Align(
                              alignment: Alignment.center,
                              child:IconButton(onPressed: (){
                                _showChoiceDialog(context);
                              },
                                icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                            ) ,
                          )


                        ],

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,top: 80),
                        child:Align(
                          alignment: Alignment.center,
                          child:IconButton(onPressed: (){
                            _showChoiceDialog(context);
                          },
                            icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                        ) ,
                      )

                    ],
                  ),
                ),
            ],
          ),
         Text("Basic Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter product Name',
                hintText: 'Product Name',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Center(
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Slug',
                hintText: 'Slug',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Stock',
                    hintText: 'Stock',
                  ),
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unit KG',
                    hintText: 'KG',
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unit Price',
                    hintText: 'Price',
                  ),
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Minimum Order',
                    hintText: 'Order',
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  labelText: 'Product Description',// <-- SEE HERE
                ),
                maxLines: 5, // <-- SEE HERE
                minLines: 1,
              )
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Product Discount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Discount Period",
                hintText: 'Time',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Other Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
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
    );
  }

  /// Get from gallery
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
}