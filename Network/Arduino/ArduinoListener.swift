//
//  MCUClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoListener: StreamClient {
    
    func ping() throws {
        
       try net().writeString( DefaultObjects.CMD_WHOAMI )
    }
}
