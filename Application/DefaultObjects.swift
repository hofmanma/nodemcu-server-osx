//
//  DefaultObjects.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class DefaultObjects: NSObject {

    static let CMD_NONE: String! = "NONE"
    static let CMD_LED_ON: String! = "LEDON"
    static let CMD_LED_OFF: String! = "LEDOFF"
    
    static let CMD_EXIT: String! = "EXIT"
    
    static let CMD_READ_TEMPERATURE: String! = "TEMP"
    static let CMD_READ_HUMIDITY: String! = "HUMI"
    
    static let CMD_PORTS: String! = "PORTS"
    static let CMD_DIGITALPORT_SENT: String! = "DGTLPRT"
    static let CMD_ANALOGPORT_SENT: String! = "ANLGPRT"
    
    static let CMD_DIGITAL_PORTS: String! = "DIGIPORTS"
    static let CMD_ANALOG_PORTS: String! = "ALGPORTS"
    
    static let CMD_ANALOG_PORT_OUT: String! = "SETALGOUT"
    static let CMD_ANALOG_PORT_IN: String! = "SETALGIN"
    static let CMD_ANALOG_PORT_HIGH: String! = "SETALGHIGH"
    static let CMD_ANALOG_PORT_LOW: String! = "SETALGLOW"
    
    static let CMD_DIGITAL_PORT_OUT: String! = "SETDIGIOUT"
    static let CMD_DIGITAL_PORT_IN: String! = "SETDIGIIN"
    static let CMD_DIGITAL_PORT_HIGH: String! = "SETDIGIHIGH"
    static let CMD_DIGITAL_PORT_LOW: String! = "SETDIGILOW"
    
    static let CMD_TRACKING: String! = "TCRT"
    
    static let STATUS_SUCCESS: String! = "Success"
    static let STATUS_ERROR: String! = "Error"
    
    static let ARDUINO_PORT_IN: Int32! = 8080
    static let IOS_PORT_IN: Int32! = 8181

    static let MY_IP: String! = "192.168.2.103"
    static let COMMAND_HEADER: String! = "HEAD"

    static let MODE_PORT_OUTPUT: Int32 = 1
    static let MODE_PORT_INPUT: Int32 = 2
}
