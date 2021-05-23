//
// 23. Merge k Sorted Lists.swift
// Created by Raphael Souza on 2021-05-22.

/**
* Definition for singly-linked list. */
public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var node11 = ListNode(90)
var node10 = ListNode(7, node11)
var node9 = ListNode(5, node10)
var node8 = ListNode(3, node9)
var node = ListNode(1, node8)

var node6 = ListNode(12)
var node5 = ListNode(10, node6)
var node4 = ListNode(8, node5)
var node3 = ListNode(6, node4)
var node2 = ListNode(4, node3)
var node1 = ListNode(2, node2)

var node12 = ListNode(100)

class Solution {
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
		guard !lists.isEmpty else { return nil }
		var clists = lists
		var newList: [ListNode?] = []
		
		while clists.count != 1 {
			for i in 0..<clists.count/2 {
				newList.append(merge2(clists[i*2], clists[(i*2)+1]))
			}
			if clists.count%2 != 0 {
				newList.append(clists.last!)
			}
			clists = newList
			newList = []
		}
		
		return clists.first!
	}

	func merge2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		let list = ListNode(0)
		var current: ListNode? = list
		var ll1 = l1
		var ll2 = l2
		
		while ll1 != nil && ll2 != nil {
			if ll1!.val < ll2!.val {
				current?.next = ll1
				ll1 = ll1?.next
			} else {
				current?.next = ll2
				ll2 = ll2?.next
			}
			current = current?.next
		}
		current?.next = ll2 ?? ll1
		return list.next
	}
}

func printList(_ list: ListNode?) {
	var head = list
	var resultStr = ""
	while head != nil {
		resultStr += "\(head!.val) -> "
		head = head?.next
	}
	print(resultStr)
}

let solution = Solution()
let result = solution.mergeKLists([node, node1,node12])
printList(result)