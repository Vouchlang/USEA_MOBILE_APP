import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Guest_API.dart';

class LaunchUrl {
  launchFacebookPage() async {
    if (await canLaunchUrlString(UrlFb)) {
      await launchUrlString(UrlFb);
    } else {
      throw 'Could not launch $UrlFb';
    }
  }

  launchInstagram() async {
    if (await canLaunchUrlString(UrlIg)) {
      await launchUrlString(UrlIg);
    } else {
      throw 'Could not launch $UrlIg';
    }
  }

  launchYoutube() async {
    if (await canLaunchUrlString(UrlYt)) {
      await launchUrlString(UrlYt);
    } else {
      throw 'Could not launch $UrlYt';
    }
  }

  launchTelegramGroup() async {
    if (await canLaunchUrlString(UrlTelegram)) {
      await launchUrlString(UrlTelegram);
    } else {
      throw 'Could not launch $UrlTelegram';
    }
  }

  launchTiktok() async {
    if (await canLaunchUrlString(UrlTiktok)) {
      await launchUrlString(UrlTiktok);
    } else {
      throw 'Could not launch $UrlTiktok';
    }
  }
}

Widget buildGuestGridBtn({
  required final Function() onTap,
  required final String image,
  name,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(left: UPdMg15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            scale: UScale6,
          ),
          buildHeight7(),
          Text(
            name,
            style: const TextStyle(fontSize: UTitleSize),
          ),
        ],
      ),
    ),
  );
}

Widget buildPositionNoConnection({
  required final Color bannerColor,
  required final String text,
}) {
  return Positioned(
    top: UZeroPixel,
    left: UZeroPixel,
    right: UZeroPixel,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      color: bannerColor,
      padding: const EdgeInsets.symmetric(
        horizontal: UPdMg15,
        vertical: UPdMg8,
      ),
      child: Row(
        children: [
          LottieBuilder.asset(
            imageAsset + 'no_internet_icon.json',
            fit: BoxFit.cover,
            height: UHeight50,
          ),
          buildWidth7(),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: UTitleSize,
                color: UBackgroundColor,
                fontWeight: UTitleWeight,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSocialMediaCard({
  required final Widget btnFb,
  btnInsta,
  btnYt,
  btnTele,
  btnWeb,
  btnTiktok,
}) {
  return Card(
    elevation: 1.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    margin: const EdgeInsets.fromLTRB(
      UPdMg10,
      UZeroPixel,
      UPdMg10,
      UPdMg5,
    ),
    child: Padding(
      padding: const EdgeInsets.all(UPdMg10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          btnFb,
          btnInsta,
          btnYt,
          btnTele,
          btnWeb,
          btnTiktok,
        ],
      ),
    ),
  );
}

Widget BuildContainerSM({
  required final Function() onTap,
  required final String imageName,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imageName,
        scale: UScale5,
      ),
    ),
  );
}
