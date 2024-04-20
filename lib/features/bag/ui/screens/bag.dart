import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/bag/ui/widgets/bag_expanded_widget.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<String> equipmentTitles = [
    'Blood pressure monitor',
    'Mouth to mouth mask',
    'Stethoscope',
    'Tongue depressor',
    'Temperature monitor',
    'Razor',
    'Nebulizer',
    'Flashlight',
    'Straps',
    'Infusion sets',
  ];
  List<String> equipmentImages = [
    'https://5.imimg.com/data5/TR/NO/MY-25122208/airs-bed-mattress.jpg',
    'https://www.oxyaider.co.za/wp-content/uploads/2020/05/PEDIATRIC-NEBULIZER-MASK-WITH-TUBING.jpg',
    'https://www.lotfy.clinic/wp-content/uploads/2020/09/13.jpg',
    'https://img.uline.com/is/image/uline/HD_82?Mobile_SI',
    'https://sperdirect.com/cdn/shop/products/Digital-Temperature-Monitor-with-Remote-Sensor-and-Frost-Point-Alarm-5-726997_540x.jpg?v=1701466482',
    'https://cdn11.bigcommerce.com/s-i2wp9fnqpg/images/stencil/1280x1280/products/126/457/Gillette_KCG-NeckRazor_Front1280x1280__41005.1611672074.jpg?c=2',
    'https://www.performancehealth.com/media/catalog/product/n/e/ne-c801_jpeg_picture_1_.jpg?optimize=low&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700',
    'https://www.fenixlighting.com/cdn/shop/products/WF26R_Cradle-Charging-Flashlight.jpg?v=1669672416',
    'https://www.gorillawear.com/resize/9910590000-padded-lifting-straps-05_2563761964256.jpg/0/1100/True/padded-lifting-straps-details.jpg',
    'https://i0.wp.com/islammoenespharmacy.com/wp-content/uploads/2022/09/118704-15716902.jpg?fit=1500%2C1500&ssl=1',
  ];

  List<String> orthopedicSupportsTitles = [
    'Ankle splint',
    'Arm sling',
    'Knee brace',
    'Wrist splint',
    'Mouth guard',
    'Neck collar',
  ];
  List<String> orthopedicSupportImages = [
    'https://5.imimg.com/data5/SELLER/Default/2021/7/YL/NM/KF/2929250/procare-universal-ankle-brace-79-81330.jpg',
    'https://www.docortho.com/cdn/shop/products/vlt7xp7msow28gwh0uto.jpg?v=1659280090&width=1946',
    'https://www.donjoystore.com/media/catalog/product/cache/2c92df2eaef8394df42e6480757059b9/d/o/donjoy-performance-bionic-comfort-hinged-knee-brace-15.jpg',
    'https://m.media-amazon.com/images/I/61msr00FB9L._AC_UF894,1000_QL80_.jpg',
    'https://jsdentallab.com/cdn/shop/products/fix_night-guard-1-bottom.jpg?v=1646323824',
    'https://cdn.boundtree.com/btm/products/3151-68611_original_1200Wx1200H_8913541496862',
  ];
  List<String> tapesTitles = [
    'Bandage different size',
    'Elastic plaster',
    'Cohesive bandage',
    'Kinesiology',
    'Under-wrap',
  ];
  List<String> tapesImages = [
    'https://cdn11.bigcommerce.com/s-mwwfzsrilk/images/stencil/1280x1280/products/3572/3835/IMG_8401sm13274448054f1f334513111__44764.1585888122.jpg?c=1',
    'https://images-us.eucerin.com/~/media/hansaplast/elastoplast/international/brand-relaunch-2020/packshots/elastoplast_fabric_roll/45773_elastoplast_fabric_roll_3mx2_5cm_1380x1140px.jpeg',
    'https://cdn-5c84bc36-b681cbc1.mysagestore.com/a8a024019e3db28565fcc10526b01ae3/contents/435/435_Cohesive_Contents.jpg',
    'https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/02/810774/1.jpg?9750',
    'https://i5.walmartimages.com/asr/19637993-7f55-4f53-844f-6fcc6505ca42.5910d196d519f3a7cd53a5aeb2e4bf0f.jpeg',
  ];

  List<String> woundsTitles = [
    'Gauze roll different size',
    'Adherent surgical gauze different size',
    'Petroleum non adherent gauze',
    'Hemostatic cotton wool',
    'Dressing spray',
    'Saline eye drops',
    'Small wound plaster',
  ];
  List<String> woundsImages = [
    'https://dar-alshifaa.com/wp-content/uploads/2019/01/medical_shop_5.jpg',
    'https://medicpro.in/image/cache/catalog/SURGICAL/COTTON_ROLLS/Surgical_Pure%20Cotton_Sterilised%20-%20500_Gm-1000x1000.jpg',
    'https://m.media-amazon.com/images/I/51Mk-Nbw9nL._AC_SX679_PIbundle-12,TopRight,0,0_SH20_.jpg',
    'https://image.made-in-china.com/2f0j00mZahfwryZbut/Hemostatic-Cotton-Wool-Roll-for-Hospital-and-Clinic.webp',
    'https://cdn11.bigcommerce.com/s-evy5wg6u1j/images/stencil/1440x1440/products/760/2555/Low-Adherent-Pad-10x10__82939.1654775882.jpg?c=2',
    'https://www.oclvision.com/wp-content/uploads/2018/10/drop-eye.jpg',
    'https://img.freepik.com/premium-vector/medical-plaster-bactericidal-adhesive-tape-isolated-white-background-first-aid-small-wounds-abrasions_87771-26962.jpg',
  ];
  List<String> icingTitles = [
    'Ice box',
    'Ice bag',
    'Ice Spray',
    'Plastic wrap',
  ];
  List<String> icingImages = [
    'https://cdnprod.mafretailproxy.com/sys-master-root/h39/h43/49312451919902/480Wx480H_238337_1.jpg',
    'https://m.media-amazon.com/images/I/71W3tkd1ESL._AC_SL1500_.jpg',
    'https://z.nooncdn.com/products/tr:n-t_400/pzsku/Z62B4FF33571AB44D558BZ/45/_/1688547543/87d2d21e-8c6b-4183-be76-65ac5285c811.jpg',
    'https://m.media-amazon.com/images/I/61IOkd0qJeL._AC_UF894,1000_QL80_.jpg',
  ];
  List<String> scissorsTitles = [
    'Gauze & bandage scissor different size',
    'Tape scissor',
    'Cutter',
    'Forceps',
  ];
  List<String> scissorsImages = [
    'https://m.media-amazon.com/images/I/41H63-P80ZL.jpg',
    'https://www.3bscientific.com/thumblibrary/S-3BSCISSOR/S-3BSCISSOR_01_1200_1200_3BTAPE-Coated-Kinesiology-Scissors.jpg',
    'https://m.media-amazon.com/images/I/4142nxVr1AL._AC_UF1000,1000_QL80_.jpg',
    'https://www.karlstorz.com/catalog-api/mediafiles/stream/eg_en/62860',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sports Physiotherapist\'s Bag',
          style: getBoldStyle(color: ColorManger.darkPrimary, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              BagExpandedWidget(
                choice: 'Equipment',
                icon: 'medical-equipment',
                detailsImage: equipmentImages,
                detailsTitle: equipmentTitles,
              ),
              verticalSpace(10),
              BagExpandedWidget(
                choice: 'Orthopedic supports',
                icon: 'medical',
                detailsImage: orthopedicSupportImages,
                detailsTitle: orthopedicSupportsTitles,
              ),
              verticalSpace(10),
              BagExpandedWidget(
                choice: 'Taping tools',
                icon: 'tape',
                detailsImage: tapesImages,
                detailsTitle: tapesTitles,
              ),
              verticalSpace(10),
              BagExpandedWidget(
                choice: 'Wounds tools',
                icon: 'band-aids',
                detailsImage: woundsImages,
                detailsTitle: woundsTitles,
              ),
              verticalSpace(10),
              BagExpandedWidget(
                choice: 'Icing tools',
                icon: 'cold',
                detailsImage: icingImages,
                detailsTitle: icingTitles,
              ),
              verticalSpace(10),
              BagExpandedWidget(
                choice: 'Scissors and forceps tools',
                icon: 'forceps',
                detailsImage: scissorsImages,
                detailsTitle: scissorsTitles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
