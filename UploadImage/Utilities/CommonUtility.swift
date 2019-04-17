//
//  CommonUtility.swift
//  Chatting
//
//  Created by Vantage Point analytics on 7/4/16.
//  Copyright © 2016 Zensar Technologies4. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MBProgressHUD
import MessageUI

let PDF_NAME = "tempName.pdf"
class CommonUtility: NSObject {
    
    
    class func showAlert(_ title : String, msg : String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertAction.Style.default, handler: nil))
        
        if let vc = getTopController() {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    class func getTopController() -> UIViewController?{
        var topController = UIApplication.shared.keyWindow?.rootViewController
        if (topController != nil) {
            while let presentedViewController = topController!.presentedViewController {
                topController = presentedViewController
            }
            return topController
            // topController should now be your topmost view controller
        }
        return nil
    }
    
    class func amountInProperFormat(_ amount: AnyObject) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        
        let total = numberFormatter.string(from: amount as! NSNumber)!
        return total
        
    }
    class func playMedia(_ url : URL){
        let player = AVPlayer(url: url as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        if let vc = getTopController() {
            playerController.view.frame = vc.view.frame
            vc.present(playerController, animated: true, completion: nil)
        }
        player.play()
    }
    
    class func getDateStringInProperFormat(_ date : String) -> String
    {
        var finalDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") as TimeZone!
        if let date = dateFormatter.date(from: date) {
            
            dateFormatter.dateFormat = "dd MMM,YYYY"
            finalDate = dateFormatter.string(from: date)
        }
        return finalDate
    }
    
    class func disableListningButton(sender : UIButton){
        sender.isUserInteractionEnabled =  false
        self.perform(#selector(CommonUtility.enablUserInteractionAfterDelay), with: sender, afterDelay: 2.0)
    }
    @objc class func enablUserInteractionAfterDelay(sender : UIButton){
        sender.isUserInteractionEnabled = true
    }

    class func showToast(msg : String){
        let hud = MBProgressHUD(view: UIApplication.shared.keyWindow!)
        UIApplication.shared.keyWindow!.addSubview(hud)
        hud.customView = UIImageView(image: UIImage(named: "menucheck"))
        hud.mode = MBProgressHUDMode.customView
        hud.label.text = msg
        hud.offset.y = 180.0
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: 3)
    }
    
    class func showLoadingWithMessage(onView:UIView, message:String) {
        
        let loadingView = MBProgressHUD(view: onView)
        onView.addSubview(loadingView)
        loadingView.label.text = message
        loadingView.show(animated: true)
    }
    
    class func hideLoadingIndicator(onView:UIView) {
        MBProgressHUD.hide(for: onView, animated: true)
    }
    
    class func showLoadingWithMessage(_ message:String) -> MBProgressHUD {
        
        let window = UIApplication.shared.windows[UIApplication.shared.windows.count - 1]
        let loadingView = MBProgressHUD.showAdded(to: window, animated: true)
        loadingView.label.text = message
        loadingView.hide(animated: true, afterDelay: 10) // Initially it was 2
        return loadingView
        
    }
    
    class func hideLoadingIndicator() {
        
        let window1 = UIApplication.shared.windows[UIApplication.shared.windows.count - 1]
        let window2 = ((UIApplication.shared.delegate?.window)!)! as UIWindow
        
        MBProgressHUD.hideAllHUDs(for: window1, animated: true)
        MBProgressHUD.hideAllHUDs(for: window2, animated: true)
        
    }
    
    class func encodeString(text : String) -> String {
        let allowedCharacterSet = (CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]^ ").inverted)
        let escapedText = text.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
        
        return escapedText!
    }
    
    class func getImageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let size = CGSize(width: 10.0, height: 10.0)
        _ = UIBezierPath (roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    
    class func saveCustomObjectInNSUserDefaults(_ object: AnyObject, key: String)
    {
        let encoadedObject = NSKeyedArchiver.archivedData(withRootObject: object) as Data
        UserDefaults.standard.set(encoadedObject, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func retrieveCustomObjectInNSUserDefaults(_ key: String) -> AnyObject
    {
        if let encoadedObject =  UserDefaults.standard.value(forKey: key) as? Data
        {
            let object = NSKeyedUnarchiver.unarchiveObject(with: encoadedObject)
            return object! as AnyObject
        }
        return "" as AnyObject;
    }
    
    class func getFormattedDate(dateStr:String) -> String {
        let deFormatter = DateFormatter()
        deFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        if let date = deFormatter.date(from: dateStr){
            deFormatter.dateFormat = "yyyy/MM/dd  hh:mm a"
            deFormatter.amSymbol = "AM"
            deFormatter.pmSymbol = "PM"
            let formattedDate = deFormatter.string(from: date)
            return formattedDate
        }
        else{
            return "Invalid Date"
        }
    }
    
    class var getUserId : String{
        return UserDefaults.standard.value(forKey: "userId") as! String
    }
    
    
    
    

    
    
    
    
    class func getGreet() -> String {
    
        let hour = Calendar.current.component(.hour, from: Date())
        
        var greetString = ""
        switch hour {
        case 6..<12 : greetString = "Good Morning"
        case 12..<17 : greetString = "Good Afternoon"
        case 17..<20 : greetString = "Good Evening"
        default: greetString = "Hello"
        }

        return greetString
    }

    class func openUIActivityViewController(aVC : UIViewController, urlToShare : String, subType: String) {
        
        var activityViewController : UIActivityViewController?
        if subType.caseInsensitiveCompare("pdf") == .orderedSame{
            
            
            
            let fileManager = FileManager.default
            let docsurl = try! fileManager.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let documentoPath = ( docsurl).appendingPathComponent(PDF_NAME)
            print(documentoPath.path)
            
            if fileManager.fileExists(atPath: documentoPath.path){
                let documentData = NSData(contentsOfFile: documentoPath.path)
                activityViewController = UIActivityViewController(activityItems: [documentData!], applicationActivities: nil)

            }
            else {
                print("document was not found")
                activityViewController = UIActivityViewController(activityItems: [urlToShare], applicationActivities: nil)
            }

        }else{
            activityViewController = UIActivityViewController(activityItems: [urlToShare], applicationActivities: nil)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityViewController!.popoverPresentationController?.sourceView = aVC.view // so that iPads won't crash

        }
        
        // exclude some activity types from the list (optional)
        //activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        aVC.present(activityViewController!, animated: true, completion: nil)

    }
    
    class func savePdf(urlString:String) {
        DispatchQueue.main.async {
            let url = URL(string: urlString)
            let pdfData = try? Data.init(contentsOf: url!)
            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
            let actualPath = resourceDocPath.appendingPathComponent(PDF_NAME)
            print(actualPath)
            do {
                try pdfData?.write(to: actualPath, options: .atomic)
                print("pdf successfully saved!")
            } catch {
                print("Pdf could not be saved")
            }
        }
    }


}
extension UIView {
    
    func applyShadow(){
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 2.0).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 3

        
        self.layer.insertSublayer(shadowLayer, at: 0)

    }
    
    func addBlurringEffect(){
        if !UIAccessibility.isReduceTransparencyEnabled {
            backgroundColor = .clear
            let blurEffect = UIBlurEffect(style: .regular)
            let vibracyEffect = UIVibrancyEffect(blurEffect: blurEffect)
            let blurEffectView = UIVisualEffectView(effect: vibracyEffect)
            blurEffectView.frame = bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            insertSubview(blurEffectView, at: 0)
        } else {
            backgroundColor = .white
        }
    }
}

