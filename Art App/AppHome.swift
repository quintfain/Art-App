//
//  AppHome.swift
//  Art App
//
//  Created by Quint DeNiro Fain on 9/7/22.
//

import SwiftUI

struct Drawing {
    var points: [CGPoint] = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct AppHome: View {
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = []
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Logout Button")
            }
            Spacer()
            Canvas { context, size in
                
                for drawing in drawings {
                    var path = Path()
                    path.addLines(drawing.points)
                    context.stroke(path, with: .color(drawing.color), lineWidth: drawing.lineWidth)
                }
                
            }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    let newPoint = value.location
                    currentDrawing.points.append(newPoint)
                    self.drawings.append(currentDrawing)
                })
                .onEnded({ value in
                    self.currentDrawing = Drawing(points: [])
                    })
            )
                
            Spacer()
            HStack {
                Text("Erase Icon")
                Spacer()
                Text("Paint Icon")
            }
        }
    }
}


struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
            .previewInterfaceOrientation(.portrait)
    }
}
