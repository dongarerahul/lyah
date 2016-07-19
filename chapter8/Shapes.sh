module Shapes
(Point(..)
, Shape(..)
, surface
)
where

data Shape = Circle Point Float | Rectange Point Point deriving (Show)
data Point = Point Float Float deriving (Show)


-- surface $ Circle 10 20 10
-- surface $ Rectangle 0 0 100 100

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectange (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)


