import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
            child: Text(
              'FEB\n\t\t11',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 435,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    landscapeImage1,
                    fit: BoxFit.cover,
                  ),
                ),
                kHeight,
                Row(
                  children: [
                    const Text('Dune', style: kTextBold40),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CustomButton(
                                icon: Icons.alarm,
                                text: 'Remind Me',
                                iconSize: 20,
                                textSize: 10),
                            kWidth,
                            CustomButton(
                                icon: Icons.info_outline,
                                text: 'Info',
                                iconSize: 20,
                                textSize: 10),
                            kWidth
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Text('Coming on Friday'),
                kHeight,
                const Text('Dune', style: kTextBold20),
                kHeight,
                const Text(
                  'Paul Atreides arrives on Arrakis after his father accepts the stewardship of the dangerous planet. However, chaos ensues after a betrayal as forces clash to control melange, a precious resource.',
                  style: kGreyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
