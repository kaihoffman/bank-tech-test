
Bank Tech Test
==============

# Makers Academy Week 10

## Installation

1. Clone this Repository

2. run ```bundle install```

3. run the program itself by invoking ```irb -r ./lib/bank_account.rb``` in the cloned directory.

## Tests

You will be able to run the testing suite by running ```rspec```. The individual test files for classes and the features (including Acceptance Criteria below) are in the ```spec/``` folder.

## Usage

After you have started the program with ```irb -r ./lib/bank_account.rb```, you can:

Set up a new account instance:
```
2.6.0 :001 > account = Account.new
 => #<Account:0x00007fb16f96b888 @balance=0.0, @balance_sheet=#<BalanceSheet:0x00007fb16f96b838 @transactions=[]>>
```

Deposit into an account of your choice:
```
2.6.0 :002 > account.deposit(245.67)
 => [{:date=>"13/03/2019", :credit_amount=>245.67, :debit_amount=>nil, :balance=>245.67}]
```

You can also withdraw, provided there are funds in the account:
```
2.6.0 :003 > account.withdraw(12.12)
 => [{:date=>"13/03/2019", :credit_amount=>245.67, :debit_amount=>nil, :balance=>245.67}, {:date=>"13/03/2019", :credit_amount=>nil, :debit_amount=>12.12, :balance=>233.55}]
```

The #deposit and #withdraw methods will accept a date in the format "DD/MM/YYYY", or use today's date if none is provided:

```
2.6.0 :005 > account2.deposit(500, "12/12/2012")
 => [{:date=>"12/12/2012", :credit_amount=>500, :debit_amount=>nil, :balance=>500.0}
```

 And you can print out the balance sheet for an account at any time:

 ```
2.6.0 :006 > account.balance_sheet.print_balance_sheet
date || credit || debit || balance
13/03/2019 ||  || 12.12 || 233.55
13/03/2019 || 245.67 ||  || 245.67
 ```

## User Stories

```
As an account holder
In order to have money in my account
I want to be able to deposit money.
```

```
As an account holder
In order to later know when money was deposited or withdrawn,
I want to be able store a date for my operation
```

```
As an account holder,
In order to have access to my money
I want to be able to withdraw money.
```

```
As an account holder,
Because money comes in decimals,
I would like to be able to withdraw, deposit and view my balance with 2 decimals
```

```
As an account holder,
In order to not go over my funds
I want to only be able to withdraw what is available in my account
```

```
As an account holder,
So that I know how much money is in my account
I want to be able to request a balance statement
```

```
As an account holder,
So that I can follow my funds over time
I want to be able to see my statements ordered by date
```


The following is from the Makers README:

# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```