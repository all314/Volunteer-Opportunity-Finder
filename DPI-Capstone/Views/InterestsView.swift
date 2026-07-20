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

    private let sage = Color(red: 0.42, green: 0.60, blue: 0.47)
    private let beige = Color(red: 0.98, green: 0.97, blue: 0.94)

    private let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]

    var body: some View {
        ZStack {
            beige
                .ignoresSafeArea()

            VStack {
                Spacer()

                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(options, id: \.self) { option in
                        let isSelected = selectedOptions.contains(option)

                        Button {
                            toggleSelection(for: option)
                        } label: {
                            HStack(spacing: 8) {

                                Image(systemName: icons[option] ?? "circle.fill")
                                    .font(.system(size: 15, weight: .semibold))

                                Text(option)
                                    .font(.system(size: 15, weight: .semibold))
                                    .multilineTextAlignment(.leading)

                                Spacer()

                                if isSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 14))
                                }
                            }
                            .foregroundColor(isSelected ? sage : .primary)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(isSelected ? sage.opacity(0.18) : Color.white.opacity(0.75))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        isSelected ? sage : Color.gray.opacity(0.15),
                                        lineWidth: 1
                                    )
                            )
                            .shadow(
                                color: .black.opacity(0.04),
                                radius: 3,
                                y: 2
                            )
                        }
                        .buttonStyle(.plain)
                        .animation(.easeInOut(duration: 0.2), value: isSelected)
                    }
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: 700)

                Spacer()
            }
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
