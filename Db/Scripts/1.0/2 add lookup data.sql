insert [dbo].[CattleStatus]
(
	StatusCode
	,StatusName
)
values
	(1, 'Received')
	,(2, 'Processed')
	,(3, 'Shipped')
;

insert [dbo].[ProductType]
(
	ProductTypeCode
	,ProductTypeName
)
values
	(1, 'Chuck')
	,(2, 'Rib')
	,(3, 'Brisket')
	,(4, 'Plate')
	,(5, 'Short Loin')
	,(6, 'Flank')
	,(7, 'Sirloin')
	,(8, 'Tenderloin')
	,(9, 'Top Sirloin')
	,(10, 'Bottom Sirloin')
	,(11, 'Round')
	,(12, 'Shank')
	,(13, 'Head')
