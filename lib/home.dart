import 'package:flutter/material.dart';
import 'package:lyiq_task/model_class.dart';

import 'payment_screen.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  bool isChecked=false;
 // List num=[1,2,3,4,5,6,7,8,9];
 // List text=["45 days validity",
    /*"Instagram marketing of your property",
    "Top slot reserved for better search",
    "Rental agreement delivered to your home",
    "Privacy of your contact number",
    "Field assistant",
    "Professional photos of your property",
    "Rental representative on your behalf",
    "Relationship manager"
  ];*/
  //List plan=["Comfort","Comfort Pro","Premium","Premium Plus"];
 // List amount=["₹1599","₹3599","₹5599","₹6999"];

  final List details=[
    Data(txt: "Comfort",amount: 1599,benefits: [
      "45 days validity",
      "Instagram marketing of your property",
      "Top slot reserved for better search",
    ],name: "Comfort"),
    Data(txt: "Comfort Pro",amount: 3599,benefits: [
      "45 days validity",
      "Top slot reserved for better search",
      "Privacy of your contact number",
      "Field assistant",
      "Professional photos of your property",
    ],name: "Comfort Pro"),
    Data(txt: "Premium",amount: 5599,benefits: [
      "45 days validity",
      "Instagram marketing of your property",
      "Top slot reserved for better search",
      "Rental agreement delivered to your home",
      "Privacy of your contact number",
      "Rental representative on your behalf",
      "Relationship manager"
    ],name: "Premium"),
    Data(txt: "Premium Plus",amount: 6999,benefits: [
      "45 days validity",
      "Instagram marketing of your property",
      "Top slot reserved for better search",
      "Rental agreement delivered to your home",
      "Privacy of your contact number",
    ],name: "Premium Plus",num: [
      "1","2","3","4","5","6","7","8"
,"9"    ])
  ];

  int? value;
  List chosen=[];
  String s='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
        title: Text("Menu",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 20,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("Get Tenants Quicker",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              SizedBox(height: 10,),
              Container(
                width: double.maxFinite,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // implement GridView.builder
                  child: Column(
                    children: [
                      GridView.builder(shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,),
                          itemCount: details.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${details[index].txt}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                                  ListTile(
                                    trailing:  Text('₹${details[index].amount}', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    leading: Radio(
                                      value: index,
                                      groupValue: value,
                                      onChanged: (val) {
                                        value=val;
                                        setState(() {
                                         chosen=details[index].benefits;
                                         s=details[index].name;
                                        });
                                      },
                                    ),
                                  ),

                                ],
                              )
                            );
                          }
                          ),
                      ListTile(
                        leading: Text("+18% GST",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        trailing: Text("T&C Apply",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                    ],
                  ),
                ),
              ),

              Align(alignment: Alignment.centerLeft,
                  child: Text("Benefits Provided",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)),
              SizedBox(height: 10,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: chosen.length,
                itemBuilder: (context,index) {
                  return CheckboxListTile(
                    title: Text("${chosen[index]}",style: TextStyle(fontWeight: FontWeight.w500),),
                    value: isChecked ,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    secondary:  Container(
                      height: 20,
                      width: 20,
                      color: Colors.red,
                      child: Center(child: Text("#", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),)),
                    ),
                  );

                   /* Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.red,
                        child: Center(child: Text("${num[i]}", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),)),
                      ),
                      Checkbox(value: isChecked, onChanged: (bool? value){
                        setState(() {
                          isChecked=value!;
                        });
                      }
                      ),
                    ],
                  );*/

                }
              ),
              SizedBox(height: 30,),
              TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Payment_page(value!)),
                );
              },
                  child: Container(
                    height: 45,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Subscribe to ${s}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
