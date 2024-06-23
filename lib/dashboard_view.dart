import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue4 = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(size.width, size.height * 0.1), child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/menu.png',height: size.height * 0.06,width: size.width * 0.06,fit: BoxFit.cover,),
              Image.asset('assets/icons/person.png',height: size.height * 0.06,width: size.width * 0.06,fit: BoxFit.cover,),
            ],
          ),
        )),
        body: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back'),
              SizedBox(height: 10.0),
              Text('N A F E E S',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0),
              Divider(),
              SizedBox(height: 10.0),
              Text('Smart Devices',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 20.0),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                  children: [
                    myCard(_switchValue1?'assets/icons/light_white.png':'assets/icons/light_black.png', 'Smart Light',_switchValue1,(newValue){
                      setState(() {
                        _switchValue1 = newValue;
                      });
                    }),
                    myCard(_switchValue2?'assets/icons/tv_white.png':'assets/icons/tv_black.png', 'Smart TV',_switchValue2,(newValue){
                      setState(() {
                        _switchValue2 = newValue;
                      });
                    }),
                    myCard(_switchValue3?'assets/icons/ac_white.png':'assets/icons/ac_black.png', 'Smart AC',_switchValue3,(newValue){
                      setState(() {
                        _switchValue3 = newValue;
                      });
                    }),
                    myCard(_switchValue4?'assets/icons/fan_white.png':'assets/icons/fan_black.png', 'Smart Fan',_switchValue4,(newValue){
                      setState(() {
                        _switchValue4 = newValue;
                      });
                    }),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget myCard(String url,String title,bool value,Function(bool newValue) onChanged){
    final size = MediaQuery.of(context).size;
    return Card(
      color: value? Colors.black : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(url,height: size.height * 0.06,width: size.height * 0.06,fit: BoxFit.cover,),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(color: value? Colors.white : null),),
              RotatedBox(
                quarterTurns: 1,
                child: Switch(
                  splashRadius: 50.0,
                    value: value,
                  onChanged: onChanged
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
