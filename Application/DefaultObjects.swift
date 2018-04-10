//
//  DefaultObjects.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class DefaultObjects: NSObject {

    static let CMD_LED_ON: String! = "LEDON"
    static let CMD_LED_OFF: String! = "LEDOFF"
    static let CMD_REG_MCU: String! = "IAMMCU"
    static let CMD_WHOAMI: String! = "IAMFLUFF"
    
    static let STATUS_SUCCESS: String! = "Success"
    static let STATUS_ERROR: String! = "Error"
    
    static let ARDUINO_PORT_IN: Int32! = 9088
    static let IOS_PORT_IN: Int32! = 9089

    static let MY_IP: String! = Host.current().address
}
