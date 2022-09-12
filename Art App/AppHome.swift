//
//  AppHome.swift
//  Art App
//
//  Created by Quint DeNiro Fain on 9/7/22.
//

// Nicolas Zacharis (9/11/22)
import SwiftUI

struct Drawing {
    var points: [CGPoint] = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct AppHome: View {
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = []
    @State private var selectedColor: Color = .black
    @State private var thickness: Double = 0.0
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    //ContentView()
                }, label: {
                    Text("Logout")
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                }).cornerRadius(25)
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
                    self.currentDrawing = Drawing(points: [], color: selectedColor, lineWidth: thickness)
                    })
            )
                
            HStack {
                Image("eraser-icon").resizable().frame(width: 50.0, height: 50.0).scaledToFit().onTapGesture {
                    selectedColor = Color.white
                    currentDrawing.color = Color.white
                }
                
                Slider(value: $thickness, in: 2...20) {
                    
                }.onChange(of: thickness){ newThickness in
                    currentDrawing.lineWidth = newThickness
                }
                
                ColorPickerView(selectedColor: $selectedColor)
                    .onChange(of: selectedColor) { newColor in
                        currentDrawing.color = newColor
                    }.padding().border(.black)
            }
            .foregroundColor(.black)
            .background(.gray)
            .border(.black)
            
        }.background(Color.white)
        
    }
}


struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
            .previewInterfaceOrientation(.portrait)
    }
}
