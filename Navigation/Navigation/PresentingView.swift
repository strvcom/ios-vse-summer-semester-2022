//
//  PresentingView.swift
//  Navigation
//
//  Created by Jan Kaltoun on 23.03.2022.
//

import SwiftUI

struct PresentingView: View {
    enum Item: String, Identifiable, CaseIterable {
        case first
        case second
        
        var id: RawValue {
            rawValue
        }
    }
    
    @State var isSheetPresented = false
    @State var isFullScreenCoverPresented = false
    @State var presentedItem: Item?
    @State var isAlertPresented = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Modal presentation")
                .font(.largeTitle)
            
            Button {
                isSheetPresented = true
            } label: {
                Text("Sheet")
            }
            
            Button {
                isFullScreenCoverPresented = true
            } label: {
                Text("Full Screen Cover")
            }
            
            HStack(spacing: 16) {
                ForEach(Item.allCases) { item in
                    Button {
                        presentedItem = item
                    } label: {
                        Text("Item - \(item.rawValue)")
                    }
                }
            }
            
            Button {
                isAlertPresented = true
            } label: {
                Text("Alert")
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            PresentedView(title: "Sheet")
        }
        .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
            PresentedView(title: "Full Screen Cover")
        }
        .sheet(item: $presentedItem) { item in
            PresentedView(title: "Item - \(item.rawValue)")
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Hello world"),
                message: Text("This is a pretty neat alert!"),
                primaryButton: .default(
                    Text("Nice")
                ),
                secondaryButton: .destructive(
                    Text("Cancel")
                ) {
                    print("We can do stuff here!")
                }
            )
        }
    }
}

fileprivate struct PresentedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Text(title)
                    .font(.largeTitle)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Dismiss")
                }
            }
        }
    }
}
