//
//  swopObject.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import Foundation
import SpriteKit

let swopSize = CGSizeMake(28, 28)

class SwopObject {
  
  enum Direction: Int, Printable {
    case Unknown = 0, up, down, left, right
    var spriteName: String {
      let spriteNames = [
        "Up",
        "Down",
        "Left",
        "Right"]
        return spriteNames[toRaw() - 1]
    }
    var description: String {
      return spriteName
    }
  }
  
  var sprite: SKSpriteNode
  var type: Direction
  var winPosition: CGPoint
  
  init(){
    sprite = SKSpriteNode(color: SKColor.grayColor(), size: swopSize)
    type = Direction.Unknown
    winPosition = CGPointZero
  }
  
  init(sprite: SKSpriteNode, type: Direction, winPosition: CGPoint){
    self.sprite = sprite
    self.type = type
    self.winPosition = winPosition
  }
  
  convenience init(sprite: SKSpriteNode, type: Direction){
    self.init(sprite: sprite,type: type,winPosition: CGPointZero)
  }
  
  convenience init(type: Direction, winPosition: CGPoint){
    self.init(sprite: SKSpriteNode(color: SKColor.grayColor(), size: swopSize),type: type,winPosition: CGPointZero)
  }
  
  convenience init(sprite: SKSpriteNode){
    self.init(sprite: sprite,type: Direction.Unknown, winPosition: CGPointZero)
  }
}