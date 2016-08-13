//
//  ViewController.swift
//  Facelt
//
//  Created by Apple on 18/02/1938 Saka.
//  Copyright © 1938 Saka Rang. All rights reserved.
//

import UIKit

class FacViewController: UIViewController {

    var expression = FacialExpression (eyes: .Close, eyeBrows: .Normal, mouth: .Smile ) { didSet { updateUI() }}
    
    @IBOutlet weak var faceView: FaceView! {
                                            didSet
                                                {
                                                    faceView.addGestureRecognizer(UIPinchGestureRecognizer(
                                                        target:faceView, action: #selector(faceView.changeScale(_:))
                                                        ))
                                                    let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(
                                                        target:self, action: #selector(FacViewController.increaseHapiness)
                                                        )
                                                    happierSwipeGestureRecognizer.direction = .Up
                                                    faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
                                                    let sadSwipeGestureRecognizer = UISwipeGestureRecognizer(
                                                        target:self, action: #selector(FacViewController.decreaseHapiness)
                                                    )
                                                    happierSwipeGestureRecognizer.direction = .Down
                                                    faceView.addGestureRecognizer(sadSwipeGestureRecognizer)
                                                    updateUI()
                                                }
                                            }
    @IBAction func toggleEyes(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .Ended{
            switch expression.eyes{
            case .Open: expression.eyes = .Close
            case .Close : expression.eyes = .Open
            case .Squinting: break
            }
        }
    }
    func increaseHapiness(){
        expression.mouth = expression.mouth.happeirMouth()
    }
    func decreaseHapiness(){
        expression.mouth = expression.mouth.sadderMouth()
    }
    private var mouthCurvatures = [FacialExpression.Mouth.Frown: -1.0, .Grin:0.5, .Smile:1.0, .Smirk:-0.5, .Natural : 0.0 ]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed: 0.5, .Normal: 0.0, .Furrowed: -0.5 ]
    private func updateUI()
    {
        if faceView != nil{
        
            switch expression.eyes {
                case .Open: faceView.eyesOpen = true
                case .Close: faceView.eyesOpen = false
                case .Squinting: break
            }
            faceView.mouthCurvature = mouthCurvatures [expression.mouth] ?? 0.0
            faceView.eyeBrowTilt = eyeBrowTilts [expression.eyeBrows] ?? 0.0
        }
    }

}

