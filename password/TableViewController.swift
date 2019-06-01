//
//  TableViewController.swift
//  password
//
//  Created by 岡本航輝 on 2016/09/25.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds
class TableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,GADBannerViewDelegate{
    let userDefaults=UserDefaults.standard
    var count = 0
    var co=0
    var part:[String] = []
    var pass:[String]=[]
    var pa:[String]=[]
    var pb:[String]=[]
    @IBOutlet weak var table: UITableView!
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
        
        if (userDefaults.string(forKey: "c") != nil){
        count = Int(userDefaults.string(forKey: "c")!)!
        }
        var a=""
        var b=""
        var s=""
        var st=""
        for i in 0..<count{
            s="wpass"+String(i)
            st="pass"+String(i)
            if (userDefaults.string(forKey: s) != nil){
            a=userDefaults.string(forKey: s)!
            b=userDefaults.string(forKey: st)!
            pa+=[s]
            pb+=[st]
            part+=[a]
            pass+=[b]
            co += 1
            }
        }
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //let userDefaults=UserDefaults.standard
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return co
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: "MyCell", for:indexPath)
        cell.textLabel!.text=part[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell=tableView.cellForRow(at:indexPath)!
        if cell.textLabel!.text==part[indexPath.row]{
            cell.textLabel!.text=pass[indexPath.row]
            cell.textLabel?.textColor=UIColor.blue
        }else{
            cell.textLabel!.text=part[indexPath.row]
            cell.textLabel?.textColor=UIColor.black
        }
    }
    @IBAction func edit(_ sender: AnyObject) {
        if table.isEditing==true{
            table.isEditing=false
        }else{
            table.isEditing=true
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //削除の場合、配列からデータを削除する。
        if( editingStyle == UITableViewCellEditingStyle.delete) {
            let a=pa[indexPath.row]
            let b=pb[indexPath.row]
            part.remove(at: indexPath.row)
            pass.remove(at: indexPath.row)
            userDefaults.removeObject(forKey: a)
            userDefaults.removeObject(forKey: b)
            co=co-1
        }
        
        //テーブルの再読み込み
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
