import SwiftUI
import PlaygroundSupport
public struct ContentView: View {
    
    @State var isHoverYes = false
    @State var isHoverNo = false
    @State var texts = ["Are you sure? it's gonna be a great adventure!","Come on, you will like it!"]
    @State var cont = 0
    @State var isVisible = false
    
    public init(){
        let fontURL = Bundle.main.url(forResource: "CHINESER", withExtension: "ttf")
        CTFontManagerRegisterFontURLs([fontURL!] as CFArray, CTFontManagerScope.process, true){ (errors, done) -> Bool in
            if(done) {
                
            }
            print(errors as Array)
            return true
        }
        
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
                Button(action: {
                    switch cont {
                    case 0:
                        withAnimation(.easeInOut(duration:0.5)){
                            isVisible.toggle() 
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                            withAnimation(.easeInOut(duration: 0.5)){
                                isVisible.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                cont += 1
                            }
                        }
                    case 1:
                        withAnimation(.easeInOut(duration:0.5)){
                            isVisible.toggle() 
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                            withAnimation(.easeInOut(duration: 0.5)){
                                isVisible.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                cont = 0
                            }
                            
                        }
                    default:
                        break 
                    }
                    
                    
                }){
                    Image(uiImage: UIImage(named: "noPick")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 140)
                        .shadow(radius: isHoverNo ? 5 : 0)
                        .animation(.spring())
                        .onHover { hoverN in
                            isHoverNo = hoverN
                        }
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
                .frame(height:50)
            Text(texts[cont])
                .font(Font.custom("Chinese Rocks", size: 50))
                .multilineTextAlignment(.center )
                .foregroundColor(.black)
                .animation(.default)
                .opacity(isVisible ? 1 : 0)
            Spacer()
            
        }.background(Color(#colorLiteral(red: 0.9603047966957092, green: 0.7802415490150452, blue: 0.5308190584182739, alpha: 1.0)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}



