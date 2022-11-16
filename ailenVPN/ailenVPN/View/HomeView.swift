//
//  HomeView.swift
//  ailenVPN
//
//  Created by Данила Кардашевский on 16.11.2022.
//

import SwiftUI

struct HomeView: View {
    
@State var isConnected = false
    
    
    var body: some View {
      
        VStack{
            
            
            
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "network.badge.shield.half.filled")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 10 )
                                .strokeBorder(.white.opacity(0.25),lineWidth: 1))
                        
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 10 )
                                .strokeBorder(.white.opacity(0.25),lineWidth: 1))
                        
                }

            }
            .overlay(
                Text(getTitle())
                    .foregroundColor(.white)
            )
            
            
            powerButton()
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(
        
            ZStack{
                LinearGradient(colors: [
                    Color("BG1"),
                    Color("BG1"),
                    Color("BG2"),
                    Color("BG2"),
                ], startPoint: .top, endPoint: .bottom)
                
                  
            }
                .ignoresSafeArea()
        
        )
        
    }
    
    func getTitle()->AttributedString{
        var str = AttributedString("AlienVPN")
        
        if let range = str.range(of: "Alien"){
            str[range].font = .system(size: 24,weight: .light)
        }
        
        if let range = str.range(of: "VPN"){
            str[range].font = .system(size: 24,weight: .black)
        }
        
         return str
    }
    
    @ViewBuilder
    func powerButton()-> some View {
        
        Button {
            withAnimation{
                isConnected.toggle()
            }
            
        } label: {
            ZStack{
                Image(systemName: "power")
                    .font(.system(size: 65,weight: .bold))
                    .foregroundColor(isConnected ? .white : Color("Power"))
                    .scaleEffect(isConnected ? 0.7 : 1 )
                    .offset(y:isConnected ? -30 : 0)
                
                Text("DISCONNECT")
                    .fontWeight(.bold)
                    .foregroundColor (.white)
                    .offset (y: 20)
                    .opacity(isConnected ? 1 : 0)
                
            }
            //circle line
                .frame(maxWidth: 190,maxHeight: 190)
                .background(
                    ZStack{
                         Circle()
                            .trim(from:isConnected ? 0 : 0.3, to: isConnected ? 1 : 0.5)
                            .stroke(
                            LinearGradient(colors: [
                            
                            Color("ring1"),
                            Color("ring1")
                                .opacity(0.5),
                            Color("ring1")
                                .opacity(0.3),
                            Color("ring1")
                                .opacity(0.1),
                            
                            ], startPoint: .leading, endPoint: .trailing ),
                            style: StrokeStyle(lineWidth: 11,lineCap: .round,lineJoin: .round)
                            )
                            .shadow(color: Color("ring1"), radius: 5,x: 1,y: -4)
                        
                        Circle()
                            .trim(from:isConnected ? 0 : 0.3, to:
                                    isConnected ? 1 : 0.55)
                           .stroke(
                           LinearGradient(colors: [
                           
                           Color("ring2"),
                           Color("ring2")
                               .opacity(0.5),
                           Color("ring2")
                               .opacity(0.3),
                           Color("ring2")
                               .opacity(0.1),
                           
                           ], startPoint: .leading, endPoint: .trailing ),
                           style: StrokeStyle(lineWidth: 11,lineCap: .round,lineJoin: .round)
                           )
                           .shadow(color: Color("ring2 "), radius: 5,x: 1,y: -4)
                           .rotationEffect(.init(degrees: 160))
                        
                        Circle()
                            .stroke(
                            
                            Color("ring1")
                                .opacity(0.01),
                            lineWidth: 11
                            
                            )
                            .shadow(color: Color("ring2 ").opacity(isConnected ? 0.04 : 0), radius: 5,x: 1,y: -4)
                    }
                )
        }
        .padding(.top,100)

         
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension View{
    func getRect()->CGRect{
        UIScreen.main.bounds
    }
}
