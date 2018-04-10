//
//  ArduinoClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoClient: StreamClient {

    override func run() throws {
        
        if let cmd = try nextCommand() {
        
            Session.shared.logger.addLine( "New Command from Arduino Client: " + cmd )
        }
    }
    
    func switchLEDOn() throws {
        
        try net().writeString( DefaultObjects.CMD_LED_ON );
        
        Session.shared.logger.addLine( "LED On by Arduino Client." )
    }
    
    func switchLEDOff() throws {
        
        try net().writeString( DefaultObjects.CMD_LED_OFF );
        
        Session.shared.logger.addLine( "LED Off by Arduino Client." )
    }

}
