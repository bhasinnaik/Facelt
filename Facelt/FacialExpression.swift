//
//  FacialExpression.swift
//  Facelt
//
//  Created by Apple on 25/02/1938 Saka.
//  Copyright © 1938 Saka Rang. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes: Int {
        case Open
        case Close
        case Squinting
    }
    
    enum EyeBrows: Int {
        case Relaxed
        case Normal
        case Furrowed
        
        func moreRelaxedBrow() -> EyeBrows {
            return EyeBrows(rawValue: rawValue - 1) ?? .Relaxed
            
        }
        
        func moreFurrowedBrow() -> EyeBrows {
            return EyeBrows(rawValue: rawValue + 1) ?? .Furrowed
        }
        
    }
    enum Mouth: Int{
        
        case Frown
        case Smirk
        case Natural
        case Grin
        case Smile
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .Frown
        }
        func happeirMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .Smile
            
        }
    }
    
    var eyes: Eyes
    var eyeBrows: EyeBrows
    var mouth: Mouth
    
}