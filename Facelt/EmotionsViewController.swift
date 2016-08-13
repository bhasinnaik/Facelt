//
//  EmotionsViewController.swift
//  Facelt
//
//  Created by Apple on 01/03/1938 Saka.
//  Copyright © 1938 Saka Rang. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    private let emotionalFaces : Dictionary <String, FacialExpression> = [
        "angry" : FacialExpression(eyes: .Close, eyeBrows: .Furrowed, mouth: .Frown ),
        "happy" : FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile ),
        "worried" : FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk ),
        "michievous" : FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin )
        ]
    


        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                        let detinationvc = segue.destinationViewController
            
            if let facevc = detinationvc as? FacViewController {
                if let identifier = segue.identifier{
                    if let expression =  emotionalFaces[identifier]{
                        facevc.expression = expression
                    }
                }
            }
    }
    

}
