//
//  NoListView.swift
//  TodoApp
//
//  Created by Anand Stephan on 11/03/24.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate:Bool = false
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing:20){
                Text("There are no Items !!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Be more productive and some todos to finish them on time !!")
                    .padding(.bottom,20)
                NavigationLink(destination:AddView()){
                    Text("Add Something 😀 ")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("NewColor"):Color.accentColor)
                        .cornerRadius(10)
                        .padding(.horizontal,animate ? 30:50)
                        .shadow(color:animate ? Color("NewColor").opacity(0.7):Color.accentColor.opacity(0.7),radius: animate ? 30:50,x:0,y: animate ? 50:30)
                        .offset(y: animate ? -7:0)
                }
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform:addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(Animation.easeInOut(duration: 2.0)
                .repeatForever()){
                    animate.toggle()
                }
        }
    }
}

#Preview {
    NoListView()
}
