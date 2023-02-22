import 'package:flutter/material.dart';

class Direct_Payment extends StatefulWidget {
  const Direct_Payment({Key? key}) : super(key: key);

  @override
  State<Direct_Payment> createState() => _Direct_PaymentState();
}

class _Direct_PaymentState extends State<Direct_Payment> {

  List pay=["Debit card","UPI","Google Pay","Phone Pe"];
  List icn=["images/debit.png","images/upi1.png","images/GooglePay.png","images/PhonePe.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,
        title: Text("Direct Payment Gateway",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
    leading: IconButton(onPressed: (){
    Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,size: 20,color: Colors.white,)),
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: GridView.builder(
            shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: pay.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(onTap: (){

                },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: 70,width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("${icn[index]}"),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        Text("${pay[index]}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                );
              }),
        ),
        Align(alignment: Alignment.centerLeft,
            child: Text("Card Information",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black54),)),
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Card number',
          ),
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'MM/YY',
                ),
              ),
            ),
            SizedBox(width: 5,),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'CVV',
                ),
              ),
            ),
          ],
        ),
      ]
      ),
    ),
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.red,
          onPressed: (){},
        label: Text("Direct Pay",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white)),
      ),
    );
  }
}
