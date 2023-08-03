create function udf_GetSKUPrice
(
	@ID_SKU int
)
returns decimal(18, 2)
as
begin
	declare @PRICE decimal(18, 2)
	select @PRICE = b.Value / b.Quantity
		from dbo.Basket b
		where b.ID_SKU = @ID_SKU
	return @PRICE
end