//
//  PopOutView.swift
//  SlackHeaderAnimation
//
//  Created by Jesus Antonio Gil on 10/4/25.
//

import SwiftUI


struct PopOutView<Header: View, Content: View>: View {
    @ViewBuilder var header: (Bool) -> Header
    @ViewBuilder var content: (Bool) -> Content
    // View Properties
    @State private var sourceRect: CGRect = .zero
    @State private var showFullScreenCover: Bool = false
    @State private var animateView: Bool = false
    
    
    var body: some View {
        header(animateView)
            .background(.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
            .onGeometryChange(for: CGRect.self) {
                $0.frame(in: .global)
            } action: { newValue in
                sourceRect = newValue
            }
            .contentShape(.rect)
            .onTapGesture {
                toogleFullScreenCover()
            }
            .fullScreenCover(isPresented: $showFullScreenCover) {
                PopOutOverlay(
                    sourceRect: $sourceRect,
                    animateView: $animateView,
                    header: header,
                    content: content
                ) {
                    
                }
            }

    }
    
    
    private func toogleFullScreenCover() {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        
        withTransaction(transaction) {
            showFullScreenCover.toggle()
        }
    }
}



fileprivate struct PopOutOverlay<Header: View, Content: View>: View {
    @Binding var sourceRect: CGRect
    @Binding var animateView: Bool
    @ViewBuilder var header: (Bool) -> Header
    @ViewBuilder var content: (Bool) -> Content
    var dismissView: () -> ()
    // View Properties
    @State private var edgeInsets: EdgeInsets = .init()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            header(animateView)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .offset(
            x: sourceRect.minX,
            y: sourceRect.minY
        )
        .ignoresSafeArea()
        .presentationBackground {
            Rectangle()
                .fill(.black.opacity(animateView ? 0.5 : 0))
                .onTapGesture {
                    dismissView()
                }
        }
        .onGeometryChange(for: EdgeInsets.self) {
            $0.safeAreaInsets
        } action: { newValue in
            edgeInsets = newValue
        }
    }
}


#Preview {
    ContentView()
}
