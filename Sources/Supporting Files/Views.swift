import SwiftUI

struct HeroView: View {
    private let tracking: CGFloat = -4

    var body: some View {
    #if os(iOS)
        Image("Auth0")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 256, height: 256, alignment: .center)
            .padding(.top, 50)
        VStack(alignment: .leading, spacing: 0) {
            Text("Swift-")
                .tracking(self.tracking)
                .foregroundStyle(
                    .linearGradient(
                      colors: [Color("DarkPurple"), Color("SkyBlue")],
                      startPoint: .bottomLeading,
                      endPoint: .topTrailing
                    ))
            Text("Redirect")
                .tracking(self.tracking)
                .foregroundStyle(
                    .linearGradient(
                      colors: [Color("DarkPurple"), Color("SkyBlue")],
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing
                    )
                )
            Text("App")
                .tracking(self.tracking)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.custom("SpaceGrotesk-Medium", size: 80))
    #else
        Text("Swift Sample App")
            .font(.title)
    #endif
    }
}

struct ProfileHeader: View {
    @State var picture: String

    private let size: CGFloat = 100

    var body: some View {
    #if os(iOS)
        AsyncImage(url: URL(string: picture), content: { image in
            image.resizable()
        }, placeholder: {
            Color.clear
        })
        .frame(width: self.size, height: self.size)
        .clipShape(Circle())
        .padding(.bottom, 24)
    #else
        Text("Profile")
    #endif
    }
}

struct ProfileCell: View {
    @State var key: String
    @State var value: String

    private let size: CGFloat = 14

    var body: some View {
        HStack {
            Text(key)
                .font(.system(size: self.size, weight: .semibold))
            Spacer()
            Text(value)
                .font(.system(size: self.size, weight: .regular))
                .foregroundColor(Color("Gray"))
        }
        .listRowBackground(Color.white)
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    private let padding: CGFloat = 8

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .semibold))
            .padding(.init(top: self.padding,
                           leading: self.padding * 6,
                           bottom: self.padding,
                           trailing: self.padding * 6))
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
