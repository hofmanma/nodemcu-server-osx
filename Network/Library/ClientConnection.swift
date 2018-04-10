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
        
        try writeByte( UInt8(value.count ))
        try handleResult( socket.send( data: value.data(using: .ascii )! ) );
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
    private func writeByte( _ value: Byte! ) throws {
        
        var worker: Byte! = value;
        try handleResult( socket.send( data: Data( bytes: &worker,
                                                   count: MemoryLayout.size(ofValue: worker)) ))
    }
    
    private func writeFloat( _ value: Float! ) throws {
        
        var worker: Float! = value;
        try handleResult( socket.send( data: Data( bytes: &worker,
                                                   count: MemoryLayout.size(ofValue: worker))) )
    }
    ////////////////////////////////////////
    // Read from remote server
    /////////////////////
    private func readByte() -> Byte! {
        
        var result: Byte! = 0
        let length: Int! = MemoryLayout.size( ofValue: result )
        let array: [Byte]! = readBlock( UInt8(length) )
        
        if array == nil || array.count == 0 {
            
            return 0
            
        } else {
        
            let data = NSData(bytes: array, length: length)
                data.getBytes(&result, length: length)
        
            return result
        }
    }
    
    private func readFloat() -> Float {
        
        var result: Float! = 0
        let length: Int! = MemoryLayout.size( ofValue: result )
        let array: [Byte]! = readBlock( UInt8(length) )
        
        if array == nil || array.count == 0 {
            
            return 0.0
        
        } else {
        
            let data = NSData(bytes: array, length: length)
                data.getBytes(&result, length: length)
        
            return result
        }
    }
    
    private func readBlock( _ length: UInt8! ) -> [Byte]! {
        
        if length == 0 {
            
            return [Byte]()
        
        } else {
        
            return socket.read( Int(length), timeout: 1 )
        }
    }
    
    private func readPaket( ) -> [Byte]! {
        
        let length = readByte()
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
