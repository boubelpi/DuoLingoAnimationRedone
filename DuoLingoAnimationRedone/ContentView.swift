//
//  ContentView.swift
//  DuoLingoAnimationRedone
//
//  Created by Pavel on 21/11/22.
//

import SwiftUI
import SpriteKit

class GameScene : SKScene {
    var player : SKSpriteNode!
    private var playerAtlas : SKTextureAtlas {
        return SKTextureAtlas(named : "Sprites")
    }
    private var playerTexture : SKTexture {
        return playerAtlas.textureNamed("ani5")
    }
    private func setupPlayer() {
        player = SKSpriteNode(texture : playerTexture, size : CGSize(width : 200, height : 200))
        player.position = CGPoint(x : frame.width / 2, y : frame.height / 2)
        addChild(player)
    }
    private var playerTextures : [SKTexture] {
        return [
            playerAtlas.textureNamed("ani5"),
            playerAtlas.textureNamed("anima1"),
            playerAtlas.textureNamed("animaz3"),
            playerAtlas.textureNamed("ani6")
        ]
    }
    func startAnimations() {
        let anim = SKAction.animate(with : playerTextures, timePerFrame : 0.3)
        player.run(SKAction.repeatForever(anim), withKey : "playerIdleAnimations")
    }
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        self.setupPlayer()
        self.startAnimations()
    }
}

struct ContentView: View {
    
    var scene : SKScene {
        let scene = GameScene()
        scene.size = CGSize(width : 216, height : 216)
        scene.scaleMode = .fill
        return scene
    }
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State var current_text = txt.find_text_under_animation()
    var body: some View {
        VStack {
            SpriteView(scene : self.scene)
                .frame(width : 256, height : 256)
            Text("LOADING...")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(.gray)
            Text(current_text)
                .font(.body)
                .padding(5)
                .onReceive(timer) {_ in
                    self.current_text = txt.find_text_under_animation()
                    
                }
        }
        .padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
