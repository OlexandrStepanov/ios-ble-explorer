//
//  String+DataFromHex.swift
//  ios-ble-explorer
//
//  Created by João Marcelo on 20/06/15.
//  Copyright (c) 2015 João Marcelo Oliveira. All rights reserved.
//

import Foundation

extension String {
    
    /// Create NSData from hexadecimal string representation
    func dataFromHexadecimalString() -> Data? {
        var hex = self
        var data = Data()
        while(hex.characters.count > 0) {
            let c: String = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
            hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }
        return data
    }
    
    /// Create NSData from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a String object from taht. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too.
    ///
    /// :param: encoding The NSStringCoding that indicates how the binary data represented by the hex string should be converted to a String.
    ///
    /// :returns: String represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range or if a string cannot be created using the provided encoding
    
    func stringFromHexadecimalStringUsingEncoding(_ encoding: String.Encoding) -> String? {
        if let data = dataFromHexadecimalString() {
            return String.init(data: data, encoding: encoding)
        }
        
        return nil
    }
    
    /// Create hexadecimal string representation of String object.
    ///
    /// :param: encoding The NSStringCoding that indicates how the string should be converted to NSData before performing the hexadecimal conversion.
    ///
    /// :returns: String representation of this String object.
    
    func hexadecimalStringUsingEncoding(_ encoding: String.Encoding) -> String? {
        let data = self.data(using: String.Encoding.utf8)
        return data?.hexadecimalString()
    }
}
