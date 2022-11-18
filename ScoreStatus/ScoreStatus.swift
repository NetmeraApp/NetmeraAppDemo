//
//  ScoreStatus.swift
//  ScoreStatus
//
//  Created by Elif Yürektürk on 3.11.2022.
//
import WidgetKit
import SwiftUI
import Intents

@main
struct ScoreStatus: Widget{
    var body: some WidgetConfiguration{
        
        ActivityConfiguration(attributesType: ScoreAttributes.self) { context in
           
            ZStack{
                RoundedRectangle(cornerRadius: 15,style: .continuous)
                    .fill(Color("Blue").gradient)
                VStack{
                    HStack{
                        Image("BJK")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60,height: 60)
                            .shadow(radius: 8)
                        VStack(alignment: .center, spacing: 6.0) {
                            HStack {
                                Text(context.state.teamAScore)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(":")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                                Text(context.state.teamBScore)
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 5.0)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                            HStack(alignment: .center, spacing: 2.0) {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 6, height: 6)
                                Text("Q1")
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                                Text(context.state.estimatedDeliveryTime, style: .timer)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 50)
                                    .monospacedDigit()
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                            }

                        }
                        Image("Hatay")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60,height: 60)
                            .shadow(radius: 8)
                    }
                    HStack(alignment: .center, spacing: 1.0) {
                        Text(context.state.text)
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                }

                    .padding(.vertical, 6.0)
                }
        }
    }
}
