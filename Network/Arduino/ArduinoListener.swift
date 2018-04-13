//
//  MCUClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoListener: StreamClient {
    
    override func handleCommand( _ cmd: String! ) throws {
        
        if cmd == DefaultObjects.CMD_PORTS {
            
            for port in 0...8 {
                
                NodeMCU.IC.digitalPort( port ).setSignal( Float(connection.readInt()) )
            }
            
            for port in 0...8 {
                
                NodeMCU.IC.analogPort( port ).setSignal( Float(connection.readInt()) )
            }
            
        } else if cmd == DefaultObjects.CMD_DIGITALPORT_SENT {
            
            let port: Int! = connection.readInt()
            let io: Int! = connection.readInt()
            let signal: Float! = connection.readFloat()
            
            NodeMCU.IC.digitalPort( port ).setSignal( signal )
            NodeMCU.IC.digitalPort( port ).setMode( io )
            
        } else if cmd == DefaultObjects.CMD_ANALOGPORT_SENT {
            
            NodeMCU.IC.analogPort( connection.readInt() ).setSignal( connection.readFloat() )
        }
    }
}
