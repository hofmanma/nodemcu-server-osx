//
//  MCUServer.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class ArduinoServer: StreamServer {

    override func createClient( _ socket: TCPClient! ) -> StreamClient! {
        
        return ArduinoListener( ClientConnection( socket: socket ) )
    }
}
