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
           var arduino: ArduinoClient!
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
            
            arduino = try ArduinoClient( ClientConnection( DefaultObjects.ARDUINO_PORT_IN,
                                                           DefaultObjects.MY_IP ));
            
            logger.addLine( "Arduino Test client started.")
            
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
            }
        }
    }
    
    func shutDown() {
        
        running = false
        
        if iOS != nil {
            
            iOS.stop()
            iOS = nil
        }
        
        if MCU != nil {
            
            MCU.stop()
            MCU = nil
        }
        
        if arduino != nil {
            
            arduino.net().close()
            arduino = nil
        }
        
        logger.addLine( "Network shut down.")
    }
}
