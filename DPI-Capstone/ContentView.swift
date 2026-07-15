import SwiftUI

struct ContentView: View {

    @State private var name: String = ""
    @State private var latitude: Double? = nil
    @State private var longitude: Double? = nil

    var body: some View {

        ZStack {

            Color(red: 0.93, green: 0.96, blue: 0.91)
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color(red: 0.56, green: 0.72, blue: 0.58))
                        .frame(width: 95, height: 95)

                    Image(systemName: "leaf.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                }

                VStack(spacing: 8) {

                    Text("Volunteer Finder")
                        .font(.system(size: 34, weight: .bold))

                    Text("Explore volunteer opportunities near you")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 18) {

                    TextField("Your Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Latitude", value: $latitude, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Longitude", value: $longitude, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    NavigationLink {
                        
                        InterestsView()
                        
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.39, green: 0.60, blue: 0.43))
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
