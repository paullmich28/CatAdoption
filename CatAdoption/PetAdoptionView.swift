//
//  PetAdoptionView.swift
//  CatAdoption
//
//  Created by Paulus Michael on 02/04/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                PetCard(name: "Leppy", type: "Domestic", distance: 1, weight: 3, gender: "Male", imageName: "Leppy")
                    .shadow(radius: 10)
                PetCard(name: "Butet", type: "Persian", distance: 3, weight: 5, gender: "Female", imageName: "Butet")
                    .shadow(radius: 10)
                PetCard(name: "Sky", type: "Domestic", distance: 8, weight: 4, gender: "Female", imageName: "Sky")
                    .shadow(radius: 10)
                PetCard(name: "Kentang", type: "British Shorthair", distance: 8, weight: 4, gender: "Female", imageName: "Kentang")
                    .shadow(radius: 10)
                
                Spacer()
            }
            .padding(16)
            .navigationBarTitle("Discover")
            .toolbar {
                Button(action: {
                    isFilterViewPresented = true
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(.orange)
                }
            }
            .sheet(isPresented: $isFilterViewPresented) {
                FilterView()
            }
        }
    }
}

struct PetCard: View {
    let name: String
    let type: String
    let distance: Int
    let weight: Int
    let gender: String
    var imageName: String
    
    
    var body: some View {
        HStack {
            ImageView(imageName: imageName)
                .background(Color(.white))
            PetInfo(type: type, name: name, distance: distance, weight: weight, gender: gender)
                .padding(.horizontal, 10.0)
        }
        .frame(height: 120)
        .background(Color(.white))
        .cornerRadius(8)
    }
}

struct PetInfo: View {
    let type: String
    let name: String
    let distance: Int
    let weight: Int
    let gender: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(name)
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.pink)
                        .font(.title)
                }
            }.padding(.trailing, 16)
            Text(type)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
            HStack {
                HStack {
                    Image(systemName: "location.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                        .opacity(calculateDistanceOpacity(distance: distance))
                    Text("\(distance) km")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Image(systemName: "scalemass.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                        .opacity(calculateWeightOpacity(weight: weight))
                    Text("\(weight) kg")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Image(systemName: "pawprint.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                    Text(gender)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }.padding(.vertical, 16.0)
    }
    
    func calculateWeightOpacity(weight: Int) -> Double{
        if weight > 4{
            return 1.0
        }else{
            return 0.5
        }
    }
    
    func calculateDistanceOpacity(distance: Int) -> Double{
        if distance >= 5{
            return 1.0
        }else{
            return 0.5
        }
    }
}

struct ImageView: View {
    let imageName: String
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 120, height: 120) // Set the frame here
            .overlay(
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
