
import 'package:bank9780/components/pages/about_us_page.dart';
import 'package:bank9780/components/pages/account_registration_page.dart';
import 'package:bank9780/components/pages/agencies_page.dart';
import 'package:bank9780/components/pages/back_dni_capture_page.dart';
import 'package:bank9780/components/pages/bounds_page.dart';
import 'package:bank9780/components/pages/change_number_page.dart';
import 'package:bank9780/components/pages/chat_page.dart';
import 'package:bank9780/components/pages/change_video_page.dart';
import 'package:bank9780/components/pages/conected_devices_page.dart';
import 'package:bank9780/components/pages/configuration_page.dart';
import 'package:bank9780/components/pages/favorites_page_br.dart';
import 'package:bank9780/components/pages/fingerprint_page.dart';
import 'package:bank9780/components/pages/fingerprint_terms_page.dart';
import 'package:bank9780/components/pages/front_dni_capture_page.dart';
import 'package:bank9780/components/pages/favorites_page.dart';
import 'package:bank9780/components/pages/forgot_pin_page.dart';
import 'package:bank9780/components/pages/help_page.dart';
import 'package:bank9780/components/pages/help_page_ans.dart';
import 'package:bank9780/components/pages/home_page.dart';
import 'package:bank9780/components/pages/key_authenticator_page.dart';
import 'package:bank9780/components/pages/key_authenticator_register_page.dart';
import 'package:bank9780/components/pages/key_authenticator_register_page_confirm.dart';
import 'package:bank9780/components/pages/login_page.dart';
import 'package:bank9780/components/pages/login_without_user.dart';
// import 'package:bank9780/components/pages/login_page.dart';
import 'package:bank9780/components/pages/notifications_page.dart';
import 'package:bank9780/components/pages/pin_change_page.dart';
import 'package:bank9780/components/pages/pin_page.dart';
import 'package:bank9780/components/pages/pin_page_register.dart';
import 'package:bank9780/components/pages/portfolio_page.dart';
import 'package:bank9780/components/pages/qr_authenticator_page_.dart';
import 'package:bank9780/components/pages/questions_page.dart';
import 'package:bank9780/components/pages/record_page.dart';
import 'package:bank9780/components/pages/referrals_page.dart';
import 'package:bank9780/components/pages/referrals_record_page.dart';
import 'package:bank9780/components/pages/register_pages/register_form_first_one.dart';
import 'package:bank9780/components/pages/register_pages/register_form_second_one.dart';
import 'package:bank9780/components/pages/selfie_capture_page.dart';
//import 'package:bank9780/components/pages/registration_pin_page.dart';
import 'package:bank9780/components/pages/successful_page.dart';
import 'package:bank9780/components/pages/tutorial_page.dart';
import 'package:bank9780/components/pages/user_accounts_page.dart';
import 'package:bank9780/components/pages/user_page.dart';
import 'package:bank9780/components/pages/video_call_webview_page.dart';
import 'package:bank9780/components/pages/visitor_pages/visitor_tutorial.dart';
import 'package:bank9780/components/pages/waiting_page.dart';
import 'package:bank9780/components/pages/waiting_register_page.dart';
import 'package:bank9780/components/pages/waiting_videocall_page.dart';
import 'package:bank9780/components/widgets/webview_page.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:flutter/material.dart';


import 'package:page_transition/page_transition.dart';

import 'package:bank9780/components/pages/terms_page.dart';
import 'package:bank9780/components/pages/introduction_page.dart';
import 'package:bank9780/components/pages/welcome_page.dart';

class Routes{
  static void hide(BuildContext context) => Navigator.of(context).pop();

  static void welcome(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const WelcomePage(),
      settings: const RouteSettings(name: '/welcome')
    ),
  );

  static void introduction(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.leftToRight,
      child: const IntroductionPage(),
    )
  );

  // register first version
  //static void register(BuildContext context) =>
  //Navigator.push(
  //  context,
  //  PageTransition(
  //    type  : PageTransitionType.fade,
  //    child : const RegisterPage(),
  //  )
  //);

  static void register(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const RegisterFormFirst(),
    )
  );

  static void visitor(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const VisitorTutorialPage(),
    )
  );

  static void registerSec(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const RegisterFormSecond(),
    )
  );

  static void terms(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const TermsPage(),
    )
  );

  static void webview(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const WebviewFlutterPage(),
    )
  );

  //static void portfolio(BuildContext context) =>
  //Navigator.push(
  //  context,
  //  PageTransition(
  //    type  : PageTransitionType.rightToLeft,
  //    child : const PortfolioPage(),
  //    settings: const RouteSettings(name: '/portfolio'),
  //  )
  //);

  static void portfolio(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const PortfolioPage(),
      settings: const RouteSettings(name: '/portfolio'),
    ),
);

  static void record(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const RecordPage(),
      settings: const RouteSettings(name: '/record'),
    ),
  );

  static void useraccount(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const UserAccounts(),
      settings: const RouteSettings(name: '/useraccount'),
    ),
  );

  static void favorites(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const FavoritesPage(),
      settings: const RouteSettings(name: '/favorites'),
    ),
  );

  static void favoritesbr(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const FavoritesPageBR(),
      settings: const RouteSettings(name: '/favoritesbr'),
    ),
  );

  static void config(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ConfigurationPage(),
      settings: const RouteSettings(name: '/config'),
    ),
  );

  static void help(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const HelpPage(),
      settings: const RouteSettings(name: '/help'),
    ),
  );

  static void agencies(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const AgenciesPage(),
      settings: const RouteSettings(name: '/agencies'),
    ),
  );

  static void referrals(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ReferralsPage(),
      settings: const RouteSettings(name: '/referrals'),
    ),
  );

  static void tutorial(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const TutorialPage(),
      settings: const RouteSettings(name: '/tutorial'),
    ),
  );

  static void aboutus(BuildContext context) =>
  Navigator.push(
  context,
  PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const AboutUsPage(),
      settings: const RouteSettings(name: '/aboutus'),
    ),
  );

  static void questions(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const QuestionsPage(),
    )
  );

  // Help AnswerPage
  static void answers(BuildContext context, HelpItem helpItemrecived) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : AnswerPage(helpItem: helpItemrecived),
    )
  );

  static void chat(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ChatPage(),
    )
  );

  static void accountregister(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const AccountRegistrationPage(),
    )
  );

  static void user(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const UserPage(),
    )
  );

  static void bounds(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const BoundsPage(),
    )
  );

  static void devices(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ConectedDevicesPage(),
    )
  );

  static void referralsRec(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ReferralsRecordPage(),
    )
  );

  static void forgotpin(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ForgotPinPage(),
    )
  );

  static void selfie(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const SelfieCapturePage(),
    )
  );

  static void dnifrontcap(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const FrontDniCapturePage(),
    )
  );

  static void dnibackcap(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const BackDniCapturePage(),
    )
  );


  // todo: keyAth for the old page
  static void keyAth(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const KeyAuthenticatorPage(),
    )
  );

  // Register page auth
  static void keyAuthRegister(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const KeyAuthenticatorRegisterPage(),
    )
  );

  // Register page auth confirmation
  static void keyAuthRegisterConfirm(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const KeyAuthenticatorRegisterPageConfirm(),
    )
  );

  static void notify(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const NotificactionsPage(),
    )
  );

/// CONFIGURATION ROUTES
/// ----------------------------------------------------
/// APLICATION CHANGES
  static void changevideo(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const ChangeVideoPage(),
    )
  );

  static void qrauthenticator(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const QrAuthenticatorPage(),
    )
  );

  static void fingerprint(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const FingerprintPage(),
    )
  );

  static void fingerprintterms(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.rightToLeft,
      child : const FingerprintTermsPage(),
    )
  );

  static void configlang(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      //type  : PageTransitionType.rightToLeft,
      type  : PageTransitionType.fade,
      child : const ConfigurationPage(),
    )
  );

  static void changenumber(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      //type  : PageTransitionType.rightToLeft,
      type  : PageTransitionType.fade,
      child : const ChangeNumberPage(),
    )
  );

  //static void videocall(BuildContext context) =>
  //Navigator.push(
  //  context,
  //  PageTransition(
  //    //type  : PageTransitionType.rightToLeft,
  //    type  : PageTransitionType.fade,
  //    child : const VideoCallPage(),
  //  )
  //);

  
  static void videocallwebview(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      //type  : PageTransitionType.rightToLeft,
      type  : PageTransitionType.fade,
      child : const VideoCallPageWebView(),
    )
  );

  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  static void pinPage({
    required BuildContext context,
    required Process process,
    Pages? pages = Pages.none,
  }) =>
    Navigator.push(context,
      PageTransition(
        type  : PageTransitionType.fade,
        child :
        PinPage(
          process : process,
          pages   : pages!,
        )
      )
    );

  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  /// New PageRegister
  static void pinPageRegister({
    required BuildContext context,
    required Process process,
    Pages? pages = Pages.none,
  }) =>
    Navigator.push(context,
      PageTransition(
        type  : PageTransitionType.fade,
        child :
        PinPageRegister(
          process : process,
          pages   : pages!,
        )
      )
    );

  /// SECURITY ROUTE
  ///-----------------------------------------------------
  /// Change pin security page
  static void pinChangePage({
    required BuildContext context,
    required Process process,
    Pages? pages = Pages.none,
  }) =>
    Navigator.push(context,
      PageTransition(
        type  : PageTransitionType.fade,
        child :
        PinChangePage(
          process : process,
          pages   : pages!,
        )
      )
    );
    
  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  /// New PageLOGIN
  static void pinPageLogin({
    required BuildContext context,
    required Process process,
    Pages? pages = Pages.none,
  }) =>
    Navigator.push(context,
      PageTransition(
        type  : PageTransitionType.fade,
        child :
        PinPageLogin(
          process : process,
          pages   : pages!,
        )
      )
    );
    
  ///-----------------------------------------------------
  /// New LOGIN WITHOUT USER
  static void pinPageLoginWithoutUser({
    required BuildContext context,
    required Process process,
    Pages? pages = Pages.none,
  }) =>
    Navigator.push(context,
      PageTransition(
        type  : PageTransitionType.fade,
        child :
        LoginPageWithoutID(
          process : process,
          pages   : pages!,
        )
      )
    );

  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  static void waitingPage(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const WaitingPage()
    )
  );

    /// APPLICATION ROUTE
  ///-----------------------------------------------------
  /// WaitingPage for confirmation PIN
  static void waitingRegisterPage(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const WaitingRegisterPage()
    )
  );

   /// APPLICATION ROUTE
  ///-----------------------------------------------------
  /// WaitingPage for confirmation PIN
  static void waitingVideoCallPage(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const WaitingVideoCallPage()
    )
  );

  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  static void successfulPage(BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const SuccessfulPage()
    )
  );

  //----------------------------Ruta provicional
  static void pinRegister (BuildContext context) =>
  Navigator.push(
    context,
    PageTransition(
      type  : PageTransitionType.fade,
      child : const WaitingPage(),
    )
  );

  /// APPLICATION ROUTE
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  static void home (BuildContext context) =>
  Navigator.of(context).pushAndRemoveUntil(
    PageTransition(
      type  : PageTransitionType.fade,
      child : const HomePage(),
      settings: const RouteSettings(name: "/home")
    ),
    (Route<dynamic> route) => false
  );

  static void chargesRec(BuildContext context) {}
}