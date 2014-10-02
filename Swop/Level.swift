//
//  Level.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import Foundation
import SpriteKit

class Level {
  
  var objects = [[SwopObject?]]()
  var tiles = [[SKSpriteNode]]()
  
  init() {
    //could make array of optionals and fill values later
    initializeObjects()
    initializeTiles()
    //    resetSwopObjects()
  }
  
  func resetLevel() {
    for var i = 0; i < 1; i++ {
      for var j = 0; j < 7; j++ {
        if (objects[j][i] != nil) {
          objects[j][i]!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
          objects[j][i]!.winPosition = CGPointMake(CGFloat((180)-(j*30)), 0.5)
        }
      }
    }
  }
  
  func initializeTiles(){
    for var i = 0; i < 1; i++ {
      for var j = 0; j < 7; j++ {
        var node = SKSpriteNode(color: SKColor.blackColor(), size: CGSizeMake(30, 28))
        node.position = CGPointMake(CGFloat(j*30),0.5)
        tiles.append(([(node)]))
      }
    }
  }
  
  func initializeObjects() {
    for var i = 0; i < 1; i++ {
      for var j = 0; j < 7; j++ {
        var obj: SwopObject? = SwopObject()
        if j <= 2 {
          obj?.type = SwopObject.Direction.right
          obj?.sprite.color = SKColor.redColor()

        }
        else if j >= 4 {
          obj?.type = SwopObject.Direction.left
          obj?.sprite.color = SKColor.blueColor()

        }
        obj!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        obj!.winPosition = CGPointMake(CGFloat((180)-(j*30)), 0.5)
        if j == 3 {
          obj = nil
        }
        objects.append(([(obj)]))
        
      }
    }
  }
  
  func detectWinState() -> Bool {
    for objectArray in objects {
      for object in objectArray {
        if let currentObject = object {
          if currentObject.sprite.position != currentObject.winPosition {
            return false
          }
        }
      }
    }
    return true
  }
  
  func movePosition(object: SwopObject) -> CGPoint?{
    var newPosition: CGPoint? = object.sprite.position
    var adjacentPosition: CGPoint?
    var hopPosition: CGPoint?
 
    switch object.type {
    case .left:
      println("left pos")
      adjacentPosition = CGPointMake(object.sprite.position.x - 30, object.sprite.position.y)
      hopPosition = CGPointMake(object.sprite.position.x - 60, object.sprite.position.y)
    case .right:
    println("right pos")
    adjacentPosition = CGPointMake(object.sprite.position.x + 30, object.sprite.position.y)
    hopPosition = CGPointMake(object.sprite.position.x + 60, object.sprite.position.y)
      
    default:
      println("no pos")
    }
    
    var adjacentObject: Bool  = objectAtPosition(adjacentPosition!).0
    var hopObject: Bool = objectAtPosition(hopPosition!).0
    
    if !adjacentObject {
      newPosition = adjacentPosition
    } else if(!hopObject) {
      newPosition = hopPosition
    }
    
    return newPosition
  }
  
  
  
  func objectAtPosition(position: CGPoint) -> (Bool, SwopObject?) {
    for objectArray in objects {
      for object in objectArray {
        if let currentObject = object {
          if currentObject.sprite.position == position {
            return (true, currentObject)
          }
        }
      }
    }
    return (false,nil)
  }
  
}