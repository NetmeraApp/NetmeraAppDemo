//
//  MyNetmeraUser.swift
//  Netmera
//
//  Copyright © 2017 Netmera. All rights reserved.
//

import Netmera

class MyNetmeraUser: NetmeraUser {

    @objc var spor4: String = ""
    @objc var spor2: String = ""
    @objc var spor3: Int = 0
    @objc var sporx1: Int = 0
    @objc var sporxString: String = ""
    @objc var testAttribute: Int = 0

    override class func keyPathPropertySelectorMapping() -> [AnyHashable: Any] {
        return[
            "de" : NSStringFromSelector(#selector(getter: self.spor4)),
            "ui" : NSStringFromSelector(#selector(getter: self.spor2)),
            "av" : NSStringFromSelector(#selector(getter: self.spor3)),
            "is" : NSStringFromSelector(#selector(getter: self.sporx1)),
            "mz" : NSStringFromSelector(#selector(getter: self.sporxString)),
            "xu" : NSStringFromSelector(#selector(getter: self.testAttribute)),
        ]
    }
}
