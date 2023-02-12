import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wire_production_calculator/wire_size_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Controllers and Variables
  final TextEditingController _wire_size_in_mm = TextEditingController();
  final TextEditingController _speed_metre_minute = TextEditingController();
  final TextEditingController _number_of_wires = TextEditingController();
  final TextEditingController _efficiency_percentage = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late var output = '';

  // Function to launch website in browser
  Future<void> _launchWebsite(String url) async{
    final Uri uri = Uri(scheme: "https",host: url);
    if(!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
    ))
      {
        throw "Can not launch the Website";
      }
  }


  // Function to calculate production
  calculate() async{
    final a = double.parse(_wire_size_in_mm.text);
    final b = double.parse(_speed_metre_minute.text);
    final c  = double.parse(_number_of_wires.text);
    final toPerDay = 1440;  // 60 * 24
    final e = double.parse(_efficiency_percentage.text);
    final double d = 0.00006167;
    final double product = (a * a * b * c * d * e * toPerDay) as double;
    final product_output = product.toStringAsFixed(3) + ' kgs/day';
    setState(() {
      output = product_output;
    });
  }

  // Function to set default values as app starts
  @override
  void initState(){
    _efficiency_percentage.text = '100';
    _countryCodeController.text = '91';
    _phoneController.text = "9999438811";
  }

  // Home Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text('Wire Production Calculator'),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [

                  // Heading
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
                    child: Text(
                      'Enter Details:',
                      style: TextStyle(
                          fontFamily: 'Monteserrat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black
                      ),
                    ),
                  ),

                  Flexible(
                    child: SizedBox(
                      width: 1100.0,
                    ),
                  ),
                ],
              ),

              // Input for Wire Size in mm
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Text(
                        'Wire Size in MM:',
                    style: TextStyle(
                        fontFamily: 'Monteserrat',
                        //fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.black
                       ),
                    ),
                  ),
                  SizedBox(width: 34.0,),

                  Flexible(
                    child: SizedBox(
                      width: 1100.0,
                      child:TextField(
                        controller: _wire_size_in_mm,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(
                                borderSide:BorderSide(color: Colors.grey),
                            )
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0,width: 26.0,),

              // Input for Speed Metres/Minute
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Text(
                      'Speed Metres/Minute:',
                      style: TextStyle(
                          fontFamily: 'Monteserrat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.black
                      ),
                    ),
                  ),

                  Flexible(
                    child: SizedBox(
                      width: 1100.0,
                      child:TextField(
                        controller: _speed_metre_minute,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(
                              borderSide:BorderSide(color: Colors.grey),
                            )
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10.0,),

              // Input for Number of Wires
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Text(
                      'Number of Wires:',
                      style: TextStyle(
                          fontFamily: 'Monteserrat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.black
                      ),
                    ),
                  ),

                  SizedBox(width: 26.0,),

                  Flexible(
                    child: SizedBox(
                      width: 1100.0,
                      child:TextField(
                        controller: _number_of_wires,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(
                              borderSide:BorderSide(color: Colors.grey),
                            )
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10.0,),

              // Input for Efficiency Percentage
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Text(
                      'Efficiency Percentage:',
                      style: TextStyle(
                          fontFamily: 'Monteserrat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.black
                      ),
                    ),
                  ),

                  Flexible(
                    child: SizedBox(
                      width: 1100.0,
                      child:TextField(
                        controller: _efficiency_percentage,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(
                              borderSide:BorderSide(color: Colors.grey),
                            )
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0,),

              // Button: Calculate Production
              Container(
                child: ElevatedButton(
                    onPressed: calculate,
                  child: Text(
                      "Calculate Production",
                    style: TextStyle(
                      fontSize: 14.0,

                    ),
                  ),
                ),
                width: 300.0,
              ),

              SizedBox(height: 10.0,),

              // Output: Show Production
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                        "Production is: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  Container(

                    child: Text(
                        output,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0,),

              // Company's Products
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Text(
                    "Wire Drawing Plants | Wire Galvanizing Plants | Mig Wire Plants | Binding Wire Plants | Annealing Furnaces",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.0,),

              // Image: Company's Banner
              Container(
                padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/banner.jpeg'),
                width: 1200.0,
                height: 120.0,
              ),

              SizedBox(height: 15.0,),

              // Button: Navigate to Wire Size Chart Page
              Container(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 10),
                child: ElevatedButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => wireSizeChart())); },
                  child: Text(
                    'View Wire Size Chart',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Icons: Url launchers to contact company
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  children: [

                    // Url Launcher: Website Icon
                    Container(
                      child: GestureDetector(
                        child:Image.asset('assets/web.png'),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try{
                            _launchWebsite('www.arihantmachines.com');
                          }
                          catch(e)
                          {
                            //to handle error and display msg
                            print('cant open website');
                            print(e.toString());
                          }
                        },
                      ),
                      width: 60.0,
                      height: 50.0,
                    ),

                    // Url Launcher: Whatsapp Icon
                    Container(
                      child: GestureDetector(
                        child:Image.asset('assets/whatsapp.png'),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try{
                            var whatsappUrl = Uri.parse("whatsapp://send?phone=+919999438811");
                            launchUrl(whatsappUrl);
                          }
                          catch(e)
                          {
                            //to handle error and display msg
                            print('cant open whatsapp ');
                            print(e.toString());
                          }
                        },
                      ),
                      width: 60.0,
                      height: 50.0,
                    ),

                    // Url Launcher: Gmail Icon
                    Container(
                      child: GestureDetector(
                        child:Image.asset('assets/gmail.png'),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try{
                            var gmailUrl = Uri.parse("mailto:wire3g@gmail.com");
                            launchUrl(gmailUrl);
                          }
                          catch(e)
                          {
                            //to handle error and display msg
                            print('cant open gmail ');
                            print(e.toString());
                          }
                        },
                      ),
                      width: 60.0,
                      height: 40.0,
                    ),

                    // Url Launcher: Google Icon
                    Container(
                      child: GestureDetector(
                        child:Image.asset('assets/google.png'),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try{
                            var gmailUrl = Uri.parse("https://g.page/arihant-machinery-india?share");
                            launchUrl(gmailUrl);
                          }
                          catch(e)
                          {
                            //to handle error and display msg
                            print('cant open google ');
                            print(e.toString());
                          }
                        },
                      ),
                      width: 60.0,
                      height: 40.0,
                    ),

                    // Url Launcher: Youtube Icon
                    Container(
                      child: GestureDetector(
                        child:Image.asset('assets/youtube.png'),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try{
                            var gmailUrl = Uri.parse("https://www.youtube.com/@arihantmachineryindia7578");
                            launchUrl(gmailUrl);
                          }
                          catch(e)
                          {
                            //to handle error and display msg
                            print('cant open youtube');
                            print(e.toString());
                          }
                        },
                      ),
                      width: 60.0,
                      height: 55.0,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.0,),
            ],
          ),

        ),

      ),
    );
  }
}
