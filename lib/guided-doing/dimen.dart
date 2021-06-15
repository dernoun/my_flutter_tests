import 'package:flutter/widgets.dart';

class XPlainDimensions {
  XPlainDimensions._();

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < 600;

  static const sectionHorizontalPadding = 40.0;

  static int numberOfCards(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape ? 5 : 4;
  static const cardSpacing = 22.0;

  /// Calculates the width of an card by the following formula
  /// total width per card = (screen-width - section padding) / number of cards
  /// spacing between cards = (number of cards - 1) * spacing
  /// card width = total width per card - spacing between cardss
  static double defaultCardWidth(BuildContext context) =>
      isPhone(context) ? 1000 : MediaQuery.of(context).size.width;

  static double cardWidth(BuildContext context) =>
      (((defaultCardWidth(context) - 2 * sectionHorizontalPadding) /
                  numberOfCards(context)) -
              cardSpacing +
              (1 / numberOfCards(context)) * cardSpacing)
          .ceilToDouble();
  static const cardBorder = 1.0;
  static const cardHeight =
      cardHeaderHeight + cardFooterHeight + cardBorder * 2;
  static const cardBackgroundVerticalSpacing = 18.0;
  static const cardBackgroundHeight =
      cardHeight - cardBackgroundVerticalSpacing * 2;
  static const cardBackgroundBorderRadius = 20.0;
  static const cardBorderRadius = 2.0;
  static const cardHeaderHeight = 130.0;
  static const cardFooterHeight = 64.0;
  static const circularButtonIconPadding = 8.0;
  static const actionHeight = 38.0;
  static const registerTextFieldPadding = 80.0;
  static const buttonHeight = 40.0;

  static const cardFormDefaultWidth = 525.0;

  static const imageListSpacing = 16.0;
  static const imageListHeight = 112.0;
  static const imageListBackgroundHeight = 48.0;

  static const imageListItemSize = Size(98, 72);
  static const imageListSelectedItemSize = Size(108, 81);

  static const popupActionFooterHeight = 44.0;

  static double annotationSize(BuildContext context) => // COMPLETE: GDD-290
      isPhone(context) ? annotationSizePhone : annotationSizeTablet;
  static const annotationSizeTablet = 44.0;
  static const annotationSizePhone = 32.0;
  static const selectedAnnotationSize = 56.0;
  static const annotationPaddingToOverlay = 10.0;
  static const symbolAnnotationCompareValue = 310.0;
  static const symbolAnnotationSize = 32.0;

  static const defaultBorderWidth = 1.0;
  static const defaultDividerHeight = 1.0;

  static const formFooterVerticalPadding = 22.0;
  static const formFooterButtonSize = Size(108.0, 37.0);

  static const forgotPasswordEmailVerticalPadding = 35.0;
  static const forgotPasswordEmailHorizontalPadding = 80.0;
  static const forgotPasswordResetMessagePadding = 44.0;
  static const forgotPasswordCardTopPadding = 168.0;

  static const plainyBarHeight = 56.0;

  static const maxImageUploadHeight = 1080.0;

  //Popups general
  static const popupMediaContentPadding = 16.0;
  static const annotationPreselectionWidth = 162.0;
  static const popupWidthTablet = 300.0;

  static Size popupSize(BuildContext context) => isPhone(context)
      ? Size(MediaQuery.of(context).size.width * 0.7,
          MediaQuery.of(context).size.height * 0.8)
      : Size(popupWidthTablet, 350);

  //Image popup Widget
  static const popupImageHeight = 318.0;
  static const annotationPopupImagePreselectionHeight = 114.0;
  static const innerMediaContentSize = Size(267.0, 183.0);

  // Audio popup Widget
  static const annotationAudioPreselectionHeight = 114.0;
  static const popupAudioHeight = 152.0;

  // Video popup Widget
  static const annotationVideoPreselectionHeight = 114.0;
  static const popupVideoHeight = 348.0;
  static const videoSize = Size(267, 183);

  //Text popup Widget
  static const popupTextOverlaySize = Size(popupWidthTablet, 160.0);

  //Link popup Widget
  static const popupLinkOverlaySize = Size(256.0, 272.0);
  static const popupLinkInternalOverlaySize = Size(256.0, 120.0);
  static const popupLinkOverlaySearchSize = Size(popupWidthTablet, 350.0);

  //Symbol popup widget
  static const popupSymbolOverlaySize = Size(popupWidthTablet, 332.0);
  static const popupSymbolCrossAxisSpacing = 32.0;
  static const popupSymbolMainAxisSpacing = 25.0;
  static const popupSymbolGridViewPadding = 25.0;
  static const popupSymbolIconSize = 25.0;

  // Popup / Modal sizes
  static const modalSize = Size(512, 508);
}
