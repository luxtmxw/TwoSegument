//
//  ConfirmOrCancel.swift
//  TwoSegument
//
//  Created by luxtmxw on 16/3/10.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit
protocol ConfirmOrCancelDelegate {
    func selectedItem(confirmOrCancelView: ConfirmOrCancel, itemTag: Int)
}

class ConfirmOrCancel: UIView {
    
    let kScreenWidth = UIScreen.mainScreen().bounds.width
    let kScreenHeight = UIScreen.mainScreen().bounds.height
    var delegate: ConfirmOrCancelDelegate?
    
    convenience init(titleName: String, delegate: ConfirmOrCancelDelegate) {
        self.init()
        let window = UIApplication.sharedApplication().windows.last
        self.frame = window!.frame
        self.backgroundColor = UIColor(white: 0, alpha: 0.35)
        self.delegate = delegate
//        let lblWidth = kScreenWidth - 20
//        let stringHeight = HeightAdaptation.heightAdaptationWithStr(titleName, width: lblWidth, fontFloat: 14)
        
        let imageViewHeight: CGFloat = 200
        let imageViewWidth: CGFloat = 295
        let imageView = UIImageView(frame: CGRectMake((kScreenWidth - imageViewWidth) / 2, (kScreenHeight - imageViewHeight) / 2, imageViewWidth, imageViewHeight))
        imageView.backgroundColor = UIColor.redColor()
        self.addSubview(imageView)
        
        let titleLbl = UILabel()
        titleLbl.text = titleName
        titleLbl.font = UIFont.systemFontOfSize(14)
        titleLbl.textAlignment = .Center
        titleLbl.backgroundColor = UIColor.redColor()
        self.addSubview(titleLbl)
        titleLbl.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp_top).offset(10)
            make.left.equalTo(imageView.snp_left).offset(10)
            make.right.equalTo(imageView.snp_right).offset(-10)
            make.height.equalTo(20)
        }
        
        let cancelBtn = UIButton()
        cancelBtn.tag = 1000
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        cancelBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cancelBtn.setTitle("取消", forState: .Normal)
        cancelBtn.backgroundColor = UIColor.redColor()
        cancelBtn.addTarget(self, action: "btnAction:", forControlEvents: .TouchUpInside)
        self.addSubview(cancelBtn)
        cancelBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(imageView.snp_left)
            make.width.equalTo(imageView.frame.size.width / 2)
            make.bottom.equalTo(imageView.snp_bottom)
            make.height.equalTo(40)
        }
        
        let confirmBtn = UIButton()
        confirmBtn.tag = 1001
        confirmBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        confirmBtn.setTitle("确定", forState: .Normal)
        confirmBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        confirmBtn.backgroundColor = UIColor.redColor()
        confirmBtn.addTarget(self, action: "btnAction:", forControlEvents: .TouchUpInside)
        self.addSubview(confirmBtn)
        confirmBtn.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(imageView.snp_right)
            make.bottom.equalTo(imageView.snp_bottom)
            make.width.equalTo(imageView.frame.size.width / 2)
            make.height.equalTo(40)
        }
    }
    
    func btnAction(btn: UIButton) {
        self.delegate?.selectedItem(self,itemTag: btn.tag)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
