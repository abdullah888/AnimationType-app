//
//  ViewController.swift
//  NewAnimation
//
//  Created by abdullah on 12/08/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//


import UIKit

enum AnimationType: String {
    case unlimitedTriangle = "هرم الى ينقسم الى اجزاء"
    case playAndPause = "ايقاف & تشغيل"
    case menuAndClose = "اقونة القائمة مع الاغلاق"
    case hamburgerMenu = "اقونة القائمة مع سهم الاتجاه"
    case waves = "تمووج"
    case like = "اعجاب"
}

class ViewController: UIViewController {
    
    let animationNames: [AnimationType] = [.unlimitedTriangle, .playAndPause, .menuAndClose, .hamburgerMenu, .waves, .like]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "مجموعة ايقونات"
        
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        self.view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animationNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let c = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = c
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        

        cell.textLabel?.text = animationNames[indexPath.row].rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = AnimationViewController()
        controller.animationType = animationNames[indexPath.row]

        self.navigationController?.pushViewController(controller, animated: true)
    }
}
