# Coding challenge
Develop a AutoComplete class that takes a dictionary (array of strings) as parameters for consultation while auto completing.

Develop a function search that will take an input  string that will be used to possibly be auto completed and returns a string when there’s only one auto complete option.

Exemple:

History: `["Apple", "Application", "Letter", "Llama", "Ledger"]`

If the user’s type `"Le"` the search function should return `nil` since there are two options for auto completing `["Letter", "Ledger"]`.

If the user’s type `"Ll"` the functions should return `Llama`.

```
class AutoComplete {
	init(history: [String]) {}

	func search(input: String) -> String? {}
}
```

Follow ups:
* What if we added `"Let"` to the history, would your solution still work?
* Could a user add a new word to the history at runtime?
* What if instead of just one, we want to return all possible candidates?