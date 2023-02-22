import 'package:flutter/material.dart';
import 'package:lyiq_task/directpayment_screen.dart';

class Payment_page extends StatefulWidget {

  int newval;

  Payment_page(this.newval);

  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {

  @override
  double tot=0;
  void initState() {
    // TODO: implement initState
    super.initState();
    gst();
  }
  void gst(){
    double amount=((widget.newval)*18)/100;
    setState(() {
      tot=amount;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
        title: Text("Plans",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 20,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width: double.maxFinite,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Price details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("Total Amount",style: TextStyle(
                            fontWeight: FontWeight.w500,fontSize: 18,
                          ),),
                        Text("${widget.newval}",style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 18,
                        ),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GST",style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 18,
                        ),),
                        Text("${tot}",style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 18,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Divider(
              height: 30,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              color:Colors.grey,
              child: ListTile(
                leading: Text("Amount Payable :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                trailing: Text("${widget.newval+tot}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 20,),
            Divider(
              height: 30,
              color: Colors.red,
            ),
            Align(alignment: Alignment.bottomCenter,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                      backgroundColor: Colors.red,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Direct_Payment()),
                        );
                      },
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Make Payment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(width: 10,),
                          Icon(Icons.credit_card)
                        ],
                      )
                  ),
                  Text("${widget.newval+tot}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
