//
// 206. Reverse Linked List.swift
// Created by Raphael Souza on 2021-04-19.

import Foundation

//Definition for singly-linked list.
public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
	func reverseList(_ head: ListNode?) -> ListNode? {
		var newHead = head
		var next: ListNode?
		let current: ListNode? = head
		
		while current?.next != nil {
			next = current?.next
			current?.next = next?.next
			next?.next = newHead
			newHead = next
		}
		
		return newHead
	}
}

func printList(_ head: ListNode?) {
	var node = head
	while node != nil {
		print(node!.val)
		node = node!.next
	}
}

let n5 = ListNode(5)
let n4 = ListNode(4, n5)
let n3 = ListNode(3, n4)
let n2 = ListNode(2, n3)
let n1 = ListNode(1, n2)


let solution = Solution()
var node = solution.reverseList(n1)
printList(node)