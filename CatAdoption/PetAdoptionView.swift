//
//  PetAdoptionView.swift
//  CatAdoption
//
//  Created by Paulus Michael on 02/04/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    
    let leppyData = PetModel.generateLeppyData()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                PetCard(petModel: leppyData, imageName: leppyData.name)
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
    var petModel: PetModel
    
    var imageName: String
    
    var body: some View {
        HStack {
            ImageView(imageName: imageName)
                .background(Color(.white))
            PetInfo(type: petModel.type, name: petModel.name, distance: petModel.distance, weight: petModel.weight, gender: petModel.gender)
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
    let distance: Double
    let weight: Double
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
                    Text("\(distance, specifier: "%.1f") km")
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
                    Text("\(weight, specifier: "%.1f") kg")
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
    
    func calculateWeightOpacity(weight: Double) -> Double{
        if weight > 4{
            return 1.0
        }else{
            return 0.5
        }
    }
    
    func calculateDistanceOpacity(distance: Double) -> Double{
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
