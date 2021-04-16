import SwiftUI
import PlaygroundSupport
public struct ContentView: View {
    
    @State var isHoverYes = false
    @State var isHoverNo = false
    
    public init(){
        
    }
    public var body: some View {
        var noPickEffect = "noPick"
        var yesPickEffect = "yesPick"
        
        VStack(alignment: .center){
            Spacer()
            Text("Let's Talk About")
                .font(Font.custom("Chinese Rocks", size: 100))
                .foregroundColor(.black)
            
            HStack(alignment: .center){
                Spacer()
                Text("Rock?")
                    .font(Font.custom("Chinese Rocks", size: 100))
                    .foregroundColor(.black)
                Spacer()
            }
            Spacer()
                .frame(height: 150)
            HStack(alignment: .center){
                Image(uiImage: UIImage(named: "noPick")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .shadow(radius: isHoverNo ? 5 : 0)
                    .animation(.spring())
                    .onHover { hoverN in
                        isHoverNo = hoverN
                    }
                    
                Spacer()
                    .frame(width: 80)
                Button(action: {
                    PlaygroundPage.current.navigateTo(page: .next)
                }){
                    Image(uiImage: UIImage(named: "yesPick")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 140)
                        .shadow(radius: isHoverYes ? 5 : 0)
                        .animation(.spring())
                        .onHover { hover in
                            isHoverYes = hover
                        }
                }
                
            }
            Spacer()
            
        }.background(Color(#colorLiteral(red: -0.15475499629974365, green: 0.66641765832901, blue: 0.5781239867210388, alpha: 1.0)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}



