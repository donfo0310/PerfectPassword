//
//  LoginViewController.swift
//  password
//
//  Created by 岡本航輝 on 2016/09/24.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds
class LoginViewController: UIViewController ,UITextFieldDelegate,GADBannerViewDelegate{
    let userDefaults=UserDefaults.standard
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var ftext: UITextField!
    var a=8
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPoint(x:0,y:self.view.frame.size.height - bannerView.frame.height)
        bannerView.frame.size = CGSize(width:self.view.frame.width,height:bannerView.frame.height)
        // AdMobで発行された広告ユニットIDを設定
        bannerView.adUnitID = "ca-app-pub-2999332830349079/3734110941"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        // テスト用の広告を表示する時のみ使用（申請時に削除）
        // gadRequest.testDevices = ["12345678abcdefgh"]
        bannerView.load(gadRequest)
        self.view.addSubview(bannerView)
        
        ftext.delegate=self
        login.isEnabled=false
        login.alpha=0.3
        let date=Date()
        let calendar=Calendar.current
        let component=(calendar as NSCalendar).components([NSCalendar.Unit.year,NSCalendar.Unit.month,NSCalendar.Unit.day,NSCalendar.Unit.hour,NSCalendar.Unit.minute],from: date)
        let h=component.day!%5
        switch h {
        case 0:
            question.text=NSLocalizedString("what comic did you see in first?",comment:"")
            a=0
        case 1:
            question.text=NSLocalizedString("what is your elementary school?",comment:"")
            a=1
        case 2:
            question.text=NSLocalizedString("what movie did you see in first?",comment:"")
            a=2
        case 3:
            question.text=NSLocalizedString("what the best music do you think? ",comment:"")
            a=3
        case 4:
            question.text=NSLocalizedString("what name your first friend is?",comment:"")
            a=4
        default:
            question.text="error"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var error: UILabel!
    
    @IBAction func logina(_ sender: AnyObject) {
        /*let targetViewController1:TableViewController = self.storyboard!.instantiateViewController( withIdentifier: "table" ) as! TableViewController
        targetViewController1.modalTransitionStyle=UIModalTransitionStyle.partialCurl
        self.present( targetViewController1, animated: true, completion: nil)*/
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch a {
        case 0:
            if ftext.text==userDefaults.string(forKey: "comic"){
                login.isEnabled=true
                login.alpha=1
                error.text=NSLocalizedString("password is correct",comment:"")
            }else{
                error.text=NSLocalizedString("password is incorrect",comment:"")
            }
        case 1:
            if ftext.text==userDefaults.string(forKey: "school"){
                login.isEnabled=true
                login.alpha=1
                error.text=NSLocalizedString("password is correct",comment:"")
            }else{
                error.text=NSLocalizedString("password is incorrect",comment:"")
            }
        case 2:
            if ftext.text==userDefaults.string(forKey: "movie"){
                login.isEnabled=true
                login.alpha=1
                error.text=NSLocalizedString("password is correct",comment:"")
            }else{
                error.text=NSLocalizedString("password is incorrect",comment:"")
            }
        case 3:
            if ftext.text==userDefaults.string(forKey: "music"){
                login.isEnabled=true
                login.alpha=1
                error.text=NSLocalizedString("password is correct",comment:"")
            }else{
                error.text=NSLocalizedString("password is incorrect",comment:"")
            }
        case 4:
            if ftext.text==userDefaults.string(forKey: "friend"){
                login.isEnabled=true
                login.alpha=1
                error.text=NSLocalizedString("password is correct",comment:"")
            }else{
                error.text=NSLocalizedString("password is incorrect",comment:"")
            }
        default :
            error.text="error"
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
