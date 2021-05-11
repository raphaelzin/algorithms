//
// 19. Remove Nth Node From End of List.swift
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

let n5 = ListNode(5)
let n4 = ListNode(4, n5)
let n3 = ListNode(3, n4)
let n2 = ListNode(2, n3)
let n1 = ListNode(1, n2)

let n2x = ListNode(2)
let n1x = ListNode(1, n2x)



class Solution {
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
		if head?.next == nil { return nil }
		
		var size = 0
		var node = head
		while node != nil {
			node = node!.next
			size += 1
		}
		
		let index = size - n
		if index == 0 { return head?.next }
		
		var i = 0
		node = head
		while i < index-1 {
			node = node?.next
			i += 1
		}
		
		node?.next = node?.next?.next
		
		return head
	}
}

func printList(_ head: ListNode?) {
	var node = head
	while node != nil {
		print(node!.val)
		node = node!.next
	}
}

let solution = Solution()
let node = solution.removeNthFromEnd(n1x, 2)
printList(node)