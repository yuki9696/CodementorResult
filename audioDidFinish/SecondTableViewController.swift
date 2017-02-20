//
//  SecondTableViewController.swift
//  audioDidFinish
//
//  Created by Yuki Yamamoto on 2017/02/20.
//  Copyright © 2017年 Yuki Yamamoto. All rights reserved.
//
import Foundation
import UIKit

class SecondTableViewController: UITableViewController {

    var names = [String]()
    var identities = [String]()
    var imgArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        names = ["Playlist 1","Playlist 2","Playlist 3","Playlist 4"]
        identities = ["A"]
        imgArray = ["Daruma","Geisha","Mt.Fuji","Torii"]


        //UITableViewの空セルのseparatorを消す
        tableView.tableFooterView = UIView(frame: .zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの再利用（cellに名前をつける）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        

        
        //UIImageView インスタンスの生成 + imgArrayをセルに記述
        let imageView = cell?.viewWithTag(1) as! UIImageView
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        
        //画像を表示するためのimageView
        imageView.image = img
        
        //UILabelインスタンスの生成 + namesをセルに記述
        let label1 = cell?.viewWithTag(2) as! UILabel
        label1.text = "\(names[indexPath.row])"
        
        
        
        //select時のcolorを緑にする
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.init(red: (138.0/255.0), green: (176.0/255.0), blue: (57.0/255.0), alpha: 1.0)
        cell?.selectedBackgroundView =  selectedView
        
        
        //関数では戻り値を返すreturnが実行されると、returnした時点で関数内の処理を終了します。
        return cell!
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            // cell1押下時
            let vcName = identities[indexPath.row]
            let ViewController = storyboard?.instantiateViewController(withIdentifier: vcName)
            self.navigationController?.pushViewController(ViewController!, animated: true)
        } else {
            
            // cell2押下時
            let storyboard = UIStoryboard(name: "Main.storyBoard", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
