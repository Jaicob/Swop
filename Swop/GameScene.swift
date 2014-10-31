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
    setup()
  }
  
  func setup() {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    let layerPosition = CGPoint(
      x: -30 * CGFloat(7) / 2,
      y: -30 * CGFloat(1) / 2)
    
    addChild(gameLayer)
    
    tileLayer.position = layerPosition
    gameLayer.addChild(tileLayer)
    
    objectLayer.position = layerPosition
    gameLayer.addChild(objectLayer)
  }
  
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
    
    
    
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
    objectLayer.removeAllChildren()
    var i = 0
    for objectArray in level.objects {
      for object in objectArray {
        if object != nil {
          //var label = SKLabelNode(text: "\(i)")
          //  object?.sprite.addChild(label)
          object?.sprite.name = object?.type.toRaw()
          objectLayer.addChild(object!.sprite)
          println(object!.type.toRaw())
          i++
        }
      }
    }
  }
  
  func moveObject(object : SwopObject) {
    println("moving object with position: \(object.sprite.position)\n Win Position: \(object.winPosition)")
    switch object.type {
    case .right:
      println("move to the right")
      object.sprite.position = level.movePosition(object)!
    case .left:
      println("move to the left")
      object.sprite.position = level.movePosition(object)!
    default:
      println("Dont move")
    }
 
 
  }
  
  func animateMoveForClearPath() {
    
  }
  
  func animateMoveForHop() {
    
  }
  
  func animateInvalideMove() {
    
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    var touch = touches.anyObject() as UITouch
    var selectedNode = self.nodeAtPoint(touch.locationInNode(self));
    //if selectedNode.name == "SwopObject"{
    var swopObject: SwopObject? = self.level.objectAtPosition(selectedNode.position).1
    if let object = swopObject {
      moveObject(object)
    }
    var winState = self.level.detectWinState()
    println("WIN STATE:\(winState)")

  }
  
}
