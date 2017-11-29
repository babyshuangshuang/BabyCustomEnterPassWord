# BabyCustomEnterPassWord
封装好的支付密码，控制器里几行代码即可搞定。

初始化输入密码view

    let customView = BabyCustomPassWord.newInstance()
    customView?.delegate = self
    self.view.addSubview(customView!)


实现代理方法

     extension ViewController:BabyCustomPassWordDelegate{
        func clickConfirm(password: String) {  
             inputBtn.setTitle(password, for: .normal)    
        }      
     }

