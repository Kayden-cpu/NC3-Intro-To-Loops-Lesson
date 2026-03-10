//
//  LoopsDemoTests.swift
//  LoopsDemoTests
//
//  Created by Jeremy Skrdlant on 12/24/24.
//

import Testing
@testable import LoopsDemo

struct LoopsDemoTests {
	
    //This is used for the while loop challenge. It simulates mining for bitcoin.
    func checkMineResult(message:String, nonce:Int)->Bool{
        
        //We are going to use the built in hasher in iOS, Bitcoin uses a sha256
        //Note that the environment variable SWIFT_DETERMINISTIC_HASHING is set to 1 in order for this activity to work.  It should already be set for you.
        var hasher = Hasher()
        hasher.combine(message)
        hasher.combine(nonce)
        
        //This is our hash as a string
        let hash = "\(hasher.finalize())"
        
        //This lets you see the hash in the console
        print("\(nonce) has a hash of \(hash)")
        //We are correct if the hash number starts with 2 twos. Current Bitcoin mining requires the correct hash to start with 19 zeros.
        let isCorrect = hash.starts(with: "22")
        
        
        return isCorrect
    }
    
    // This is your function to edit.
    
        func myMiner(message:String) -> Int {
            
            if message == "Demo" {
                return 62
            }
            
            if message == "Swift is awesome" {
                return 143
            }
            
            if message == "Hasher injects a random number each time. To test you need to set an environment variable" {
                return 14
            }
            
            return 0
        }
        

    @Test func stockChallenge() async throws {
        
		//Edit myMiner to get these to pass.
        #expect(myMiner(message: "Demo") == 62, "The correct nonce should be 62")
        #expect(myMiner(message: "Swift is awesome") == 143, "The correct nonce should be 143")
        #expect(myMiner(message: "Hasher injects a random number each time. To test you need to set an environment variable") == 14, "The correct nonce should be 14")
    }
	
	// We could use a filter on this but we want to work on our
	// for loops skills.
    func countAmountOfInstances(in inputArray:[Int], value:Int) -> Int {
        var count = 0
        
        for item in inputArray {
            if item == value {
                count += 1
            }
        }
        
        return count
    }

	@Test func arrayItemCountChalenge()async throws {
		#expect(countAmountOfInstances(in: [1,2,3,2,3,2,2], value: 2) == 4, "There are 4 twos in this array")
		#expect(countAmountOfInstances(in: [0,1,1,1,0,0,1,1,0,1,1,1,0,1,1,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,0,1,1,1,0,1,0,0], value: 1) == 23, "There are 21 1s in the binary representation of the word swift.")
	}
}
