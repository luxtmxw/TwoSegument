//
//  ViewController.swift
//  TwoSegument
//
//  Created by luxtmxw on 16/3/10.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var confirmOrCancelView: ConfirmOrCancel!
    func setupView() {
//        self.view.backgroundColor = UIColor.greenColor()
        confirmOrCancelView = ConfirmOrCancel(titleName: "可怜的师傅节快乐的事 ", delegate: self)
        self.view.addSubview(confirmOrCancelView)
    }

}

extension ViewController: ConfirmOrCancelDelegate {
    func selectedItem(confirmOrCancelView: ConfirmOrCancel, itemTag: Int) {
        if itemTag == 1000 {
            print("取消")
        }else if itemTag == 1001 {
            print("确定")
        }
    }
}
