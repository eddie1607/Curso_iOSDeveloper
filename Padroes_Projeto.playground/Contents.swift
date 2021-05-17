import UIKit
///

print("ola")

protocol DoorCommand{
    func execute() ->String
}

// classes resposnsveis pela execucao
class OpenCommand: DoorCommand{
    let doors:String
    required init(doors:String){
        self.doors = doors
    }
    func execute() -> String {
        return "opened \(doors)"
    }
    
}
// classe resposavel pela  execucao
class CloseCommand: DoorCommand{
    let doors: String
    required init(doors: String){
        self.doors = doors
    }
    
    func execute() -> String {
        return "closed \(doors)"
    }
}
 /// outra classe so chama  as que irao executar a execucao
class DoorsOperations{
    let  openCommand:DoorCommand
    let  closeCommand:DoorCommand
    init(doors:String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    func close() -> String{
        return closeCommand.execute()
    }
    func open()  -> String{
        openCommand.execute()
    }
}
let fechar = ""
let  d = DoorsOperations(doors: fechar)
print(d.closeCommand.execute())
print(d.openCommand.execute())
