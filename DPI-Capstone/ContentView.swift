//Lat: 41.885826  Long: -87.626955
//hi jeet/kareem!!

import SwiftUI
import Combine

struct ContentView: View {

    @State private var name: String = ""
    @State private var mileRadius: Double? = nil
    @State private var age: Int? = nil
    @State var lat: Double? = nil
    @State var long: Double? = nil

    @StateObject private var locationManager = LocationManager()


    var body: some View {

        ZStack {

            Color.offWhite
                .ignoresSafeArea()


            VStack(spacing: 30) {


                Spacer()


                ZStack {

                    Circle()
                        .fill(Color.darkerGreen)
                        .frame(width: 95, height: 95)


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

                }



                VStack(spacing: 18) {


                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))



                    TextField("Age", value: $age, format: .number)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))



                    Button {

                        lat = 41.881832
                        long = -87.623109
                        locationManager.requestLocation() //so it still runs the api and also triggers the location prompt but the actual coords it reads are the hardcoded ones

                    } label: {

                        HStack {

                            Image(systemName: "location.fill")

                            Text(
                                locationManager.locationFound
                                ? "Location Found"
                                : "Use My Location"
                            )
                        }

                    }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.darkerGreen)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))



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
                                mileRadius: mileRadius ?? 10,
                                age: age ?? 0,
                                interestedOpportunities: [],
                                hourLog: []

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
                .background(Color.beige)
                .clipShape(RoundedRectangle(cornerRadius: 28))
                .shadow(color: .black.opacity(0.08), radius: 15, y: 8)



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
