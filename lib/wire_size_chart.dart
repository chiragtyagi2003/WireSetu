import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class wireSizeChart extends StatefulWidget {
  const wireSizeChart({Key? key}) : super(key: key);

  @override
  State<wireSizeChart> createState() => _wireSizeChartState();
}

class _wireSizeChartState extends State<wireSizeChart> {

  Future<void> _launchWebsite(String url) async{
    final Uri uri = Uri(scheme:'https', host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    ))
    {
      throw "Can not launch the Website";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wire Size Chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Image: Wire Gauge Conversion Chart
              Image.asset('assets/chart.jpeg'),

              SizedBox(height: 15.0,),

              // Icons: Url launchers to contact company
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
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


            ],



          ),
        ),
      ),
    );
  }
}
