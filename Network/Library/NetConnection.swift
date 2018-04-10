//
//  NetConnection.swift
//  NodeMCU
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class NetConnection: NSObject {
    
    let maxTimeOut: Int! = 5
    
    func handleResult( _ result: Result ) throws {
    
        switch result {
            
        case .success:
            
            break
        case .failure(let error):
            
            throw error
        }
    }
}
