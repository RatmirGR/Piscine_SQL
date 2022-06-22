select round (sum (rating) / count (rating), 4) as global_rating
from pizzeria pz