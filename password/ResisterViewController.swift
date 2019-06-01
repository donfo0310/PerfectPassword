//
//  ResisterViewController.swift
//  password
//
//  Created by 岡本航輝 on 2016/09/25.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds
var c=0
class ResisterViewController: UIViewController ,UITextFieldDelegate,GADBannerViewDelegate{
    let userDefaults=UserDefaults.standard
    @IBOutlet weak var wpass: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        resist.isEnabled=false
        wpass.delegate=self
        pass.delegate=self
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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var resist: UIButton!
    
    @IBAction func resister(_ sender: AnyObject) {
        if((userDefaults.string(forKey: "c")) != nil){
            c=Int(userDefaults.string(forKey: "c")!)!
        }
        let s="wpass"+String(c)
        let st="pass"+String(c)
        c += 1
        userDefaults.set(c,forKey:"c")
        userDefaults.set(wpass.text,forKey: s)
        userDefaults.set(pass.text,forKey: st)
        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
        targetViewController.modalTransitionStyle=UIModalTransitionStyle.partialCurl
        self.present( targetViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(wpass.text != "" && pass.text != ""){
            resist.isEnabled=true
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
