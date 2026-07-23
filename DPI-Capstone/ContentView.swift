//Lat: 41.885826  Long: -87.626955

import SwiftUI
import Combine

struct ContentView: View {

    @State private var name: String = ""
    @State var lat: Double? = nil
    @State var long: Double? = nil
    @State private var mileRadius: Double? = nil
    @State private var age: Int? = nil
    
    @ObservedObject private var locationService = DeviceLocationService.shared
    @State private var showLocationDeniedAlert = false
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {

        ZStack {

            Color(.offWhite)
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color.darkerGreen)
                        .frame(width: 100, height: 100)

                    Image("AppLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 80)
                        .clipShape(Circle())
                }

                VStack(spacing: 8) {

                    Text("VolunTrack")
                        .font(.system(size: 34, weight: .bold))

                    Text("See a need, take the lead!")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 18) {

                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    TextField("Age", value: $age, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Latitude", value: $lat, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Longitude", value: $long, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    Button{
                        lat = 41.88581
                        long = -87.62687
                    } label:
                    {
                        Text("I'm at Harold Washington College")
                            .font(.system(size: 15))
                            .padding(.vertical, 4)
                    }
                    .padding(.horizontal)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: 265, maxHeight: 180)
                        .background(Color.offWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        
                    
                    TextField("Mile Radius", value: $mileRadius, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    NavigationLink {
                        InterestsView(
                            user: UserProfile(
                                name: name,
                                lat: lat ?? 0,
                                long: long ?? 0,
                                interests: [],
                                mileRadius: mileRadius ?? 0,
                                age: age ?? 0
                            )
                        )
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.darkerGreen)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    

                }
                .padding(25)
                .background(Color.beige).clipShape(RoundedRectangle(cornerRadius: 28))
                .shadow(color: .black.opacity(0.08), radius: 15, y: 8)
                .padding(.horizontal)

                Spacer()

            }
            .padding()
            
           
            }
        }
    }


#Preview {
    NavigationStack{
        ContentView()
    }
   
}
