////
////  ARViewContainer.swift
////  ARVRApp1
////
////  Created by Piyush Anand on 29/11/24.
////
//
//import SwiftUI
//import ARKit
//
//// ARViewContainer to integrate ARKit's ARView into SwiftUI
//struct ARViewContainer: UIViewRepresentable {
//    @Binding var arView: ARView?
//    
//    // This method is called when the view is created
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        self.arView = arView
//
//        // Set up AR configuration
//        let configuration = ARWorldTrackingConfiguration()
//        arView.session.run(configuration)
//
//        return arView
//    }
//    
//    // This method is called when the view is updated
//    func updateUIView(_ uiView: ARView, context: Context) {
//        // Here you can update the ARView with any changes (e.g., adding 3D models or interacting with AR)
//    }
//}
