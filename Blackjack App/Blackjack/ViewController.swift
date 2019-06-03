//
//  ViewController.swift
//  Blackjack
//
//  Created by Aditya Tadimeti on 5/27/19.
//  Copyright © 2019 Aditya Tadimeti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var message2: UILabel!
    @IBOutlet weak var computerWins: UILabel!
    @IBOutlet weak var userWins: UILabel!
    
    var computer : Int = 0
    var user : Int = 0
    
    var numberOfCards : Int = 2
    var score : Int = 0
    var computerScore : Int = 0
    var gameOver : Bool = true
    
    var randomFirstCard : Int = 0
    var randomSecondCard : Int = 0
    var randomThirdCard : Int = 0
    var randomFourthCard : Int = 0
    var randomFifthCard : Int = 0
    
    let cardArray = ["2","3","4","5","6","7","8","9","10","jack","queen","king","Ace"]
    
    @IBOutlet weak var thirdCard: UIImageView!
    @IBOutlet weak var fourthCard: UIImageView!
    @IBOutlet weak var fifthCard: UIImageView!
   
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        
    
    
 
    @IBAction func goButton(_ sender: UIButton) {
        if(gameOver==true){
            message.text = "Press Hit or Stand."
            
            numberOfCards = 2
            score = 0
            
            randomFirstCard = Int(arc4random_uniform(13))
            firstCard.image = UIImage(named: cardArray[randomFirstCard])
            if(randomFirstCard<9){
                score = score+randomFirstCard+2
            }
            else if randomFirstCard<12{
                score=score+10
            }
            else if score+11<21{
                score+=11
            }
            else{
                score+=1
            }
            
            randomSecondCard = Int(arc4random_uniform(13))
            secondCard.image = UIImage(named: cardArray[randomSecondCard])
            if(randomSecondCard<9){
                score = score+randomSecondCard+2
            }
            else if randomSecondCard<12{
                score=score+10
            }
            else if score+11<21{
                score+=11
            }
            else{
                score+=1
            }
            
            scoreValue.text = "Score: " + String(score)
            
            thirdCard.image = UIImage(named: "icons8-joker-50")
            fourthCard.image = UIImage(named: "icons8-joker-50")
            fifthCard.image = UIImage(named: "icons8-joker-50")
        }
        gameOver=false
        }
        
   
    @IBAction func hitButton(_ sender: UIButton) {
        
        if(gameOver == false){
            
             if numberOfCards==2 {
                randomThirdCard = Int(arc4random_uniform(13))
                thirdCard.image = UIImage(named: cardArray[randomThirdCard])
                numberOfCards=numberOfCards+1
                if(randomThirdCard<9){
                    score = score+randomThirdCard+2
                }
                else if randomThirdCard<12{
                    score=score+10
                }
                else if score+11<21{
                    score+=11
                }
                else{
                    score+=1
                }
                }
            else if numberOfCards==3 {
                randomFourthCard = Int(arc4random_uniform(13))
                fourthCard.image = UIImage(named: cardArray[randomFourthCard])
                numberOfCards=numberOfCards+1
                if(randomFourthCard<9){
                    score = score+randomFourthCard+2
                }
                else if randomFourthCard<12{
                    score=score+10
                }
                else if score+11<21{
                    score+=11
                }
                else{
                    score+=1
                }
            }
            else if numberOfCards==4 {
                randomFifthCard = Int(arc4random_uniform(13))
                fifthCard.image = UIImage(named: cardArray[randomFifthCard])
                numberOfCards=numberOfCards+1
                if(randomFifthCard<9){
                    score = score+randomFifthCard+2
                }
                else if randomFifthCard<12{
                    score=score+10
                }
                else if score+11<21{
                    score+=11
                }
                else{
                    score+=1
                }
                gameOver = true
                
            }
            
            scoreValue.text = "Score: " + String(score)
            if(score>21){
                message.text = "You lose!"
                message2.text="Press Go to play again."
                computer+=1
                computerWins.text = "Computer # of wins: " + String(computer)
                gameOver = true
            }
            if(score==21){
                message.text = "You win!"
                message2.text="Press 'Go' to play again."
                user+=1
                userWins.text = "User # of wins: " + String(user)
                gameOver = true
            }
        }
    }
    
   
    @IBAction func standButton(_ sender: UIButton) {
        if(gameOver == false || numberOfCards==5){
            computerScore = Int(arc4random_uniform(5)+17)
            scoreValue.text = "Score: " + String(score)
            
            if(computerScore > score){
                message.text = "You lost!"
                message2.text="Computer's score was " + String(computerScore)
                computer+=1
                computerWins.text = "Computer # of wins: " + String(computer)
            }
            else if(score>computerScore){
               message.text = "You won!"
               message2.text="Computer's score was " + String(computerScore)
                user+=1
                userWins.text = "User # of wins: " + String(user)
                gameOver = true
            }
            else{
                message.text = "You tied with the computer."
            }
            gameOver = true
        }
        
    }
}

