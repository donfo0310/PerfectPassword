//
//  passwordsave.swift
//  password
//
//  Created by 岡本航輝 on 2016/09/24.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
class passwordsave: UIViewController,UITextFieldDelegate,GADBannerViewDelegate {
    let userDefaults = UserDefaults.standard
    @IBOutlet weak var movie: UITextField!
    @IBOutlet weak var friend: UITextField!
    @IBOutlet weak var comic: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var music: UITextField!
    @IBOutlet weak var save1: UIButton!
    @IBOutlet weak var say: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movie.delegate=self
        friend.delegate=self
        comic.delegate=self
        school.delegate=self
        music.delegate=self
        save1.isEnabled=false
        say.textColor=UIColor.red
        
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        if (userDefaults.string(forKey: "comic") != nil){
            let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target")
            targetViewController.modalTransitionStyle=UIModalTransitionStyle.partialCurl
            self.present( targetViewController, animated: true, completion: nil)
        }
    }
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if((userDefaults.string(forKey: "movie")) != nil){
        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
        targetViewController.modalTransitionStyle=UIModalTransitionStyle.partialCurl
        self.present( targetViewController, animated: true, completion: nil)
        }
    }*/
    
    @IBAction func save(_ sender: AnyObject) {
        userDefaults.set(friend.text,forKey:"friend")
        userDefaults.set(comic.text,forKey:"comic")
        userDefaults.set(school.text,forKey:"school")
        userDefaults.set(music.text,forKey:"music")
        userDefaults.set(movie.text,forKey:"movie")
        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
        targetViewController.modalTransitionStyle=UIModalTransitionStyle.partialCurl
        self.present( targetViewController, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(
            (movie.text != "") &&
                (friend.text != "") &&
                (comic.text != "")
                && (school.text != "")
                && (music.text != "")){
            save1.isEnabled=true
        }else{
            save1.isEnabled=false
        }
        return true
    }
}
