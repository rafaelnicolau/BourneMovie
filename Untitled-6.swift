protocol viewdelegate{
    func imprimir()
}

class view1: viewdelegate{
    
    
    func imprimir(){
        print("Consegui")
    }
}

class view2 {
    
    var delegate: viewdelegate?
    
    func imprimir(){
        delegate?.imprimir()
    }
}

let xpto = view1()
let xpto2 = view2()
xpto2.delegate = xpto
xpto2.imprimir()
Consegui