//
//  main.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/09.
//

import Foundation

//print(power(base: 2, exponent: 3))
//print(isPalindrome("madam"))
//print(printBinary(num: -10))
//print(reverseLines(0))
//print(evaluate("(1+1) * (2+2)"))
//print(evaluate("7"))
//print(evaluate("(2+2)"))
//print(evaluate("(1+(2*4))"))
//print(evaluate("((1+3)+((1+2)*5))"))
//printDecimal(2)
//permutation("par")
//printBinaryExhaustiveHelper(2)
//combinations("AB", n: 1)
//rollDice(2)
//rollDiceSum(n: 2, desiredSum: 5)

//rollDiceSumUnique(n: 3, desiredSum: 5)
//print("*************************")
//rollDiceSum(n: 3, desiredSum: 5)

//crawl()

//print(countVowelStrings(2))

var arr = [1, 8, 3, 9, 4, 5, 7]
//var arr = [1]
//print(quickSort(&arr, <))

//var board = Board(size: 8)
//solveQueens(board: &board)


//let bag = Bag<Int>()
//
//bag.add(item: 10)
//bag.add(item: 1)
//bag.add(item: 10)
//bag.add(item: 10)
//bag.add(item: 5)
//bag.add(item: 6)
//
//for item in bag {
//  print(item)
//}
//
//print(bag)

//let stack = Stack<Int>()
//print(stack.pop())
//
//stack.push(item: 1)
//stack.push(item: 3)
//stack.push(item: 5)
//stack.push(item: 2)
//
//print(stack)
//for item in stack {
//  print(item)
//}
//print(stack.pop())
//print(stack.pop())
//print(stack)

//let queue = Queue<Int>()
//queue.enqueue(item: 1)
//queue.enqueue(item: 2)
//queue.enqueue(item: 3)
//queue.enqueue(item: 4)
//queue.enqueue(item: 5)
//
//print(queue.dequeue())
//print(queue.peek())
//print(queue.dequeue())
//queue.enqueue(item: 1)
//print(queue)
//for item in queue {
//  print(item)
//}

//let tree = TreeNode<Int>(data: 5)
//tree.left = TreeNode<Int>(data: 3)
//tree.left!.left = TreeNode<Int>(data: 1)
//tree.left!.right = TreeNode<Int>(data: 4)
//
//tree.right = TreeNode<Int>(data: 7)
//tree.right!.left = TreeNode<Int>(data: 6)
//tree.right!.right = TreeNode<Int>(data: 10)
//
//preOrder(tree)
//print()
//
//inOrder(tree)
//print()
//
//postOrder(tree)
//print()


//findElements(comparator: <)
//treetraversal()


//let arr2 = [1, 3, 5, 6, 8, 10, 20]
//print(binarySearch(arr: arr2, left: 0, right: arr.count - 1, target: 19, comparator: <))

//findElements(comparator: <)

//print(findWord("NEEDLE", "NEANEEDLE"))      // 2
//print(findWord("EABC", "EEEABC"))           // 2
//print(findWord("EEABC", "EEAEEEABC"))       // 4
//print(findWord("EEEABC", "EEAEEEABC"))      // 3
//print(findWord("EEABC", "EEEEABC"))         // 2

//print(findWord("WORD", "WWWWWWWWWWWORD"))   //10


//print(findWord("simply dummy text", "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."))  // 14

//print(findWord("NEEDLE", "INAHAYSTACKNEEDLEINA"))  // 11
//print(findWord("NEEDLE", "INAHAYSTACKNEEDLLINA"))  // -1

//findParent()
//diameter()

//test1()
//whosMyParent()
//print(lowestCommonAncestor()?.val)

//print(findWord("AAABAB", "AAABAAABAB"))
//print(findWord("AAABAB", "AAABAAAABAB"))

//findLca()
//diameter()
//cyclicPermutation()
//repeatingSequence()

//diameterAnswer()
//sushiRestaurantReviews()
//adjacencyListBFS()
//print("*******************")
//adjacencyListDFS()
//diameterAnswer()
/*
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000
*/
//town()

//tomatoFarm()
//bridges()
//for i in 1..<26 {
//  let fileName = "sushi." + "\(i)" + ".in"
//  sushiRestaurantReviewsTest(testMode: true, fileNameForInput: fileName)
//}
//sushiRestaurantReviewsTest()
//for i in 1..<26 {
//  let fileName = "sushi." + "\(i)" + ".in"
//  let filePathForInput = "/Users/DKS/projects/Cornerstone/4_Swift/401/AlgorithmsDataStructures/AlgorithmsDataStructures/Assignments/testcase/sushiReview/" + fileName
//  sushi(filePathForInput: filePathForInput)
//  sushiRestaurantReviewsTest(testMode: true, fileNameForInput: fileName)
//}
//sushi()



//let nForTriangle = 5
//let aForTriangle = [2, 3, 4, 5, 10]
////canMakeTriangle(n: nForTriangle, a: aForTriangle)
//
//let LForAnt = 10
//let nForAnt = 3
//let xForAnt = [2, 6, 7]
//ant(L: LForAnt, n: nForAnt, x: xForAnt)

//lakeCounting()

//print(canFinish(2, [[1,0]]))
//print(canFinish(2, [[1,0], [0, 1]]))
//print(findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]))
//print(findOrder(2, [[0, 1]]))
//print(findOrder(2, [[1,0], [0, 1]]))

//lcaLinear()


//var uf = UF(4)
//uf.union(1, 2)
//uf.union(1, 3)
//uf.union(2, 3)

//print(findCircleNum([[1,1,0],[1,1,0],[0,0,1]]))
//print(findRedundantConnection([[1,2],[2,3],[1,5],[3,4],[1,4]]))
//print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
//print(findCenter([[1,2],[2,3],[4,2]]))
//allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])
//print(allPathsSourceTarget([[2],[2],[]]))
//print(allPathsSourceTarget([[4,3,1],[3,2,4],[],[4],[]]))

//print(findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]]))

//print(twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]))

print(leastInterval(["A","A","A","B","B","B"], 2))
print(leastInterval(["A","A","A","B","B","B"], 2))
print(leastInterval(["A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D","E","F"], 4))
print(leastInterval(["A","A","A","B","B","B", "C","C","C", "D", "D", "E"], 2))
print(leastInterval(["A","B","A","B"], 2))
print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))
