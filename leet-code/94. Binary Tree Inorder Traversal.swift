//
// 94. Binary Tree Inorder Traversal.swift
// Created by Raphael Souza on 2021-04-16.

import Foundation


//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
		var ans: [Int] = []
		visit(root, &ans)
		return ans
	}
	
	private func visit(_ node: TreeNode?, _ ans: inout [Int]) {
		guard let node = node else { return }
		visit(node.left, &ans)
		ans.append(node.val)
		visit(node.right, &ans)
	}
}