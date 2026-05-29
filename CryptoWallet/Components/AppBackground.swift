import SwiftUI

struct AppBackground: View {
    var body: some View {
        ZStack {
            Color(red: 0.05, green: 0.04, blue: 0.09)
                .ignoresSafeArea()

            RadialGradient(
                colors: [
                    Color(red: 0.28, green: 0.18, blue: 0.52).opacity(0.75),
                    Color.clear
                ],
                center: UnitPoint(x: 0.0, y: 0.0),
                startRadius: 0,
                endRadius: 380
            )
            .ignoresSafeArea()

            RadialGradient(
                colors: [
                    Color(red: 0.28, green: 0.18, blue: 0.52).opacity(0.65),
                    Color.clear
                ],
                center: UnitPoint(x: 1.0, y: 1.0),
                startRadius: 0,
                endRadius: 380
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AppBackground()
}
