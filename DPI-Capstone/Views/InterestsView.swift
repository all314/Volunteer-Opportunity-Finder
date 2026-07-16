import SwiftUI

struct InterestsView: View {
    
    @State private var selectedOptions: Set<String> = ["All"]
    
    let options = [
        "Animal Welfare",
        "Human Services",
        "Environment",
        "Healthcare",
        "Tutoring",
        "Art & Music"
    ]
    
    let icons: [String: String] = [
        "Animal Welfare": "pawprint.fill",
        "Human Services": "person.2.fill",
        "Environment": "leaf.fill",
        "Healthcare": "cross.case.fill",
        "Tutoring": "book.fill",
        "Art & Music": "paintpalette.fill"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 12) {
                
                ForEach(options, id: \.self) { option in
                    let isSelected = selectedOptions.contains(option)
                    
                    Button {
                        toggleSelection(for: option)
                    } label: {
                        HStack(spacing: 8) {
                            
                            Image(systemName: icons[option] ?? "circle.fill")
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(option)
                                .font(.system(size: 15, weight: .semibold))
                            
                            if isSelected {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 13))
                                    .transition(.scale)
                            }
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(
                                    isSelected
                                    ? Color.blue.opacity(0.15)
                                    : Color(.systemBackground)
                                )
                        )
                        .overlay(
                            Capsule()
                                .stroke(
                                    isSelected
                                    ? Color.blue
                                    : Color.gray.opacity(0.25),
                                    lineWidth: 1
                                )
                        )
                        .foregroundColor(
                            isSelected
                            ? .blue
                            : .primary
                        )
                        .shadow(
                            color: .black.opacity(0.06),
                            radius: 6,
                            x: 0,
                            y: 3
                        )
                        .scaleEffect(isSelected ? 1.03 : 1)
                    }
                    .buttonStyle(.plain)
                    .animation(
                        .spring(response: 0.3, dampingFraction: 0.75),
                        value: isSelected
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
        }
    }
    
    private func toggleSelection(for option: String) {
        if option == "All" {
            selectedOptions = ["All"]
        } else {
            selectedOptions.remove("All")
            
            if selectedOptions.contains(option) {
                selectedOptions.remove(option)
                
                if selectedOptions.isEmpty {
                    selectedOptions.insert("All")
                }
            } else {
                selectedOptions.insert(option)
            }
        }
    }
}

#Preview {
    InterestsView()
}
