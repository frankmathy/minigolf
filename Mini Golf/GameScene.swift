//
//  GameScene.swift
//  Mini Golf
//
//  Created by Frank Mathy on 27.12.16.
//  Copyright © 2016 Frank Mathy. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics
import CoreImage

class GameScene: SKScene {
    
    // Spielfeldgröße: 50 x 25 Blöcke
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let myImage = UIImage(named: "elements")!
        let croppedImage = GameScene.getElementFromImage(image: myImage, elementSize: 15, elementSpacing: 1, x: 0, y: 1)
        let texture = SKTexture(image: croppedImage)
        for y in -12..<13 {
            for x in -24..<25 {
                let sprite = SKSpriteNode(texture: texture)
                sprite.position = CGPoint(x: CGFloat(x)*croppedImage.size.width, y: CGFloat(y)*croppedImage.size.width)
                addChild(sprite)
            }
        }
    }
    
    /**
     Crops an image to the specified size.
        -parameter image: The image to be cropped.
        -parameter toRect: The rect to which to crop.
        -returns: The cropped image.
    */
    static func cropImage(image:UIImage, toRect rect:CGRect) -> UIImage{
        let imageRef:CGImage = image.cgImage!.cropping(to: rect)!
        let croppedImage:UIImage = UIImage(cgImage:imageRef)
        return croppedImage
    }
    
    static func getElementFromImage(image: UIImage, elementSize: Int, elementSpacing: Int, x: Int, y: Int) -> UIImage {
        let xCord: Int = 1 + ((elementSize + elementSpacing) * x)
        let yCord: Int = 1 + ((elementSize + elementSpacing) * y)
        let cropRect = CGRect(x: xCord, y: yCord, width: elementSize, height: elementSize)
        return cropImage(image: image, toRect: cropRect)
    }
}
