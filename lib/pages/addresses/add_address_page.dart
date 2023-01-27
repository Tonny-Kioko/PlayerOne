import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/data/controllers/location_controller.dart';
import 'package:playerone/utils/dimensions.dart';
import 'package:playerone/widgets/app_text_fields.dart';
import 'package:playerone/widgets/big_text.dart';

import '../../data/controllers/user_controller.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPerson = TextEditingController();
  final TextEditingController _contactPersonMobile = TextEditingController();
  late bool _isLoggedIn;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(-1.375081, 37.995213), zoom: 15);
  late LatLng _initialPosition = LatLng(-1.375081, 37.995213);

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress['latitude']),
              double.parse(
                  Get.find<LocationController>().getAddress['longitude'])));
      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gemer's Address"),
        backgroundColor: AppColors.backGround,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        if (userController.userModel != null && _contactPerson.text.isEmpty) {
          _contactPerson.text = '${userController.userModel.name}';
          _contactPersonMobile.text = '${userController.userModel.phone}';
          if (Get.find<LocationController>().addressList.isNotEmpty) {
            Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder: (locationController) {
          _addressController.text = '${locationController.placemark.name ?? ''}'
              '${locationController.placemark.locality ?? ''}'
              '${locationController.placemark.postalCode ?? ''}'
              '${locationController.placemark.country ?? ''}';
          //Test
          print("My address is " + _addressController.text);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.sizeBoxHeight50 * 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor)),
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: _initialPosition, zoom: 15),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: false,
                      onCameraIdle: () {
                        locationController.updatePosition(
                            _cameraPosition, true);
                      },
                      onCameraMove: ((position) => _cameraPosition = position),
                      onMapCreated: (GoogleMapController controller) {
                        locationController.setMapController(controller);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              Padding(
                  padding: EdgeInsets.only(left: Dimensions.sizeBoxWidth5 * 2),
                  child: BigText(
                    text: "Delivery Address",
                    size: Dimensions.font26,
                  )),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              AppTextField(
                  textController: _addressController,
                  icon: Icons.map,
                  hintText: "Pick an Address"),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              Padding(
                  padding: EdgeInsets.only(left: Dimensions.sizeBoxWidth5 * 2),
                  child: BigText(
                    text: "Delivery Address",
                    size: Dimensions.font26,
                  )),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              AppTextField(
                  textController: _contactPerson,
                  icon: Icons.person,
                  hintText: "Your Name"),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              Padding(
                  padding: EdgeInsets.only(left: Dimensions.sizeBoxWidth5 * 2),
                  child: BigText(
                    text: "Delivery Address",
                    size: Dimensions.font26,
                  )),
              SizedBox(height: Dimensions.sizeBoxHeight10),
              AppTextField(
                  textController: _contactPersonMobile,
                  icon: Icons.phone,
                  hintText: "Your Mobile Number")
            ],
          );
        });
      }),
    );
  }
}
