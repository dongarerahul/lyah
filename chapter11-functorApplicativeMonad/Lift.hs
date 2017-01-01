-- Following example shows why Applicatives are more
-- powerful than ordinary functors
--
-- with functor, you can apply only map functions over one functor
-- with applicative, you can apply function over several functors

-- liftA2 takes ordinary binary function and promotes it to
-- a function which operates over two functors
liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
liftA2 f a b = f <$> a <*> b

-- Let's try implementing a
-- function that takes a list of applicatives and returns an applicative that has a list as its result value.
--
sequenceAA :: (Applicative f) => [f a] -> f [a]
sequenceAA [] = pure []
sequenceAA (x:xs) = (:) <$>  x <*> sequenceAA xs

sequenceA' :: (Applicative f) => [f a] -> f [a]
sequenceA' = foldr (liftA2 (:)) (pure [])

-- Main> sequenceAA [Just 3, Just 1]
-- Just [3,1]
-- sequenceAA [(+3), (+1)] 3
-- [6,4]

-- find out result which satisfy all predicat\s
-- ';P..
filtered = sequenceA' [(>4), (<10), odd] 7

