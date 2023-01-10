import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:playerone/colors.dart';
import 'package:playerone/data/controllers/auth_controller.dart';
import 'package:playerone/utils/dimensions.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    //print("I'm loading just fine"+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.sizeBoxHeight50*2,
        width: Dimensions.sizeBoxHeight50*2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.sizeBoxHeight50),

        ),
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color: AppColors.mainColor,
              strokeWidth: 7,
            )
        )
        // child: SfRadialGauge(
        //     axes: <RadialAxis>[
        //       // Create primary radial axis
        //       RadialAxis(
        //         minimum: 0,
        //         maximum: 100,
        //         showLabels: false,
        //         showTicks: false,
        //         startAngle: 270,
        //         endAngle: 270,
        //         radiusFactor: 0.7,
        //         axisLineStyle: AxisLineStyle(
        //           thickness: 0.2,
        //           color: const Color.fromARGB(30, 0, 169, 181),
        //           thicknessUnit: GaugeSizeUnit.factor,
        //         ),
        //         pointers: <GaugePointer>[
        //           RangePointer(
        //             value: 10,
        //             width: 0.05,
        //             pointerOffset: 0.07,
        //             sizeUnit: GaugeSizeUnit.factor,
        //           )
        //         ],
        //       ),
        //       // Create secondary radial axis for segmented line
        //       RadialAxis(
        //         minimum: 0,
        //         interval: 1,
        //         maximum: 4,
        //         showLabels: false,
        //         showTicks: true,
        //         showAxisLine: false,
        //         tickOffset: -0.05,
        //         offsetUnit: GaugeSizeUnit.factor,
        //         minorTicksPerInterval: 0,
        //         startAngle: 270,
        //         endAngle: 270,
        //         radiusFactor: 0.7,
        //         majorTickStyle: MajorTickStyle(
        //             length: 0.3,
        //             thickness: 3,
        //             lengthUnit: GaugeSizeUnit.factor,
        //             color: Colors.white),
        //       )
        //     ]
        // ),
      ),
    );
  }
}
