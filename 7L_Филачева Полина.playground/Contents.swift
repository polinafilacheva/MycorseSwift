import Foundation


enum CreditCardOperationError: Error {
    
    case insufficientFunds (money: Double)
    case frozBalance
}

struct thing {
    var price: Double
}


class CreditCardOperation {
    let limit: Double = -15000
    var balance: Double = 0
    var cardIsBlocked = false
    

    func buySomethig(thing: thing)throws {
        guard cardIsBlocked == false else{
            throw CreditCardOperationError.frozBalance
        }
        
        guard thing.price <= (-limit + self.balance) else {
       
            if balance < 0 {
                throw CreditCardOperationError.insufficientFunds(money: thing.price + limit + balance)
            } else {
                throw CreditCardOperationError.insufficientFunds(money: thing.price + limit - balance)
            }
        }
   
        balance = self.balance - thing.price
    }
    
    func depositeMoney (someMoney: Double) {
        balance = self.balance + someMoney
    }
    

    func printBalance() {
        print ("Ваш баланс \(balance) рублей")
    }
    
    func changeCardState(cardIsBlocked: Bool) {
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }
}
