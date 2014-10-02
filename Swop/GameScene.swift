//
//  GameScene.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  var level: Level!
  var tileLayer = SKNode()
  var objectLayer = SKNode()
  let gameLayer = SKNode()
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    let layerPosition = CGPoint(
      x: -30 * CGFloat(7) / 2,
      y: -30 * CGFloat(1) / 2)
    
    addChild(gameLayer)
    
    tileLayer.position = layerPosition
    gameLayer.addChild(tileLayer)
    // gameLayer.hidden = true
    
    objectLayer.position = layerPosition
    gameLayer.addChild(objectLayer)
  }
  
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
    
    // self.addChild(SKSpriteNode(color: SKColor.redColor(), size: CGSizeMake(200, 200)))
    
    
  }
  
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
  func drawTiles() {
    for tileArray in level.tiles {
      for tile in tileArray {
        tileLayer.addChild(tile)
      }
    }
  }
  
  func drawObjects() {
    for objectArray in level.objects {
      for object in objectArray {
        if object != nil {
          objectLayer.addChild(object!.sprite)
          println(object!.sprite.position)
        }
        // objectLayer.addChild(SKSpriteNode(color: SKColor.redColor(), size: CGSizeMake(300,300)))
      }
    }
  }
  
}
