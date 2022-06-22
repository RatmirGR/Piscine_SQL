select address,
round ((round (max, 2) - round (min, 2) / max), 2) as formula, average,
case
	when (max - min / max) > average then 'true'
	else 'false'
end comparison
from (
	select p.address,
	max (p.age) as max,
	min (p.age) as min,
	round (round (sum (p.age), 2) / count (p.age), 2) as average
	from person p
	group by p.address
) t1
order by 1