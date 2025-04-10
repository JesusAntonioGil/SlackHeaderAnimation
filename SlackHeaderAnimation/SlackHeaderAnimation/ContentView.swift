//
//  ContentView.swift
//  SlackHeaderAnimation
//
//  Created by Jesus Antonio Gil on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                
                PopOutView { isExpanded in
                    HStack {
                        Image(systemName: "number")
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("general")
                                .fontWeight(.semibold)
                            
                            Text("36 Members - 4 Online")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 50)
                } content: { isExpanded in
                    
                }

                Image(systemName: "airpods.max")
                    .font(.title3)
            }
            
            Spacer()
        }
        .padding(15)
    }
}

#Preview {
    ContentView()
}
