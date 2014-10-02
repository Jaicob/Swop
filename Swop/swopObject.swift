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
  
  enum Direction : String{
    case Unknown = "unknown"
    case up = "up"
    case down = "down"
    case left = "left"
    case right = "right"
    
//    func asString() -> String {
//      switch self {
//      case .up:
//        return "up"
//      case .down:
//        return "down"
//      case .left:
//        return "left"
//      case .right:
//        return "right"
//      default:
//        return "unkown"
//      }
  //}
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