//
//  iOSClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class iOSClient: StreamClient {

    override func run() throws {
        
        if let cmd = try nextCommand() {
        
            Session.shared.logger.addLine( "New Command from iOS Client: " + cmd )
        }
    }
}
