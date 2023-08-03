create proc usp_MakeFamilyPurchase
@FamilySurName varchar(255)
as
begin
	begin try
		declare @res int
		select @res = f.BudgetValue - sum(b.Value)
			from (select ID, BudgetValue
					from Family
					where SurName = @FamilySurName
					group by ID, BudgetValue) f
				join Basket b
				on f.ID = b.ID_FAMILY
				group by f.BudgetValue
		update Family
			set BudgetValue = @res
			where SurName = @FamilySurName
	end try
	begin catch
		declare @message nvarchar(255) = error_message()
			, @severity int = error_severity()
			, @state int = error_state()
		RAISERROR (@message, @severity, @state)
	end catch
end