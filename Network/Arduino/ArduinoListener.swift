//
//  MCUClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoListener: StreamClient {
    
    override func handleCommand( _ cmd: String! ) {
        
        Session.shared.logger.addLine( "New Command from Arduino Client: " + cmd )
    }
}
