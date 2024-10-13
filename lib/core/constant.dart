class Constant {
  static const String baseUrl = "https://api.npoint.io/";
  static const String consumer_key = "ck_bc61784ac229d39b72c2a4294bf461f22d722f71";
  static const String consumer_secret = "cs_02f0f28a387c442df178b29fe8f82cd4e7e6335b";
  static const String policy = "https://projects.dimofinf.net/wp-projects/E-APP/privacy-policy/";
  static const String about = "https://projects.dimofinf.net/wp-projects/E-APP/refund_returns/";


  //thraa
  // static const String baseUrl = "https://tharaabusiness.com/";
  // static const String consumer_key = "ck_0a26ca24d0de3c49c33d014ebacd11b2d9e1d805";
  // static const String consumer_secret = "cs_bccde8a0a1a6c73afaa3efeaf65305c00894e1b2";

  // googleapis
  static const String baseUrl_googleapis = "https://maps.googleapis.com/";
  static const String key = "AIzaSyA6C7yJDdR8HBM5Rk0MQVzc1PcgswrrZuw";
  static const String Sessiontoken = "518dece4-15a7-41e1-a310-56fe6ba22ace";

  //payment
  static const String baseUrl_Stripe = "https://api.stripe.com/";
  static const String stripe_publishableKey= "pk_test_51NwfdQAjr6EaviPyAxVONXJZSgnHp95Szekh9HKJZ50fBtmvWosgHJosiCflhm6KgPE2ZnGOq82wAGdcOvInZ2d0002IDkRybK";
  static const String stripe_secretKey= "sk_test_51NwfdQAjr6EaviPyJ1Fi7vmQImC4ilVvJVNoCnnSiQT49gLdYGcPIct9PyaxxndWnO1BFBH3OG8IjSl6yoMTjS4N00LSqks1gD";
  static const String merchantIdentifier= "dim store";


  //payTabs
  static const String PayTabsServerKey= "SZJ9MNGKLJ-JHKJTWHZLH-9ZR9RZ2BWM";
  static const String PayTabsClientKey= "CRK2TD-BG2K6H-K67VH9-KQ6QV7";
  static const String PayTabsProfileId= "CRK2TD-BG2K6H-K67VH9-KQ6QV7";
  static const String PayTabsmerchantName= "Dim Store";






  static const String ImgUrl = "https://krz.pre-wi.com/storage/";
  static const String pdfUrl = "https://krz.pre-wi.com/api/generate_pdf/";

   //key cache
  static const localKey="ModelCache";
  static const keySlider="keySlider";
  static const keymostBrand="keynostBrand";

  static const keyCategories="keyCategories";
  static const keyProduct="keyProduct";
  static const keyLastStore="keyLastStore";
  static const keyLastOrder="keyLastOrder";
  static const keyCart="keyCart";

  static const keyLastNearbyStore="keyLastNearbyStore";
  static const localKey_wishlist="localKey_wishlist";
  static const localKey_cart="localKey_cart";



  late String token="";



  static final Constant _instance = Constant._internal();

  Constant._internal();

  static Constant get instance => _instance;
}
