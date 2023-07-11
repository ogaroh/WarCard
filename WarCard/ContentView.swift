//
//  ContentView.swift
//  WarCard
//
//  Created by Erick on 11/07/2023.
//

import SwiftUI

struct ContentView: View {
    // cards
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    // scores
    @State var playerScore = 0
    @State var cpuScore = 0
    
    
    var body: some View {
        
        ZStack  {
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                Image("logo")
                Spacer()
                HStack(spacing: 20) {
                    Spacer()
                    
                    Image(playerCard)
                    
                    Spacer()
                    
                    Image(cpuCard)
                    
                    Spacer()
                }.padding()
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                        .padding()
                }
                
                Spacer()
                HStack (spacing: 20){
                    Spacer()
                    
                    VStack {
                        Text("Player").font(.headline)
                        
                        Text("\(playerScore)").font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU").font(.headline)
                        
                        Text("\(cpuScore)").font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        
    }
    
    // deal cards
    func deal () {
        
        // randomize the players cards
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card\(playerCardValue)"
        
        // randomize the CPU cards
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card\(cpuCardValue)"
        
        // update the scores
        if playerCardValue > cpuCardValue {
            // Player wins
            playerScore += 1
        } else  if playerCardValue < cpuCardValue {
            // CPU wins
            cpuScore += 1
        } else {
            // tie
            playerScore += 1
            cpuScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
