
const String _jsonKeyProfileUser = 'user';
const String _jsonKeyProfileUserId = 'id';
const String _jsonKeyProfileUserEmail = 'email';
const String _jsonKeyProfileUserPhone = 'phone';
const String _jsonKeyProfileUserFirstName = 'first_name';
const String _jsonKeyProfileUserLastName = 'last_name';
const String _jsonKeyProfileUserUserType = 'user_type';
const String _jsonKeyProfileUserGender = 'gender';
const String _jsonKeyProfileUserDateOfBirth = 'date_of_birth';
const String _jsonKeyProfileUserStatus = 'status';
const String _jsonKeyProfileUserIsUserBanned = 'is_user_banned';
const String _jsonKeyProfileUserNewsletterEnable = 'newsletter_enable';
const String _jsonKeyProfileUserOtp = 'otp';
const String _jsonKeyProfileUserFirebaseAuthId = 'firebase_auth_id';
const String _jsonKeyProfileUserIsPasswordSet = 'is_password_set';
const String _jsonKeyProfileUserLastLogin = 'last_login';
const String _jsonKeyProfileUserLastIp = 'last_ip';
const String _jsonKeyProfileUserLastPasswordChange = 'last_password_change';
const String _jsonKeyProfileUserImageId = 'image_id';
const String _jsonKeyProfileUserRoleId = 'role_id';
const String _jsonKeyProfileUserPickupHubId = 'pickup_hub_id';
const String _jsonKeyProfileUserBalance = 'balance';
const String _jsonKeyProfileUserCreatedAt = 'created_at';
const String _jsonKeyProfileUserUpdatedAt = 'updated_at';
const String _jsonKeyProfileUserProfileImage = 'profile_image';
const String _jsonKeyProfileUserUserProfileImage = 'user_profile_image';
const String _jsonKeyProfileUserFullName = 'full_name';
const String _jsonKeyProfileUserLastRecharge = 'last_recharge';
const String _jsonKeyProfileUserSellerProfile = 'seller_profile';
const String _jsonKeyProfileUserSellerProfileId = 'id';
const String _jsonKeyProfileUserSellerProfileUserId = 'user_id';
const String _jsonKeyProfileUserSellerProfileShopName = 'shop_name';
const String _jsonKeyProfileUserSellerProfileSlug = 'slug';
const String _jsonKeyProfileUserSellerProfileVerifiedAt = 'verified_at';
const String _jsonKeyProfileUserSellerProfileLicenseNo = 'license_no';
const String _jsonKeyProfileUserSellerProfileShopPageContents = 'shop_page_contents';
const String _jsonKeyProfileUserSellerProfileShopBannerId = 'shop_banner_id';
const String _jsonKeyProfileUserSellerProfileShopTagline = 'shop_tagline';
const String _jsonKeyProfileUserSellerProfilePhoneNo = 'phone_no';
const String _jsonKeyProfileUserSellerProfileShopEmail = 'shop_email';
const String _jsonKeyProfileUserSellerProfileWebsite = 'website';
const String _jsonKeyProfileUserSellerProfileAddress = 'address';
const String _jsonKeyProfileUserSellerProfileRatingCount = 'rating_count';
const String _jsonKeyProfileUserSellerProfileReviewsCount = 'reviews_count';
const String _jsonKeyProfileUserSellerProfileFacebook = 'facebook';
const String _jsonKeyProfileUserSellerProfileGoogle = 'google';
const String _jsonKeyProfileUserSellerProfileTwitter = 'twitter';
const String _jsonKeyProfileUserSellerProfileYoutube = 'youtube';
const String _jsonKeyProfileUserSellerProfileMetaTitle = 'meta_title';
const String _jsonKeyProfileUserSellerProfileMetaDescription = 'meta_description';
const String _jsonKeyProfileUserSellerProfileStateId = 'state_id';
const String _jsonKeyProfileUserSellerProfileCityId = 'city_id';
const String _jsonKeyProfileUserSellerProfileTownId = 'town_id';
const String _jsonKeyProfileUserSellerProfileLatitude = 'latitude';
const String _jsonKeyProfileUserSellerProfileLongitude = 'longitude';
const String _jsonKeyProfileUserSellerProfileScheduleId = 'schedule_id';
const String _jsonKeyProfileUserSellerProfileAccountType = 'account_type';
const String _jsonKeyProfileUserSellerProfileShopTypeId = 'shop_type_id';
const String _jsonKeyProfileUserSellerProfileCreatedAt = 'created_at';
const String _jsonKeyProfileUserSellerProfileUpdatedAt = 'updated_at';
const String _jsonKeyProfileUserSellerProfileImage_105x75 = 'image_105x75';
const String _jsonKeyProfileUserSellerProfileImage_197x152 = 'image_197x152';
const String _jsonKeyProfileUserSellerProfileImage_1905x350 = 'image_1905x350';
const String _jsonKeyProfileUserSellerProfileImage_90x60 = 'image_90x60';
const String _jsonKeyProfileUserSellerProfileImage_82x82 = 'image_82x82';
const String _jsonKeyProfileUserSellerProfileImage_120x80 = 'image_120x80';
const String _jsonKeyProfileUserSellerProfileImage_297x146 = 'image_297x146';
const String _jsonKeyProfileUserSellerProfileImage_617x145 = 'image_617x145';
const String _jsonKeyProfileUserSellerProfileStartDate = 'start_date';
const String _jsonKeyProfileUserSellerProfileImage_1920x412 = 'image_1920x412';
const String _jsonKeyProfileUserSellerProfileShopPageContentsNewArrival = 'new_arrival';
class ProfileUserSellerProfileShopPageContents {
/*
{
  "new_arrival": "1"
}
*/

  String? newArrival;

  ProfileUserSellerProfileShopPageContents({
    this.newArrival,
  });
  ProfileUserSellerProfileShopPageContents.fromJson(Map<String, dynamic> json) {
    newArrival = json[_jsonKeyProfileUserSellerProfileShopPageContentsNewArrival]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyProfileUserSellerProfileShopPageContentsNewArrival] = newArrival;
    return data;
  }
}

class ProfileUserSellerProfile {
  int? id;
  String? userId;
  String? shopName;
  String? slug;
  String? verifiedAt;
  String? licenseNo;
  List<ProfileUserSellerProfileShopPageContents?>? shopPageContents;
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

  ProfileUserSellerProfile({
    this.id,
    this.userId,
    this.shopName,
    this.slug,
    this.verifiedAt,
    this.licenseNo,
    this.shopPageContents,
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
  ProfileUserSellerProfile.fromJson(Map<String, dynamic> json) {
    id = json[_jsonKeyProfileUserSellerProfileId]?.toInt();
    userId = json[_jsonKeyProfileUserSellerProfileUserId]?.toString();
    shopName = json[_jsonKeyProfileUserSellerProfileShopName]?.toString();
    slug = json[_jsonKeyProfileUserSellerProfileSlug]?.toString();
    verifiedAt = json[_jsonKeyProfileUserSellerProfileVerifiedAt]?.toString();
    licenseNo = json[_jsonKeyProfileUserSellerProfileLicenseNo]?.toString();
    if (json[_jsonKeyProfileUserSellerProfileShopPageContents] != null) {
      final v = json[_jsonKeyProfileUserSellerProfileShopPageContents];
      final arr0 = <ProfileUserSellerProfileShopPageContents>[];
      v.forEach((v) {
        arr0.add(ProfileUserSellerProfileShopPageContents.fromJson(v));
      });
      shopPageContents = arr0;
    }
    shopBannerId = json[_jsonKeyProfileUserSellerProfileShopBannerId]?.toString();
    shopTagline = json[_jsonKeyProfileUserSellerProfileShopTagline]?.toString();
    phoneNo = json[_jsonKeyProfileUserSellerProfilePhoneNo]?.toString();
    shopEmail = json[_jsonKeyProfileUserSellerProfileShopEmail]?.toString();
    website = json[_jsonKeyProfileUserSellerProfileWebsite]?.toString();
    address = json[_jsonKeyProfileUserSellerProfileAddress]?.toString();
    ratingCount = json[_jsonKeyProfileUserSellerProfileRatingCount]?.toString();
    reviewsCount = json[_jsonKeyProfileUserSellerProfileReviewsCount]?.toString();
    facebook = json[_jsonKeyProfileUserSellerProfileFacebook]?.toString();
    google = json[_jsonKeyProfileUserSellerProfileGoogle]?.toString();
    twitter = json[_jsonKeyProfileUserSellerProfileTwitter]?.toString();
    youtube = json[_jsonKeyProfileUserSellerProfileYoutube]?.toString();
    metaTitle = json[_jsonKeyProfileUserSellerProfileMetaTitle]?.toString();
    metaDescription = json[_jsonKeyProfileUserSellerProfileMetaDescription]?.toString();
    stateId = json[_jsonKeyProfileUserSellerProfileStateId]?.toString();
    cityId = json[_jsonKeyProfileUserSellerProfileCityId]?.toString();
    townId = json[_jsonKeyProfileUserSellerProfileTownId]?.toString();
    latitude = json[_jsonKeyProfileUserSellerProfileLatitude]?.toString();
    longitude = json[_jsonKeyProfileUserSellerProfileLongitude]?.toString();
    scheduleId = json[_jsonKeyProfileUserSellerProfileScheduleId]?.toString();
    accountType = json[_jsonKeyProfileUserSellerProfileAccountType]?.toString();
    shopTypeId = json[_jsonKeyProfileUserSellerProfileShopTypeId]?.toString();
    createdAt = json[_jsonKeyProfileUserSellerProfileCreatedAt]?.toString();
    updatedAt = json[_jsonKeyProfileUserSellerProfileUpdatedAt]?.toString();
    image_105x75 = json[_jsonKeyProfileUserSellerProfileImage_105x75]?.toString();
    image_197x152 = json[_jsonKeyProfileUserSellerProfileImage_197x152]?.toString();
    image_1905x350 = json[_jsonKeyProfileUserSellerProfileImage_1905x350]?.toString();
    image_90x60 = json[_jsonKeyProfileUserSellerProfileImage_90x60]?.toString();
    image_82x82 = json[_jsonKeyProfileUserSellerProfileImage_82x82]?.toString();
    image_120x80 = json[_jsonKeyProfileUserSellerProfileImage_120x80]?.toString();
    image_297x146 = json[_jsonKeyProfileUserSellerProfileImage_297x146]?.toString();
    image_617x145 = json[_jsonKeyProfileUserSellerProfileImage_617x145]?.toString();
    startDate = json[_jsonKeyProfileUserSellerProfileStartDate]?.toString();
    image_1920x412 = json[_jsonKeyProfileUserSellerProfileImage_1920x412]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyProfileUserSellerProfileId] = id;
    data[_jsonKeyProfileUserSellerProfileUserId] = userId;
    data[_jsonKeyProfileUserSellerProfileShopName] = shopName;
    data[_jsonKeyProfileUserSellerProfileSlug] = slug;
    data[_jsonKeyProfileUserSellerProfileVerifiedAt] = verifiedAt;
    data[_jsonKeyProfileUserSellerProfileLicenseNo] = licenseNo;
    if (shopPageContents != null) {
      final v = shopPageContents;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data[_jsonKeyProfileUserSellerProfileShopPageContents] = arr0;
    }
    data[_jsonKeyProfileUserSellerProfileShopBannerId] = shopBannerId;
    data[_jsonKeyProfileUserSellerProfileShopTagline] = shopTagline;
    data[_jsonKeyProfileUserSellerProfilePhoneNo] = phoneNo;
    data[_jsonKeyProfileUserSellerProfileShopEmail] = shopEmail;
    data[_jsonKeyProfileUserSellerProfileWebsite] = website;
    data[_jsonKeyProfileUserSellerProfileAddress] = address;
    data[_jsonKeyProfileUserSellerProfileRatingCount] = ratingCount;
    data[_jsonKeyProfileUserSellerProfileReviewsCount] = reviewsCount;
    data[_jsonKeyProfileUserSellerProfileFacebook] = facebook;
    data[_jsonKeyProfileUserSellerProfileGoogle] = google;
    data[_jsonKeyProfileUserSellerProfileTwitter] = twitter;
    data[_jsonKeyProfileUserSellerProfileYoutube] = youtube;
    data[_jsonKeyProfileUserSellerProfileMetaTitle] = metaTitle;
    data[_jsonKeyProfileUserSellerProfileMetaDescription] = metaDescription;
    data[_jsonKeyProfileUserSellerProfileStateId] = stateId;
    data[_jsonKeyProfileUserSellerProfileCityId] = cityId;
    data[_jsonKeyProfileUserSellerProfileTownId] = townId;
    data[_jsonKeyProfileUserSellerProfileLatitude] = latitude;
    data[_jsonKeyProfileUserSellerProfileLongitude] = longitude;
    data[_jsonKeyProfileUserSellerProfileScheduleId] = scheduleId;
    data[_jsonKeyProfileUserSellerProfileAccountType] = accountType;
    data[_jsonKeyProfileUserSellerProfileShopTypeId] = shopTypeId;
    data[_jsonKeyProfileUserSellerProfileCreatedAt] = createdAt;
    data[_jsonKeyProfileUserSellerProfileUpdatedAt] = updatedAt;
    data[_jsonKeyProfileUserSellerProfileImage_105x75] = image_105x75;
    data[_jsonKeyProfileUserSellerProfileImage_197x152] = image_197x152;
    data[_jsonKeyProfileUserSellerProfileImage_1905x350] = image_1905x350;
    data[_jsonKeyProfileUserSellerProfileImage_90x60] = image_90x60;
    data[_jsonKeyProfileUserSellerProfileImage_82x82] = image_82x82;
    data[_jsonKeyProfileUserSellerProfileImage_120x80] = image_120x80;
    data[_jsonKeyProfileUserSellerProfileImage_297x146] = image_297x146;
    data[_jsonKeyProfileUserSellerProfileImage_617x145] = image_617x145;
    data[_jsonKeyProfileUserSellerProfileStartDate] = startDate;
    data[_jsonKeyProfileUserSellerProfileImage_1920x412] = image_1920x412;
    return data;
  }
}

class ProfileUser {

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
  ProfileUserSellerProfile? sellerProfile;

  ProfileUser({
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
  ProfileUser.fromJson(Map<String, dynamic> json) {
    id = json[_jsonKeyProfileUserId]?.toInt();
    email = json[_jsonKeyProfileUserEmail]?.toString();
    phone = json[_jsonKeyProfileUserPhone]?.toString();
    firstName = json[_jsonKeyProfileUserFirstName]?.toString();
    lastName = json[_jsonKeyProfileUserLastName]?.toString();
    userType = json[_jsonKeyProfileUserUserType]?.toString();
    gender = json[_jsonKeyProfileUserGender]?.toString();
    dateOfBirth = json[_jsonKeyProfileUserDateOfBirth]?.toString();
    status = json[_jsonKeyProfileUserStatus]?.toString();
    isUserBanned = json[_jsonKeyProfileUserIsUserBanned]?.toString();
    newsletterEnable = json[_jsonKeyProfileUserNewsletterEnable]?.toString();
    otp = json[_jsonKeyProfileUserOtp]?.toString();
    firebaseAuthId = json[_jsonKeyProfileUserFirebaseAuthId]?.toString();
    isPasswordSet = json[_jsonKeyProfileUserIsPasswordSet]?.toString();
    lastLogin = json[_jsonKeyProfileUserLastLogin]?.toString();
    lastIp = json[_jsonKeyProfileUserLastIp]?.toString();
    lastPasswordChange = json[_jsonKeyProfileUserLastPasswordChange]?.toString();
    imageId = json[_jsonKeyProfileUserImageId]?.toString();
    roleId = json[_jsonKeyProfileUserRoleId]?.toString();
    pickupHubId = json[_jsonKeyProfileUserPickupHubId]?.toString();
    balance = json[_jsonKeyProfileUserBalance]?.toString();
    createdAt = json[_jsonKeyProfileUserCreatedAt]?.toString();
    updatedAt = json[_jsonKeyProfileUserUpdatedAt]?.toString();
    profileImage = json[_jsonKeyProfileUserProfileImage]?.toString();
    userProfileImage = json[_jsonKeyProfileUserUserProfileImage]?.toString();
    fullName = json[_jsonKeyProfileUserFullName]?.toString();
    lastRecharge = json[_jsonKeyProfileUserLastRecharge]?.toInt();
    sellerProfile = (json[_jsonKeyProfileUserSellerProfile] != null) ? ProfileUserSellerProfile.fromJson(json[_jsonKeyProfileUserSellerProfile]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyProfileUserId] = id;
    data[_jsonKeyProfileUserEmail] = email;
    data[_jsonKeyProfileUserPhone] = phone;
    data[_jsonKeyProfileUserFirstName] = firstName;
    data[_jsonKeyProfileUserLastName] = lastName;
    data[_jsonKeyProfileUserUserType] = userType;
    data[_jsonKeyProfileUserGender] = gender;
    data[_jsonKeyProfileUserDateOfBirth] = dateOfBirth;
    data[_jsonKeyProfileUserStatus] = status;
    data[_jsonKeyProfileUserIsUserBanned] = isUserBanned;
    data[_jsonKeyProfileUserNewsletterEnable] = newsletterEnable;
    data[_jsonKeyProfileUserOtp] = otp;
    data[_jsonKeyProfileUserFirebaseAuthId] = firebaseAuthId;
    data[_jsonKeyProfileUserIsPasswordSet] = isPasswordSet;
    data[_jsonKeyProfileUserLastLogin] = lastLogin;
    data[_jsonKeyProfileUserLastIp] = lastIp;
    data[_jsonKeyProfileUserLastPasswordChange] = lastPasswordChange;
    data[_jsonKeyProfileUserImageId] = imageId;
    data[_jsonKeyProfileUserRoleId] = roleId;
    data[_jsonKeyProfileUserPickupHubId] = pickupHubId;
    data[_jsonKeyProfileUserBalance] = balance;
    data[_jsonKeyProfileUserCreatedAt] = createdAt;
    data[_jsonKeyProfileUserUpdatedAt] = updatedAt;
    data[_jsonKeyProfileUserProfileImage] = profileImage;
    data[_jsonKeyProfileUserUserProfileImage] = userProfileImage;
    data[_jsonKeyProfileUserFullName] = fullName;
    data[_jsonKeyProfileUserLastRecharge] = lastRecharge;
    if (sellerProfile != null) {
      data[_jsonKeyProfileUserSellerProfile] = sellerProfile!.toJson();
    }
    return data;
  }
}

class Profile {

  ProfileUser? user;

  Profile({
    this.user,
  });
  Profile.fromJson(Map<String, dynamic> json) {
    user = (json[_jsonKeyProfileUser] != null) ? ProfileUser.fromJson(json[_jsonKeyProfileUser]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data[_jsonKeyProfileUser] = user!.toJson();
    }
    return data;
  }
}
