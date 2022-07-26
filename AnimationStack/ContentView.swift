//
//  ContentView.swift
//  Animations2
//
//  Created by Kyle Warren on 7/25/22.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

//struct ContentView: View {
//    @State private var isShowingRed = false
//
//    var body: some View {
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
////                    .transition(.scale)
//            }
//        }
//    }
//}

//struct ContentView: View {
//    let letters = Array("Hello, SwiftUI")
//    @State private var enabled =  false
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                // delay animation based on letters position inside of the string we are trying to draw
//                    .animation(
//                        .default.delay(Double(num) / 20),
//                        value: dragAmount)
//            }
//        }
//        .gesture(
//        DragGesture()
//            .onChanged { dragAmount = $0.translation }
//            .onEnded { _ in
//                dragAmount = .zero
//                enabled.toggle()
//            }
//        )
//    }
//}

//struct ContentView: View {
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .trailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                // Explicit animation only animates release
//                .onEnded { _ in
//                    withAnimation {
//                    dragAmount = .zero }
//                }
//            )
//        // Implicit animation that affects drag and release
////            .animation(.spring(), value: dragAmount)
//    }
//}

//struct ContentView: View {
//    @State private var enabled = false
//
//    var body: some View {
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(nil, value: enabled)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
