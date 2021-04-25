//
// 696. Count Binary Substrings.swift
// Created by Raphael Souza on 2021-04-23.

// Definition for a binary tree node.
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let newRight = root.left
        root.left = root.right
        root.right = newRight
        _ = invertTree(root.left)
        _ = invertTree(root.right)
        return root
    }
}