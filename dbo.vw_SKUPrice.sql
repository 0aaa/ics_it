create view vw_SKUPrice
as
select *, dbo.udf_GetSKUPrice(s.ID) as Price
	from dbo.SKU s