//
//  ContentView.swift
//  SlackHeaderAnimation
//
//  Created by Jesus Antonio Gil on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                
                PopOutView { isExpanded in
                    HStack(spacing: 10) {
                        ZStack {
                            if !isExpanded {
                                Image(systemName: "number")
                                    .fontWeight(.semibold)
                                    .matchedGeometryEffect(id: "#", in: animation)
                            }
                        }
                        .frame(width: 20)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 0) {
                                if isExpanded {
                                    Image(systemName: "number")
                                        .fontWeight(.semibold)
                                        .matchedGeometryEffect(id: "#", in: animation)
                                        .scaleEffect(0.8)
                                }
                                
                                Text("general")
                            }
                            .fontWeight(.semibold)
                            
                            Text("36 Members - 4 Online")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .offset(x: isExpanded ? -30 : 0)
                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 50)
                } content: { isExpanded in
                    VStack(spacing: 12) {
                        CustomButton("message", title: "Messages")
                        CustomButton("note.text", title: "#general")
                        CustomButton("square.3.stack.3d.top.fill", title: "Files")
                        CustomButton("folder", title: "Bookmarks")
                        
                        Divider()
                        
                        CustomButton("text.book.closed", title: "Members")
                        CustomButton("gearshape", title: "Settings & Details")
                    }
                }

                Image(systemName: "airpods.max")
                    .font(.title3)
            }
            
            Spacer()
        }
        .padding(15)
    }
    
    
    @ViewBuilder
    private func CustomButton(_ image: String, title: String, action: @escaping () -> () = { }) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: image)
                    .frame(width: 25)
                
                Text(title)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 5)
            .foregroundStyle(Color.primary)
        }
    }
}

#Preview {
    ContentView()
}
