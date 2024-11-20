import 'package:ticket_reselling/core/utils/extensions/widget_extension.dart';
import 'package:ticket_reselling/export.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height,
    this.padding = p16,
    this.margin,
    this.borderColor = ColorConst.kPrimaryColor,
    this.background = ColorConst.kPrimaryColor,
    this.textColor = ColorConst.kWhiteColor,
    this.radius = 8,
    this.style,
    this.isLoading = false,
  });

  final String title;
  final TextStyle? style;
  final VoidCallback onTap;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color borderColor;
  final Color background;
  final Color textColor;
  final double radius;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // onTap: onTap,
      onTap: (isLoading ?? false) ? null : onTap,
      child: Container(
        height: height,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: getContainerDecoration(
          borderColor: borderColor,
          background: background,
          radius: radius,
        ),
        child: isLoading!
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : CustomText(
                text: title,
                style: style ?? context.bodyMedium.withColor(textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
      ),
    );
  }
}

// class DashedButtonWidget extends StatelessWidget {
//   final String title;
//   final GestureTapCallback onTap;
//   final EdgeInsetsGeometry? padding;
//
//   const DashedButtonWidget({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.padding,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: DottedBorder(
//         borderType: BorderType.RRect,
//         color: Theme.of(context).dividerColor,
//         padding: paddingAll16,
//         dashPattern: const [6, 6],
//         strokeWidth: 1,
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               const CustomSvgImage(logo: ImageConst.icUpload),
//               gap8,
//               Center(
//                 child: CustomText(
//                   text: title,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorConst.kGray200Color),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
