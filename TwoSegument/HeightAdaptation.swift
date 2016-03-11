//
//  HeightAdaptation.swift
//  CteemoCN
//
//  Created by 王渊博 on 15/12/21.
//  Copyright © 2015年 bintao. All rights reserved.
//

import UIKit

class HeightAdaptation: NSObject {
    // 自适应高度
    class func heightAdaptationWithStr(str: String, width: CGFloat, fontFloat: CGFloat) -> CGFloat{
        let dic = NSDictionary.init(object: UIFont.systemFontOfSize(fontFloat), forKey: NSFontAttributeName)
        let bounds: CGRect = str.boundingRectWithSize(CGSizeMake(width, 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil)
        return bounds.size.height
    }
    
    // 自适应宽度
    class func  widthAdaptationWithStr(str: String, height: CGFloat, fontFloat: CGFloat) -> CGFloat{
        let dic = NSDictionary.init(object: UIFont.systemFontOfSize(fontFloat), forKey: NSFontAttributeName)
        let bounds: CGRect = str.boundingRectWithSize(CGSizeMake(0, height), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil)
        return bounds.size.width
    }
}
