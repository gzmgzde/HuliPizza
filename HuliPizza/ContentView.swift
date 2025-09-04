//
//  ContentView.swift
//  HuliPizza
//
//  Created by Gizem Aydin on 04/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    var orders:[Int] = [1,2,3,4,6]
    
    
    var body: some View {
        VStack {
            
            ZStack { //bottom code is on top
                
                Image("surfBanner")
                    .resizable() //to be able to use scale to fit
                    .scaledToFit() //to fit the image to screen
                
                Text("Huli Pizza Company")
                    .background() //adds white background to text
            }
            
            Image(systemName: orders.isEmpty ? "cart":"cart.circle.fill") //copy name from SF symbols, cart icon will change if theres something in the cart
            
            HStack {
                
                Text("Order Pizza")
                    .font(.title) //to change size of text
                Spacer()
            }
            
            ScrollView{
                ForEach (orders, id: \.self){ order in
                    HStack(alignment:.firstTextBaseline){
                        Text("Your Order Item \(order)")
                        Spacer()
                        Text(19.90, format: .currency(code: "GBP")) //auto currency sign
                    }
                }
            }
            
            VStack {
                if let image = UIImage(named:"0_lg"){ //if theres that image use that, if not, use surfboard one
                    Image(uiImage: image)
                }else {
                    Image("surfboard_lg")
                }
                Text("Margherita")
                Text("Description")
            }
            
            ScrollView{ //makes it scrollable
                ForEach(1...25, id: \.self){ item in //for loop
                    HStack(alignment:.top, spacing: 15){ //horizontal stack, text aligns to top and 15px space between image
                        
                        //** Image(systemName: "\(item).circle.fill") //changes by the item id
                            //** .font(.largeTitle) //to make symbol larger
                        
                        if let image = UIImage(named:"\(item)_sm"){
                            Image(uiImage: image)
                        }else {
                            Image("surfboard_sm")
                        }
                        
                        VStack (alignment: .leading){ //leading makes it all lined up
                            Text("Margherita")
                            Text("Description")
                        }
                    }
                }}

            Spacer() //to push everything
        }
        .padding()
    }
}

#Preview {
    ContentView()
        //** .colorScheme(.dark) //do every value dark mode
        //** .background(Color.black) //to make background black
}
