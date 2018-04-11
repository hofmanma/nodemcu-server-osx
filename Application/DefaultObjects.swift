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
    static let CMD_EXIT: String! = "EXIT"
    static let CMD_READ_TEMPERATURE: String! = "TEMP"
    static let CMD_READ_HUMIDITY: String! = "HUMI"
    
    static let STATUS_SUCCESS: String! = "Success"
    static let STATUS_ERROR: String! = "Error"
    
    static let ARDUINO_PORT_IN: Int32! = 8080
    static let IOS_PORT_IN: Int32! = 8181

    static let MY_IP: String! = "192.168.2.103"
    static let COMMAND_HEADER: String! = "HEAD"
}
