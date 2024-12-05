//
//  NewARScreen.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//

import SwiftUI
import ARKit
import RealityKit

// This is the new screen that will show the AR view
struct NewARScreen: View {
    @State private var arView: ARView?

    var body: some View {
        ZStack {
            ARViewContainer(arView: $arView) // Embed ARView in SwiftUI

            VStack {
                // You can customize the AR screen further
                Text("AR Monster Battle")
                    .font(.title)
                    .padding()
                
                // Add any UI elements or instructions for the user
                Button("Start Battle") {
                    // Add logic to start the AR battle here
                    print("Battle Started!")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

// The ARViewContainer should be defined to embed RealityKit AR content
struct ARViewContainer: UIViewRepresentable {
    @Binding var arView: ARView?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        self.arView = arView
        
        // AR setup (add 3D models, start AR session, etc.)
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        loadPikachuModel(arView: arView)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Update AR view if needed
    }
    private func loadPikachuModel(arView: ARView) {
            // Ensure the model is loaded correctly
            guard let pikachuAnchor = try? Entity.loadAnchor(named: "Pikachu") else {
                print("Failed to load Pikachu model")
                return
            }
            pikachuAnchor.scale = SIMD3(x: 0.001, y: 0.001, z: 0.001)
            // Add the model to the AR scene
            arView.scene.addAnchor(pikachuAnchor)
        }
}

