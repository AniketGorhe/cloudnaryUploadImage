
//
//  Constants.swift
//  AppTemplate
//
//  Created by Rohit Patil on 2/12/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation
import MBProgressHUD

let APP_TITLE:String = "App Template"
let BUNDLE_IDENTIFIER = "com.zensar.rodnext1"
// Network
//let HOST:String = "http://www.visatech.shiksha/zenre/"
let HOST:String = "http://www.visatech.shiksha/zenre/feeds/"
//let HOST:String = "http://10.55.37.37:8080/reusable-php/"

// For AD
let HOSTNAME = "https://mobile.zensar.com/"

// App Components
let NETWORK_API = "Network API"
let LAZY_LOADING = "Lazy Loading"

// User List
let USERS_LIST = "Users List"

let Twitter_Consumer_Key = "s43C8T8GxTPBpKla2DfoOGL7m"
let Twitter_Consumer_Secret_Key = "jdG9x7PcKO5MQHbIbMzfpc3aanELoFMzbT8ePd9fAGC7KN6rQ7"

let linkedInKey = "81jyq5vhm5dw39"
let linkedInSecret = "ea5KYymuBxvENnYk"

let Google_ClientID = "381462279466-53br183ae4slulh2kj3qbas67pus83tc.apps.googleusercontent.com"

func showLoading(view : UIView, lodingMessage: String? = "Loading"){
    let spinnerActivity = MBProgressHUD.showAdded(to: view, animated: true)
    spinnerActivity.label.text = "Loading";
    //    spinnerActivity.detailsLabel.text = "Please Wait!!";
}
func hideLoading(view : UIView) {
    MBProgressHUD.hide(for: view, animated: true)
}



// FeedsApp
let LOGIN_TOKEN = "LOGIN_TOKEN"
let VERSION_NUMBER = "VERSION"
let CATEGORY_LIST = "CATEGORIES"
let RESOURCES_LIST = "RESOURCES"
let QUIZ_STATUS = "QUIZSTATUS"
let VIDEO_BYTE_STATUS = "VIDEOBYTESTATUS"
let ABOUT_US = "ABOUTUS"
let PROFILE_MODAL_ARRAY = "profileModalArray"

let ID = "id"
let FIRST_NAME = "firstName"
let LAST_NAME = "lastName"
let FULL_NAME = "fullName"
let USERNAME = "username"
let EMAILID = "emailId"
let EMPLOYEEID = "employeeId"
let PROFILE_PIC_URL = "profilePicUrl"
let PROFILE_PIC = "ProfilePic"
let DEVICE_TOKEN = "DEVICE_TOKEN"
let LOGIN_SUCCESSFUL_NOTIFICATION = "LOGIN_SUCCESSFUL_NOTIFICATION"
let LOGIN_CANCELED_NOTIFICATION = "LOGIN_CANCELED_NOTIFICATION"
let OK = "OK"
let LOADING = "Loading"
let SERVER_ERROR = "There is a problem with the server, please try again later!"
let ERROR = "Error"
let INVALID_USERID_MSG = "Please enter a valid User Name"
let INVALID_PASSWORD_LENGTH = "Password should have minimum 8 characters"

let QUIZ_SUBMITTED_MSG = "You have been successfully onboarded to Zensar's RoD Next mission."
let ASK_FEEDBACK_MSG = " As a proud Zensarian share your excitement with rest of the organization (less than 25 characters)."
let SUBMITTED_FEEDBACK_MSG = "Thanks for sharing what you feel about RoD NeXT. Your thoughts have been captured below."
let ASK_VIDEO_BYTE_MSG = "Let's get interactive. We would love to have your video byte on RoD NeXT."
let SUBMITTED_VIDEO_BYTE_MSG = "Thanks for submitting your video. We are happy to have heard from you."

// Colors
let LIGHT_WHITE_COLOR = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
let BACKGROUND = UIColor(red: 110.0/255.0, green: 122.0/255.0, blue: 136.0/255.0, alpha: 1.0)
let BUTTON_COLOR = UIColor(red: 33.0/255.0, green: 48.0/255.0, blue: 72.0/255.0, alpha: 1.0)
let BUTTON_SELECTED_COLOR = UIColor(red: 121/255.0, green: 130/255.0, blue: 145/255.0, alpha: 1)
let BUTTON_LIGHT_COLOR = UIColor(red: 27/255.0, green: 79/255.0, blue: 114/255.0, alpha: 1)

let NAVIGATION_BAR_COLOUR = UIColor(red: 0/255.0, green: 171/255.0, blue: 240/255.0, alpha: 1)
let TEXT_COLOR_REGULAR = UIColor(red: 33/255.0, green: 48/255.0, blue: 72/255.0, alpha: 1)
let BRIGHT_COLOR_REGULAR = UIColor(red: 110/255.0, green: 244/255.0, blue: 254/255.0, alpha: 1)
let TEXT_COLOR_DARK = UIColor(red: 193/255.0, green: 193/255.0, blue: 193/255.0, alpha: 1)
let TABLE_BACKGROUND = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1)
let LINE_COLOR = UIColor(red: 215/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1)
let LINE_COLOR_DARK = UIColor(red: 193/255.0, green: 193/255.0, blue: 193/255.0, alpha: 1)


//New colors
let BLUE_DARK = hexStringToUIColor(hex: "#6898ae")
let BLUE_FAINT = hexStringToUIColor(hex: "#4c75c6")
let GREEN_AT = hexStringToUIColor(hex: "#00db00")
let FAINT_AT = hexStringToUIColor(hex:"#bcbcbc")
let MEDIUM_AT = hexStringToUIColor(hex:"#989898")
let GRAY_AT = hexStringToUIColor(hex:"#747474")
let BLACK_AT = hexStringToUIColor(hex:"#000000")
let PINK_AT = hexStringToUIColor(hex:"#df1661")

let PINK_THEME = hexStringToUIColor(hex:"#DF166A")
//let TEXT_COLOR = hexStringToUIColor(hex:"#A51769")

let APP_THEME_PRIMARY = hexStringToUIColor(hex:"#1A4D67")
let APP_THEME_SECONDARY = hexStringToUIColor(hex:"#032838")
let TEXT_COLOR = hexStringToUIColor(hex:"#999999")
let BUTTON_GRAY_COLOR = hexStringToUIColor(hex:"#808080")
let BUTTON_GREEN_COLOR = hexStringToUIColor(hex:"#194C66")

let contactUsEmail = "ZenRodNext@zensar.com"
let LOGIN_URL  = "https://verse.perpetualdigit.com/com.zensar.aws.ldap/login/authenticateUser"
let ENCRYPTED_TOKEN = "encryptedToken"

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    
    
}
