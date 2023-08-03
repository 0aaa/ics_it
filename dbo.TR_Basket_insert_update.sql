create trigger TR_Basket_insert_update on dbo.Basket after insert, update
as
begin
	set nocount on
	update Basket 
		set DiscountValue = .05 * Basket.Value
		where ID_SKU
		in (select ID_SKU, count(*)
				from inserted
				group by ID_SKU
				having count(*) > 1)
end