//
//  OutQueue.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 13.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class OutQueue: NSObject {
    
    static let shared: OutQueue! = OutQueue()
           var responses: [MCUCommand]!
           var running: Bool!
    
    override init() {
        
        super.init()
        
        responses = [MCUCommand]()
        start()
    }
    
    func start() {
    
        running = true
        run()
    }
    
    func stop() {
        
        running = false
    }
    
    func enqueue( _ cmd: String! ) {
        
        responses.append( MCUCommand( cmd ))
    }
    
    func pop() {
        
        if responses.count > 0 {
            
            MCUCommand.lock.unlock()
            
            responses.remove(at: 0)
        } else {
            
            MCUCommand.lock.unlock()
        }
    }
    
    func top() -> MCUCommand? {
        
        if responses.count > 0 {
            
            let item: MCUCommand! = responses[ 0 ]
            if item.isLocked() {
                
                return nil
            } else {
                
                return item
            }
        
        } else {
            
            return nil
        }
    }
    
    func run() {
        
        DispatchQueue.global(qos: .userInitiated).async {
        
            while self.running == true {
            
                if let cmd = self.top() {
                
                    cmd.send()
                }
            }
            
            MCUCommand.lock.unlock();
        }
    }
}
