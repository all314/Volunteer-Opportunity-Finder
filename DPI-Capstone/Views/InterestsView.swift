import SwiftUI

struct InterestsView: View {
    
    @ObservedObject var user: UserProfile   // was: var user: UserProfile
    @State private var selectedOptions: Set<Interests> = []
    
    let options: [Interests] = [
        .animalWelfare,
        .humanService,
        .environment,
        .healthcare,
        .tutoring,
        .artMusic
    ]
    
    let icons: [Interests: String] = [
        .animalWelfare: "pawprint",
        .humanService: "person.3",
        .environment: "leaf",
        .healthcare: "cross.case",
        .tutoring: "book",
        .artMusic: "paintpalette"
    ] //dictionary!
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("What types of volunteer opportunities interest you?")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                
                //displays the interest options in grid
                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(options, id: \.self) {option in
                        
                        let isSelected = selectedOptions.contains(option)
                        
                        Button {
                            toggleSelection(for: option)
                        } label: {
                            HStack(spacing: 8) {
                                
                                Image(systemName: icons[option] ?? "circle")
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Text(option.rawValue)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Spacer()
                                
                                
                            }
                            .foregroundColor(isSelected ? Color.darkerGreen : .primary)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(isSelected ? Color.darkerGreen.opacity(0.2) : Color.white.opacity(0.75))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        isSelected ? Color.darkerGreen : Color.gray.opacity(0.1),
                                        lineWidth: 1
                                    )
                            )
                            .shadow(color: .black.opacity(0.05), radius: 3, y: 2)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 24)
                
                NavigationLink {
                    Home(userProfile: user)
                } label: {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.sage)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal, 24)
                .padding(.top, 30)
                
                
                Spacer()
            }
        }
    }
    
    private func toggleSelection(for option: Interests) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }
        
        user.interests = Array(selectedOptions)
    }
    
    //basically if the option isn't selected then it adds it to the array and if it is then it removes from the array
    //then modifies the user's array
}

#Preview {
    InterestsView(
        user: UserProfile(
            name: "Advika", lat: 41.88, long: -87.62,
            interests: [], mileRadius: 10, age: 17,
            interestedOpportunities: [], hourLog: []
        )
    )
}
