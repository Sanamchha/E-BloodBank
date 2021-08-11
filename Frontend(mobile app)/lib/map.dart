import 'dart:async';
import 'dart:convert';
import 'package:Ebloodbank/widgets/Bgroup.dart';
import 'package:flutter/painting.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  bool mapToggle;
  Completer<GoogleMapController> _controller = Completer();
  Location location = Location();
  LatLng userPosition;
  LocationData currentPosition;
  var donors = [];
  final Set<Marker> _markers = new Set();
  
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
    fetchdonors();
    mapToggle=true;
    // initMarker();
    getLoc();
    
  }

  BitmapDescriptor pinLocationIcon;

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/A+.png');
   }

  fetchdonors() async{
    var jsonResponse;
    jsonResponse = null;
    var response = await http.get(Uri.parse("http://10.0.2.2:5000/api/markers"));
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

  // initMarker(){
  //   for (int i=0;i<donors.length;i++){
  //     _markers.add(Marker(
  //       markerId: MarkerId(donors[i]['Blood_type']),
  //       position: LatLng(donors[i]['Latitude'],donors[i]['Longitude']),
  //       infoWindow: InfoWindow(
  //         title: donors[i]['Blood_type'],
  //         snippet: donors[i]['Name'],
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //       ));
  //   }
  // }


  // final CameraPosition home = CameraPosition(
  //   target: LatLng(currentPosition.latitude, currentPosition.longitude),
  //   zoom: 10.0,
  // );

  void _onMapCreated(GoogleMapController controller)
  {
    _controller.  complete(controller); 
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
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        backgroundColor: Colors.red,
        child: Icon(Icons.campaign),
        onPressed: (){
          showdialog(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Future<void> _positionupdate() async {
  //   CameraPosition address = CameraPosition(
  //     target: userPosition,
  //     zoom: 9,
  //   );
  //   if (address!=null){
  //     final GoogleMapController controller = await _controller.future;
  //     controller.moveCamera(CameraUpdate.newCameraPosition(address));
  //     dispose();
  //   }
    
  // }
}



showdialog(context){
  return showDialog(context: context, builder: (context){
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            SizedBox(height: 140,),
            Text('Select Blood Group',textScaleFactor: 2,style: TextStyle(color: Colors.white),),
            BGroup(),
          ],
        ),
      ),
    );
  });
}
