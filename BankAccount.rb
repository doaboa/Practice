class BankAccount
	attr_accessor :amount_available
	
	@@all_accounts = []
	@@total_money_in_accounts
	@@total_loans_out
	@@total_cash_on_hand = @@total_money_in_accounts - @@total_loans_out
	
	def initialize(starting_amount = 0)
		@amount_available = starting_amount
		@@total_money_in_accounts += starting_amount
		@loan_amount = 0
		@@all_accounts << self
		puts "Your account number is #{@@all_accounts.index(self)}."
	end

	def deposit_money(deposit)
		@@total_money_in_accounts += deposit
		@amount_available += deposit
		
	end

	def withdraw_money(withdrawl)
		@@total_money_in_accounts -= withdrawl
		@amount_available -= withdrawl
	end

	def get_balance
		puts "You've got $#{@amount_available} in your bank account."
		@amount_available
	end

	def take_loan(amount)
		@@total_loans_out += amount
		@loan_amount = amount

	end

	def repay_loan(amount)
		@@total_loans_out -= amount
		@loan_plus_interest -= amount
			
	end

	def accrue_interest
		 @accrued_interest = @loan_amount * .06
		 @loan_plus_interest = @accrued_interest + @loan_amount

	end

	def get_outstanding_loan
		puts "The amount you owe is $#{@loan_plus_interest}."
		@loan_plus_interest
	end
		
	def self.transfer_money(account1, account2, amount)
		@account1 =@@all_accounts[account1]
		@account2 =@@all_accounts[account2]

		@account1.withdraw_money(amount)
		@account2.deposit_money(amount)

		puts "$#{amount} was successfully transferred from account #{account1} to account #{account2}."
	end

	def self.bankbalance 
		puts "The bank's total cash on hand is $#{@@total_cash_on_hand}.  Total money the bank has is $#{@@total_money_in_accounts} and the total of loans out is $#{@@total_loans_out}"

	end


end

