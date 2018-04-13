//
//  Session.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class Session: NSObject {

    static let shared: Session! = Session()
           var iOS: Acceptor!
           var MCU: Acceptor!
           var user: iOSClient!
           let logger: Logger! = Logger()
           var running: Bool!
    
    override init() {
        
        super.init()
        
        do {
            
            logger.addLine( "Setting up Network ..")
            logger.addLine( "IP: " + DefaultObjects.MY_IP )
            
            try iOS = iOSAcceptor( 0 )
            logger.addLine( "iOS Acceptor started.")
            
            try MCU = ArduinoAcceptor( 0 )
            logger.addLine( "Arduino Acceptor started.")
            logger.addDashLine()
            
            user = try iOSClient( ClientConnection( DefaultObjects.IOS_PORT_IN,
                                                    DefaultObjects.MY_IP ));
            logger.addLine( "iOS Test client started.")
            logger.addDashLine()
            
            running = true
            run()
        
        } catch {
            
            logger.addError( error );
            
            shutDown()
        }
    }
    
    private func run( ) {
        
        DispatchQueue.global(qos: .userInitiated).async {
        
            while self.running {
                
                self.iOS.run( { client in
                    
                    try client.run()
                })
                
                self.MCU.run( { client in
                    
                    try client.run()
                })
                
                do {
                    
                    try self.user.run()
                    
                } catch {
                    
                }
            }
            
            self.iOS.stop()
            self.MCU.stop()
            self.user.net().close()
            
            self.logger.addLine( "Network shut down.")
        }
    }
    
    func shutDown() {
        
        do {
        
            try self.user.sendCommand( "EXIT" )
        
        } catch {
            
        }
        
        running = false
    }
}
