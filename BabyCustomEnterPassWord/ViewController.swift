//
//  ViewController.swift
//  BabyCustomEnterPassWord
//
//  Created by 北鼻爽 on 2017/11/29.
//  Copyright © 2017年 北鼻爽. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clickInputPWBtn(_ sender: Any) {
        //初始化输入密码view
        let customView = BabyCustomPassWord.newInstance()
        customView?.delegate = self
        self.view.addSubview(customView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//输入密码代理方法
extension ViewController:BabyCustomPassWordDelegate
{
    func clickConfirm(password: String) {
        inputBtn.setTitle(password, for: .normal)
    }
}
