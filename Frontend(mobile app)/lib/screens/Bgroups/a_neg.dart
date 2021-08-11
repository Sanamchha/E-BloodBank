import 'dart:async';
import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Anegative extends StatefulWidget {

  @override
  State<Anegative> createState() => AnegativeState();
}

class AnegativeState extends State<Anegative> {
  bool mapToggle;
  Completer<GoogleMapController> _controller = Completer();
  Location location = Location();
  LatLng userPosition;
  LocationData currentPosition;
  var donors = [];
  final Set<Marker> _markers = new Set();
  BitmapDescriptor pinLocationIcon;

  
  // Set<Marker> markers = Dashboard.markers;

  getLoc() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print(_serviceEnabled);
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    print(_serviceEnabled);
    print(_permissionGranted);

    if(_serviceEnabled == true && _permissionGranted == PermissionStatus.granted){
      print(mapToggle);
      currentPosition = await location.getLocation();
      userPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
      location.onLocationChanged.listen((LocationData currentLocation) {
        // print("${currentLocation.latitude} : ${currentLocation.longitude}");
        currentPosition = currentLocation;
        userPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
        // _positionupdate();
      });
    }    
  }



  @override
  void initState() {
    super.initState();
    getLoc();
    mapToggle=true;
    fetchdonors();
    // initMarker();
    
  }


  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/A+.png');
   }

  fetchdonors() async{
    Map data={
      'latitude': userPosition.latitude,
      'longitude': userPosition.longitude
    };
    var jsonResponse;
    jsonResponse = null;
    // var response = await http.get(Uri.parse("http://10.0.2.2:5000/api/markers"));
    var response = await http.post(Uri.parse("http://10.0.2.2:5000/api/dmapi"),
    headers: {"Content-type":"application/json"},
    body: jsonEncode(data),
    );
    if(response.statusCode == 200) {

      jsonResponse = json.decode(response.body);
      // print(jsonResponse[0]['Latitude']);
      print(jsonResponse.length);
      print(mapToggle);
      for (int i=0;i<jsonResponse.length;i++){
        // to add icon
        setCustomMapPin();
        var marker=Marker(
        markerId: MarkerId(jsonResponse[i]['Blood_type']),
        position: LatLng(jsonResponse[i]['Latitude'],jsonResponse[i]['Longitude']),
        infoWindow: InfoWindow(
          title: jsonResponse[i]['Blood_type'],
          snippet: jsonResponse[i]['Name'],
        ),
        // icon:pinLocationIcon,
        icon: BitmapDescriptor.defaultMarker,
        // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, icon),
        );
        setState(() {
          _markers.add(marker);
        });
      }
      print(_markers);
    }
    else {
      print("The error message is: ${response.body}");
    }
  }


  void _onMapCreated(GoogleMapController controller)
  {
    _controller.  complete(controller);
    showdialog(context);
    print("just checking in ");
    
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('E-BloodBank'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-80.0,
                width: double.infinity,
                // if maptoggle is true
                child: mapToggle ?
                GoogleMap(
                  compassEnabled: true,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(27.6,85.4),
                    zoom: 10,
                    ),
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                ):
                // if maptoggle is not true
                Center(
                  child:
                  Text('Loading Please Wait..',
                  style: TextStyle(
                    fontSize: 20.0
                  ),))

              ),
            ],)
        ],
      ),
    );
  }
}



showdialog(context){
  return showDialog(context: context, builder: (context){
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text('Donors near me',textScaleFactor: 2,style: TextStyle(color: Colors.white),),
            Container(
              // color: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(20.0),
              constraints: BoxConstraints.tightForFinite(height: 400),
              child: ListView.builder
              (
                itemCount: 10,
                itemBuilder: (BuildContext contet, int index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(20.0),
                    child: ListTile(
                      title: Text('data${index+1}'),
                      onTap: (){
                        
                      },
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  });
}
