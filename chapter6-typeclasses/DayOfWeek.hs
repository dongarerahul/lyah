data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun

data Date = Date DayOfWeek Int

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekDay dayOfMonth) (Date weekDay' dayOfMonth') = weekDay == weekDay' && dayOfMonth == dayOfMonth'

-- Prelude> Date Thu 10 == Date Thu 10
-- True
-- Prelude> Date Thu 10 == Date Thu 11
-- False
-- Prelude> Date Thu 10 == Date Weds 10
-- False
