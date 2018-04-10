//
//  MCUAcceptor.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoAcceptor: Acceptor {
    
    override func accept() throws {
        
        server = ArduinoServer( try ServerConnection( DefaultObjects.MY_IP,
                                                      DefaultObjects.ARDUINO_PORT_IN ))
        running = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            while self.isRunning() {
                
                let client: StreamClient! = self.server.accept()
                DispatchQueue.main.async {
                        
                    self.clients.append( client )
                    
                    Session.shared.logger.addLine( "New Arduino Client connected" )
                }
            }
            
            do {
                
                try super.accept()
                
            } catch {
                
            }
        }
    }
}
