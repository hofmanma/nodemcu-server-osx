//
//  ClientConnection.swift
//  NodeMCU
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class ClientConnection: NetConnection {

    var socket: TCPClient!
    //////////////////////////////////////////
    // Initialization
    //////////////////////
    init ( _ port: Int32!, _ address: String! ) throws {
        
        let client = TCPClient( address: address, port: port )
        
        switch client.connect(timeout: 15 ) {
        case .success:
            socket = client
            
        case .failure(let error):

            throw error
        }
    }
    
    init( socket: TCPClient! ) {
        
        self.socket = socket
    }
    /////////////////////////////////////////////
    // Public functions
    ///////////////////////
    func writeString( _ value: String! ) throws {
        
        try writeInt( value.count )
        try handleResult( socket.send( string: value ));
    }
    
    func readString() throws -> String! {
        
        return String(bytes: readPaket(), encoding: String.Encoding.ascii)
    }
    
    func exitSession() throws {
        
        try writeString( "EXIT" );
        
        close()
    }
    ////////////////////////////////////////
    // Write to remote server
    //////////////////////////
    private func writeInt( _ value: Int! ) throws {
        
        var worker: Int32! = Int32(value)        
        try handleResult( socket.send( data: Data( bytes: &worker,
                                                   count: MemoryLayout<Int32>.size)))
    }
    
    private func writeFloat( _ value: Float32! ) throws {
        
        var worker: Float32! = value;
        try handleResult( socket.send( data: Data( bytes: &worker,
                                                   count: MemoryLayout<Float32>.size)) )
    }
    ////////////////////////////////////////
    // Read from remote server
    /////////////////////
    private func readInt() -> Int! {
        
        var result: Int32! = 0
        let length: Int! = MemoryLayout<Int32>.size
        
        let array: [Byte]! = readBlock( length )
        
        if array == nil || array.count == 0 {
            
            return 0
            
        } else {
        
            let data = NSData(bytes: array, length: length)
                data.getBytes(&result, length: length)
        
            return Int(result)
        }
    }
    
    private func readFloat() -> Float32! {
        
        var result: Float32! = 0
        let length: Int! = MemoryLayout.size( ofValue: result ) - 1
        let array: [Byte]! = readBlock( length )
        
        if array == nil || array.count == 0 {
            
            return 0.0
        
        } else {
        
            let data = NSData(bytes: array, length: length)
                data.getBytes(&result, length: length)
        
            return result
        }
    }
    
    private func readBlock( _ length: Int! ) -> [Byte]! {
        
        if length == 0 {
            
            return [Byte]()
        
        } else {
        
            return socket.read( length, timeout: 1 )
        }
    }
    
    private func readPaket( ) -> [Byte]! {
        
        let length = readInt()
        if length == 0 {
            
            return [Byte]()
        
        } else {
        
            return readBlock( length )
        }
    }
    ////////////////////////////////
    // Log on/ Log off
    ////////////////////////
    func close() {
        
        socket.close()
    }
}
