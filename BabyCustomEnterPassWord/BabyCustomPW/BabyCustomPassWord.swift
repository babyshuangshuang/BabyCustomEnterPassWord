//
//  BabyCustomPassWord.swift
//  BabyCustomEnterPassWord
//
//  Created by 北鼻爽 on 2017/11/29.
//  Copyright © 2017年 北鼻爽. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol BabyCustomPassWordDelegate:class {
    func clickConfirm(password:String)
}

class BabyCustomPassWord: UIView {
    
    @IBOutlet weak var enterPassWordTF: UITextField!
    @IBOutlet weak var firstLa: UILabel!
    @IBOutlet weak var secondLa: UILabel!
    @IBOutlet weak var thirdLa: UILabel!
    @IBOutlet weak var fourthLa: UILabel!
    @IBOutlet weak var fifthLa: UILabel!
    @IBOutlet weak var sixthLa: UILabel!
    
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    weak var delegate:BabyCustomPassWordDelegate!
    
    //用于存放6个密码label
    fileprivate var passwordLabelArr:[UILabel] = []
    
    //加载xib文件
    static func newInstance() ->BabyCustomPassWord? {
        let nibView = Bundle.main.loadNibNamed("BabyCustomPassWord", owner: nil, options: nil)
        if let view = nibView?.first as? BabyCustomPassWord{
            return view
        }
        return nil
    }
    
    override func awakeFromNib() {
        enterPassWordTF.delegate = self
        enterPassWordTF.tintColor = .lightGray
        enterPassWordTF.becomeFirstResponder()
        passwordLabelArr = [firstLa,secondLa,thirdLa,fourthLa,fifthLa,sixthLa]
    }

    @IBAction func clickCancleBtn(_ sender: Any) {
        enterPassWordTF.resignFirstResponder()
        self.removeFromSuperview()
    }
    
    @IBAction func clickConfirmBtn(_ sender: Any) {
        guard enterPassWordTF.text!.count == 6 else {
            SVProgressHUD.dismiss(withDelay: 1)
            SVProgressHUD.showError(withStatus: "请输入6位密码")
            return
        }
        //把输入好的密码代理到controller并进行操作
        delegate.clickConfirm(password: enterPassWordTF.text!)
        enterPassWordTF.resignFirstResponder()
        self.removeFromSuperview()
    }
}
extension BabyCustomPassWord:UITextFieldDelegate
{
    //输入密码时圆点的显示
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        enterPassWordTF.tintColor = .clear
        var password = ""
        
        if string.count <= 0 {
            let index = textField.text?.index((textField.text?.endIndex)!, offsetBy: -1)
            password = (textField.text?.substring(to: index!))!
        }else{
            password = textField.text! + string
        }
        
        if password.count > 6 {
            return false
        }
        
        for label in passwordLabelArr {
            label.isHidden = true
        }
        for i in 0 ..< password.count {
            passwordLabelArr[i].isHidden = false
        }
        
        if password.count == 0 {
            enterPassWordTF.tintColor = .lightGray
        }
        
        return true
    }
}

