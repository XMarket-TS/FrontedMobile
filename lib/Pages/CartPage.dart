import 'package:flutter/material.dart';
import '../Globals.dart' as globals;
import 'package:auto_size_text/auto_size_text.dart';
import '../Colors.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double costo=0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(globals.listProductCard.length);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text("Cart", style: TextStyle(fontSize: size.height * 0.045),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: globals.listProductCard.length>0?Container(
            height: size.height,
            color: color1,
            // padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  height: size.height*0.6,
                  color: color1,
                  child: ListView.builder(
                    itemCount: globals.listProductCard.length,
                      itemBuilder: (context,index){
                      return Card(
                        color: color1,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.width * 0.3,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:  Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage(globals.listProductCard[index].imageUrl),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(width: size.width*0.08,),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.width*0.07,
                                    width: size.width*0.36,
                                    child: AutoSizeText(globals.listProductCard[index].productName,style: TextStyle(color: color2,fontSize: 30.0),
                                      maxLines: 1,
                                    ),
                                  ),
                                  // Text(globals.listProductCard[index].productName,style: TextStyle(color: color2,fontSize: size.width*0.05),),
                                  SizedBox(height: size.height*0.01,),
                                  Row(
                                    children: [
                                      Text("Cant. ",style: TextStyle(color: color5,fontSize: size.width*0.04),),
                                      Text(globals.listProductCard[index].unit.toString(),style: TextStyle(color: color4,fontSize: size.width*0.04),),
                                    ],
                                  ),
                                  // Text(globals.listProductCard[index].price.toString(),style: TextStyle(color: color5),),
                                  SizedBox(height: size.height*0.01,),
                                  Text("${globals.listProductCard[index].price.toString()} Bs",style: TextStyle(color: color3,fontSize: size.width*0.04),),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width*0.06,),
                            Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: size.width*0.1,
                                    width: size.width*0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: color2,
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      globals.listProductCard[index].unit++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: size.width*0.035,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: size.width*0.1,
                                    width: size.width*0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: color2,
                                    ),
                                    child: Icon(Icons.remove,color: Colors.white,),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      if(globals.listProductCard[index].unit>0){
                                        globals.listProductCard[index].unit--;
                                      }else if(globals.listProductCard[index].unit==0){
                                        globals.listProductCard.removeAt(index);
                                      }

                                    });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                      }
                  ),
                ),
                Container(
                  height: size.height*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight:Radius.circular(30.0),topLeft: Radius.circular(30.0)),
                    color: color7,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total:",style: TextStyle(color: Colors.white,fontSize: size.width*0.05),),
                          Text("${costoTotal(costo).toString()} Bs",style: TextStyle(color: color2,fontSize: size.width*0.05),),
                        ],
                      ),
                      SizedBox(height: size.width*0.04,),
                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          color: color2,
                          minWidth: size.width*0.65,
                          height: size.width*0.1,
                          child: Text("Comprar",style: TextStyle(color: Colors.white,fontSize: size.width*0.05),),
                          onPressed: (){}

                          ),
                    ],
                  ),
                ),
              ],
            ),
          ):Container(
            height: size.height-size.height*0.08,
            width: size.width,
            color: color1,
            child: Center(
              child: Container(
                  child: Text("  Usted no tiene ningún producto agregado  ",style: TextStyle(color: color2,fontSize: size.width*0.05),),
                ),
            ),
          )
      ),
    );
  }
}
double costoTotal(double costo){
  
  int taman=globals.listProductCard.length;
    for(int i=0;i<taman;i++){
      costo+=(globals.listProductCard[i].unit*globals.listProductCard[i].price);
    }
    return costo;
}
