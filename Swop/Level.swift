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
  
  func resetSwopObjects() {
    for var i = 0; i < objects.count; i++ {
      for var j = 0; j < objects[0].count; j++ {
        if (objects[i][j] != nil) {
        objects[i][j]!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        objects[i][j]!.winPosition = CGPointMake(CGFloat(objects.count*30 - j*30), 0.5)
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
        obj!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        obj!.winPosition = CGPointMake(CGFloat(objects.count*30 - i*30), 0.5)
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
  
  func moveObject(object: SKSpriteNode) {
    
  }
  
  private func clearPath(object: SKSpriteNode) {
    
  }
  
  private func obscuredPath(object: SKSpriteNode) {
    
  }
  
  private func objectAtPosition(position: CGPoint) -> Bool {
    
    
    
    
    return true
  }
  
}