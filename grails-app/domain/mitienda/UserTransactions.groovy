package mitienda

class UserTransactions {

    String  username
    String  transactionDesc
    Date    transactionDate

    static constraints = {
        username blank: false, nullable: false
        transactionDesc blank: false, nullable: false
        transactionDate nullable: false
    }
}
