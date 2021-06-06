//
// Untitled.txt
// Created by Raphael Souza on 2021-05-24.

struct Person {
	var name: String
	var descendents: [Person]
	
	init(_ name: String, _ descendents: [Person] = []) {
		self.name = name
		self.descendents = descendents
	}
	
	func hierarchy() {
		var stack: [(person: Person, lvl: Int)] = []
		stack.append((self, 0))
		
		while !stack.isEmpty {
			let top = stack.removeLast()
			let tabs = String(repeating: " |", count: top.lvl)
			print("\(tabs) \(top.person.name)")
			
			for descendent in top.person.descendents {
				stack.append((descendent, top.lvl+1))
			}
		}
		
	}
}



//				a
//		f				e
//	c		d		g		b
var b = Person("b")
var c = Person("c")
var d = Person("d")
var g = Person("g")

var e = Person("e", [g, b])
var f = Person("f", [c, d])
var a = Person("a", [f, e])

a.hierarchy()