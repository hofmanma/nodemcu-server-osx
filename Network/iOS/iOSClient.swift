//
//  iOSClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class iOSClient: StreamClient {

    override func handleCommand(  _ cmd: String! ) throws {
        
        Session.shared.logger.addLine( "New Command from iOS Client: " + cmd )

        if cmd == DefaultObjects.STATUS_SUCCESS {
                
        } else if cmd == DefaultObjects.STATUS_ERROR {
                
        }
    }
}
