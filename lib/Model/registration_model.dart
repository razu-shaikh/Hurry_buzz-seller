
const String _jsonKeyRegistrationSuccess = 'success';
const String _jsonKeyRegistrationMessage = 'message';
const String _jsonKeyRegistrationData = 'data';
const String _jsonKeyRegistrationDataToken = 'token';
const String _jsonKeyRegistrationDataUser = 'user';
const String _jsonKeyRegistrationDataUserId = 'id';
const String _jsonKeyRegistrationDataUserEmail = 'email';
const String _jsonKeyRegistrationDataUserPhone = 'phone';
const String _jsonKeyRegistrationDataUserFirstName = 'first_name';
const String _jsonKeyRegistrationDataUserLastName = 'last_name';
const String _jsonKeyRegistrationDataUserUserType = 'user_type';
const String _jsonKeyRegistrationDataUserGender = 'gender';
const String _jsonKeyRegistrationDataUserDateOfBirth = 'date_of_birth';
const String _jsonKeyRegistrationDataUserStatus = 'status';
const String _jsonKeyRegistrationDataUserIsUserBanned = 'is_user_banned';
const String _jsonKeyRegistrationDataUserNewsletterEnable = 'newsletter_enable';
const String _jsonKeyRegistrationDataUserOtp = 'otp';
const String _jsonKeyRegistrationDataUserFirebaseAuthId = 'firebase_auth_id';
const String _jsonKeyRegistrationDataUserIsPasswordSet = 'is_password_set';
const String _jsonKeyRegistrationDataUserLastLogin = 'last_login';
const String _jsonKeyRegistrationDataUserLastIp = 'last_ip';
const String _jsonKeyRegistrationDataUserLastPasswordChange = 'last_password_change';
const String _jsonKeyRegistrationDataUserImageId = 'image_id';
const String _jsonKeyRegistrationDataUserRoleId = 'role_id';
const String _jsonKeyRegistrationDataUserPickupHubId = 'pickup_hub_id';
const String _jsonKeyRegistrationDataUserBalance = 'balance';
const String _jsonKeyRegistrationDataUserCreatedAt = 'created_at';
const String _jsonKeyRegistrationDataUserUpdatedAt = 'updated_at';
const String _jsonKeyRegistrationDataUserProfileImage = 'profile_image';
const String _jsonKeyRegistrationDataUserUserProfileImage = 'user_profile_image';
const String _jsonKeyRegistrationDataUserFullName = 'full_name';
const String _jsonKeyRegistrationDataUserLastRecharge = 'last_recharge';
const String _jsonKeyRegistrationDataUserSellerProfile = 'seller_profile';
const String _jsonKeyRegistrationDataUserSellerProfileId = 'id';
const String _jsonKeyRegistrationDataUserSellerProfileUserId = 'user_id';
const String _jsonKeyRegistrationDataUserSellerProfileShopName = 'shop_name';
const String _jsonKeyRegistrationDataUserSellerProfileSlug = 'slug';
const String _jsonKeyRegistrationDataUserSellerProfileVerifiedAt = 'verified_at';
const String _jsonKeyRegistrationDataUserSellerProfileLicenseNo = 'license_no';
const String _jsonKeyRegistrationDataUserSellerProfileShopBannerId = 'shop_banner_id';
const String _jsonKeyRegistrationDataUserSellerProfileShopTagline = 'shop_tagline';
const String _jsonKeyRegistrationDataUserSellerProfilePhoneNo = 'phone_no';
const String _jsonKeyRegistrationDataUserSellerProfileShopEmail = 'shop_email';
const String _jsonKeyRegistrationDataUserSellerProfileWebsite = 'website';
const String _jsonKeyRegistrationDataUserSellerProfileAddress = 'address';
const String _jsonKeyRegistrationDataUserSellerProfileRatingCount = 'rating_count';
const String _jsonKeyRegistrationDataUserSellerProfileReviewsCount = 'reviews_count';
const String _jsonKeyRegistrationDataUserSellerProfileFacebook = 'facebook';
const String _jsonKeyRegistrationDataUserSellerProfileGoogle = 'google';
const String _jsonKeyRegistrationDataUserSellerProfileTwitter = 'twitter';
const String _jsonKeyRegistrationDataUserSellerProfileYoutube = 'youtube';
const String _jsonKeyRegistrationDataUserSellerProfileMetaTitle = 'meta_title';
const String _jsonKeyRegistrationDataUserSellerProfileMetaDescription = 'meta_description';
const String _jsonKeyRegistrationDataUserSellerProfileStateId = 'state_id';
const String _jsonKeyRegistrationDataUserSellerProfileCityId = 'city_id';
const String _jsonKeyRegistrationDataUserSellerProfileTownId = 'town_id';
const String _jsonKeyRegistrationDataUserSellerProfileLatitude = 'latitude';
const String _jsonKeyRegistrationDataUserSellerProfileLongitude = 'longitude';
const String _jsonKeyRegistrationDataUserSellerProfileScheduleId = 'schedule_id';
const String _jsonKeyRegistrationDataUserSellerProfileAccountType = 'account_type';
const String _jsonKeyRegistrationDataUserSellerProfileShopTypeId = 'shop_type_id';
const String _jsonKeyRegistrationDataUserSellerProfileCreatedAt = 'created_at';
const String _jsonKeyRegistrationDataUserSellerProfileUpdatedAt = 'updated_at';
const String _jsonKeyRegistrationDataUserSellerProfileImage_105x75 = 'image_105x75';
const String _jsonKeyRegistrationDataUserSellerProfileImage_197x152 = 'image_197x152';
const String _jsonKeyRegistrationDataUserSellerProfileImage_1905x350 = 'image_1905x350';
const String _jsonKeyRegistrationDataUserSellerProfileImage_90x60 = 'image_90x60';
const String _jsonKeyRegistrationDataUserSellerProfileImage_82x82 = 'image_82x82';
const String _jsonKeyRegistrationDataUserSellerProfileImage_120x80 = 'image_120x80';
const String _jsonKeyRegistrationDataUserSellerProfileImage_297x146 = 'image_297x146';
const String _jsonKeyRegistrationDataUserSellerProfileImage_617x145 = 'image_617x145';
const String _jsonKeyRegistrationDataUserSellerProfileStartDate = 'start_date';
const String _jsonKeyRegistrationDataUserSellerProfileImage_1920x412 = 'image_1920x412';
class RegistrationDataUserSellerProfile {


  int? id;
  String? userId;
  String? shopName;
  String? slug;
  String? verifiedAt;
  String? licenseNo;
  String? shopBannerId;
  String? shopTagline;
  String? phoneNo;
  String? shopEmail;
  String? website;
  String? address;
  String? ratingCount;
  String? reviewsCount;
  String? facebook;
  String? google;
  String? twitter;
  String? youtube;
  String? metaTitle;
  String? metaDescription;
  String? stateId;
  String? cityId;
  String? townId;
  String? latitude;
  String? longitude;
  String? scheduleId;
  String? accountType;
  String? shopTypeId;
  String? createdAt;
  String? updatedAt;
  String? image_105x75;
  String? image_197x152;
  String? image_1905x350;
  String? image_90x60;
  String? image_82x82;
  String? image_120x80;
  String? image_297x146;
  String? image_617x145;
  String? startDate;
  String? image_1920x412;

  RegistrationDataUserSellerProfile({
    this.id,
    this.userId,
    this.shopName,
    this.slug,
    this.verifiedAt,
    this.licenseNo,
    this.shopBannerId,
    this.shopTagline,
    this.phoneNo,
    this.shopEmail,
    this.website,
    this.address,
    this.ratingCount,
    this.reviewsCount,
    this.facebook,
    this.google,
    this.twitter,
    this.youtube,
    this.metaTitle,
    this.metaDescription,
    this.stateId,
    this.cityId,
    this.townId,
    this.latitude,
    this.longitude,
    this.scheduleId,
    this.accountType,
    this.shopTypeId,
    this.createdAt,
    this.updatedAt,
    this.image_105x75,
    this.image_197x152,
    this.image_1905x350,
    this.image_90x60,
    this.image_82x82,
    this.image_120x80,
    this.image_297x146,
    this.image_617x145,
    this.startDate,
    this.image_1920x412,
  });
  RegistrationDataUserSellerProfile.fromJson(Map<String, dynamic> json) {
    id = json[_jsonKeyRegistrationDataUserSellerProfileId]?.toInt();
    userId = json[_jsonKeyRegistrationDataUserSellerProfileUserId]?.toString();
    shopName = json[_jsonKeyRegistrationDataUserSellerProfileShopName]?.toString();
    slug = json[_jsonKeyRegistrationDataUserSellerProfileSlug]?.toString();
    verifiedAt = json[_jsonKeyRegistrationDataUserSellerProfileVerifiedAt]?.toString();
    licenseNo = json[_jsonKeyRegistrationDataUserSellerProfileLicenseNo]?.toString();
    shopBannerId = json[_jsonKeyRegistrationDataUserSellerProfileShopBannerId]?.toString();
    shopTagline = json[_jsonKeyRegistrationDataUserSellerProfileShopTagline]?.toString();
    phoneNo = json[_jsonKeyRegistrationDataUserSellerProfilePhoneNo]?.toString();
    shopEmail = json[_jsonKeyRegistrationDataUserSellerProfileShopEmail]?.toString();
    website = json[_jsonKeyRegistrationDataUserSellerProfileWebsite]?.toString();
    address = json[_jsonKeyRegistrationDataUserSellerProfileAddress]?.toString();
    ratingCount = json[_jsonKeyRegistrationDataUserSellerProfileRatingCount]?.toString();
    reviewsCount = json[_jsonKeyRegistrationDataUserSellerProfileReviewsCount]?.toString();
    facebook = json[_jsonKeyRegistrationDataUserSellerProfileFacebook]?.toString();
    google = json[_jsonKeyRegistrationDataUserSellerProfileGoogle]?.toString();
    twitter = json[_jsonKeyRegistrationDataUserSellerProfileTwitter]?.toString();
    youtube = json[_jsonKeyRegistrationDataUserSellerProfileYoutube]?.toString();
    metaTitle = json[_jsonKeyRegistrationDataUserSellerProfileMetaTitle]?.toString();
    metaDescription = json[_jsonKeyRegistrationDataUserSellerProfileMetaDescription]?.toString();
    stateId = json[_jsonKeyRegistrationDataUserSellerProfileStateId]?.toString();
    cityId = json[_jsonKeyRegistrationDataUserSellerProfileCityId]?.toString();
    townId = json[_jsonKeyRegistrationDataUserSellerProfileTownId]?.toString();
    latitude = json[_jsonKeyRegistrationDataUserSellerProfileLatitude]?.toString();
    longitude = json[_jsonKeyRegistrationDataUserSellerProfileLongitude]?.toString();
    scheduleId = json[_jsonKeyRegistrationDataUserSellerProfileScheduleId]?.toString();
    accountType = json[_jsonKeyRegistrationDataUserSellerProfileAccountType]?.toString();
    shopTypeId = json[_jsonKeyRegistrationDataUserSellerProfileShopTypeId]?.toString();
    createdAt = json[_jsonKeyRegistrationDataUserSellerProfileCreatedAt]?.toString();
    updatedAt = json[_jsonKeyRegistrationDataUserSellerProfileUpdatedAt]?.toString();
    image_105x75 = json[_jsonKeyRegistrationDataUserSellerProfileImage_105x75]?.toString();
    image_197x152 = json[_jsonKeyRegistrationDataUserSellerProfileImage_197x152]?.toString();
    image_1905x350 = json[_jsonKeyRegistrationDataUserSellerProfileImage_1905x350]?.toString();
    image_90x60 = json[_jsonKeyRegistrationDataUserSellerProfileImage_90x60]?.toString();
    image_82x82 = json[_jsonKeyRegistrationDataUserSellerProfileImage_82x82]?.toString();
    image_120x80 = json[_jsonKeyRegistrationDataUserSellerProfileImage_120x80]?.toString();
    image_297x146 = json[_jsonKeyRegistrationDataUserSellerProfileImage_297x146]?.toString();
    image_617x145 = json[_jsonKeyRegistrationDataUserSellerProfileImage_617x145]?.toString();
    startDate = json[_jsonKeyRegistrationDataUserSellerProfileStartDate]?.toString();
    image_1920x412 = json[_jsonKeyRegistrationDataUserSellerProfileImage_1920x412]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegistrationDataUserSellerProfileId] = id;
    data[_jsonKeyRegistrationDataUserSellerProfileUserId] = userId;
    data[_jsonKeyRegistrationDataUserSellerProfileShopName] = shopName;
    data[_jsonKeyRegistrationDataUserSellerProfileSlug] = slug;
    data[_jsonKeyRegistrationDataUserSellerProfileVerifiedAt] = verifiedAt;
    data[_jsonKeyRegistrationDataUserSellerProfileLicenseNo] = licenseNo;
    data[_jsonKeyRegistrationDataUserSellerProfileShopBannerId] = shopBannerId;
    data[_jsonKeyRegistrationDataUserSellerProfileShopTagline] = shopTagline;
    data[_jsonKeyRegistrationDataUserSellerProfilePhoneNo] = phoneNo;
    data[_jsonKeyRegistrationDataUserSellerProfileShopEmail] = shopEmail;
    data[_jsonKeyRegistrationDataUserSellerProfileWebsite] = website;
    data[_jsonKeyRegistrationDataUserSellerProfileAddress] = address;
    data[_jsonKeyRegistrationDataUserSellerProfileRatingCount] = ratingCount;
    data[_jsonKeyRegistrationDataUserSellerProfileReviewsCount] = reviewsCount;
    data[_jsonKeyRegistrationDataUserSellerProfileFacebook] = facebook;
    data[_jsonKeyRegistrationDataUserSellerProfileGoogle] = google;
    data[_jsonKeyRegistrationDataUserSellerProfileTwitter] = twitter;
    data[_jsonKeyRegistrationDataUserSellerProfileYoutube] = youtube;
    data[_jsonKeyRegistrationDataUserSellerProfileMetaTitle] = metaTitle;
    data[_jsonKeyRegistrationDataUserSellerProfileMetaDescription] = metaDescription;
    data[_jsonKeyRegistrationDataUserSellerProfileStateId] = stateId;
    data[_jsonKeyRegistrationDataUserSellerProfileCityId] = cityId;
    data[_jsonKeyRegistrationDataUserSellerProfileTownId] = townId;
    data[_jsonKeyRegistrationDataUserSellerProfileLatitude] = latitude;
    data[_jsonKeyRegistrationDataUserSellerProfileLongitude] = longitude;
    data[_jsonKeyRegistrationDataUserSellerProfileScheduleId] = scheduleId;
    data[_jsonKeyRegistrationDataUserSellerProfileAccountType] = accountType;
    data[_jsonKeyRegistrationDataUserSellerProfileShopTypeId] = shopTypeId;
    data[_jsonKeyRegistrationDataUserSellerProfileCreatedAt] = createdAt;
    data[_jsonKeyRegistrationDataUserSellerProfileUpdatedAt] = updatedAt;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_105x75] = image_105x75;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_197x152] = image_197x152;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_1905x350] = image_1905x350;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_90x60] = image_90x60;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_82x82] = image_82x82;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_120x80] = image_120x80;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_297x146] = image_297x146;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_617x145] = image_617x145;
    data[_jsonKeyRegistrationDataUserSellerProfileStartDate] = startDate;
    data[_jsonKeyRegistrationDataUserSellerProfileImage_1920x412] = image_1920x412;
    return data;
  }
}

class RegistrationDataUser {
  int? id;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  String? userType;
  String? gender;
  String? dateOfBirth;
  String? status;
  String? isUserBanned;
  String? newsletterEnable;
  String? otp;
  String? firebaseAuthId;
  String? isPasswordSet;
  String? lastLogin;
  String? lastIp;
  String? lastPasswordChange;
  String? imageId;
  String? roleId;
  String? pickupHubId;
  String? balance;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? userProfileImage;
  String? fullName;
  int? lastRecharge;
  RegistrationDataUserSellerProfile? sellerProfile;

  RegistrationDataUser({
    this.id,
    this.email,
    this.phone,
    this.firstName,
    this.lastName,
    this.userType,
    this.gender,
    this.dateOfBirth,
    this.status,
    this.isUserBanned,
    this.newsletterEnable,
    this.otp,
    this.firebaseAuthId,
    this.isPasswordSet,
    this.lastLogin,
    this.lastIp,
    this.lastPasswordChange,
    this.imageId,
    this.roleId,
    this.pickupHubId,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.userProfileImage,
    this.fullName,
    this.lastRecharge,
    this.sellerProfile,
  });
  RegistrationDataUser.fromJson(Map<String, dynamic> json) {
    id = json[_jsonKeyRegistrationDataUserId]?.toInt();
    email = json[_jsonKeyRegistrationDataUserEmail]?.toString();
    phone = json[_jsonKeyRegistrationDataUserPhone]?.toString();
    firstName = json[_jsonKeyRegistrationDataUserFirstName]?.toString();
    lastName = json[_jsonKeyRegistrationDataUserLastName]?.toString();
    userType = json[_jsonKeyRegistrationDataUserUserType]?.toString();
    gender = json[_jsonKeyRegistrationDataUserGender]?.toString();
    dateOfBirth = json[_jsonKeyRegistrationDataUserDateOfBirth]?.toString();
    status = json[_jsonKeyRegistrationDataUserStatus]?.toString();
    isUserBanned = json[_jsonKeyRegistrationDataUserIsUserBanned]?.toString();
    newsletterEnable = json[_jsonKeyRegistrationDataUserNewsletterEnable]?.toString();
    otp = json[_jsonKeyRegistrationDataUserOtp]?.toString();
    firebaseAuthId = json[_jsonKeyRegistrationDataUserFirebaseAuthId]?.toString();
    isPasswordSet = json[_jsonKeyRegistrationDataUserIsPasswordSet]?.toString();
    lastLogin = json[_jsonKeyRegistrationDataUserLastLogin]?.toString();
    lastIp = json[_jsonKeyRegistrationDataUserLastIp]?.toString();
    lastPasswordChange = json[_jsonKeyRegistrationDataUserLastPasswordChange]?.toString();
    imageId = json[_jsonKeyRegistrationDataUserImageId]?.toString();
    roleId = json[_jsonKeyRegistrationDataUserRoleId]?.toString();
    pickupHubId = json[_jsonKeyRegistrationDataUserPickupHubId]?.toString();
    balance = json[_jsonKeyRegistrationDataUserBalance]?.toString();
    createdAt = json[_jsonKeyRegistrationDataUserCreatedAt]?.toString();
    updatedAt = json[_jsonKeyRegistrationDataUserUpdatedAt]?.toString();
    profileImage = json[_jsonKeyRegistrationDataUserProfileImage]?.toString();
    userProfileImage = json[_jsonKeyRegistrationDataUserUserProfileImage]?.toString();
    fullName = json[_jsonKeyRegistrationDataUserFullName]?.toString();
    lastRecharge = json[_jsonKeyRegistrationDataUserLastRecharge]?.toInt();
    sellerProfile = (json[_jsonKeyRegistrationDataUserSellerProfile] != null) ? RegistrationDataUserSellerProfile.fromJson(json[_jsonKeyRegistrationDataUserSellerProfile]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegistrationDataUserId] = id;
    data[_jsonKeyRegistrationDataUserEmail] = email;
    data[_jsonKeyRegistrationDataUserPhone] = phone;
    data[_jsonKeyRegistrationDataUserFirstName] = firstName;
    data[_jsonKeyRegistrationDataUserLastName] = lastName;
    data[_jsonKeyRegistrationDataUserUserType] = userType;
    data[_jsonKeyRegistrationDataUserGender] = gender;
    data[_jsonKeyRegistrationDataUserDateOfBirth] = dateOfBirth;
    data[_jsonKeyRegistrationDataUserStatus] = status;
    data[_jsonKeyRegistrationDataUserIsUserBanned] = isUserBanned;
    data[_jsonKeyRegistrationDataUserNewsletterEnable] = newsletterEnable;
    data[_jsonKeyRegistrationDataUserOtp] = otp;
    data[_jsonKeyRegistrationDataUserFirebaseAuthId] = firebaseAuthId;
    data[_jsonKeyRegistrationDataUserIsPasswordSet] = isPasswordSet;
    data[_jsonKeyRegistrationDataUserLastLogin] = lastLogin;
    data[_jsonKeyRegistrationDataUserLastIp] = lastIp;
    data[_jsonKeyRegistrationDataUserLastPasswordChange] = lastPasswordChange;
    data[_jsonKeyRegistrationDataUserImageId] = imageId;
    data[_jsonKeyRegistrationDataUserRoleId] = roleId;
    data[_jsonKeyRegistrationDataUserPickupHubId] = pickupHubId;
    data[_jsonKeyRegistrationDataUserBalance] = balance;
    data[_jsonKeyRegistrationDataUserCreatedAt] = createdAt;
    data[_jsonKeyRegistrationDataUserUpdatedAt] = updatedAt;
    data[_jsonKeyRegistrationDataUserProfileImage] = profileImage;
    data[_jsonKeyRegistrationDataUserUserProfileImage] = userProfileImage;
    data[_jsonKeyRegistrationDataUserFullName] = fullName;
    data[_jsonKeyRegistrationDataUserLastRecharge] = lastRecharge;
    if (sellerProfile != null) {
      data[_jsonKeyRegistrationDataUserSellerProfile] = sellerProfile!.toJson();
    }
    return data;
  }
}

class RegistrationData {

  String? token;
  RegistrationDataUser? user;

  RegistrationData({
    this.token,
    this.user,
  });
  RegistrationData.fromJson(Map<String, dynamic> json) {
    token = json[_jsonKeyRegistrationDataToken]?.toString();
    user = (json[_jsonKeyRegistrationDataUser] != null) ? RegistrationDataUser.fromJson(json[_jsonKeyRegistrationDataUser]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegistrationDataToken] = token;
    if (user != null) {
      data[_jsonKeyRegistrationDataUser] = user!.toJson();
    }
    return data;
  }
}

class Registration {
  bool? success;
  String? message;
  RegistrationData? data;

  Registration({
    this.success,
    this.message,
    this.data,
  });
  Registration.fromJson(Map<String, dynamic> json) {
    success = json[_jsonKeyRegistrationSuccess];
    message = json[_jsonKeyRegistrationMessage]?.toString();
    data = (json[_jsonKeyRegistrationData] != null) ? RegistrationData.fromJson(json[_jsonKeyRegistrationData]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegistrationSuccess] = success;
    data[_jsonKeyRegistrationMessage] = message;
    if (data != null) {
      data[_jsonKeyRegistrationData] = this.data!.toJson();
    }
    return data;
  }
}
