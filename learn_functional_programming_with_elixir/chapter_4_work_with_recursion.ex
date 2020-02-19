# 1 => Write two recursive functions: one that finds the biggest element of a list
# and another that finds the smallest. You should use them like this:

# MyList.max([4, 2, 16, 9, 10])
# => 16
# MyList.min([4, 2, 16, 9, 10])
# => 2

# 2 => In the section Transforming Lists, on page 62, we traveled to a fantasy
# world and enchanted some items. Create a new module called GeneralStore
# where you can create a function that filters based on whether the products
# are magical. You can use the same test data from EnchanterShop :

# GeneralStore.filter_items(GeneralStore.test_data, magic: true)
# => [%{title: "Healing Potion", price: 60, magic: true},
# %{title: "Dragon's Spear", price: 100, magic: true}]

# GeneralStore.filter_items(GeneralStore.test_data, magic: false)
# => [%{title: "Longsword", price: 50, magic: false},
# %{title: "Rope", price: 10, magic: false}]

# 3 => We’ve created a function that sorts the items of a list in ascending order.
# Now create a Sort.descending/1 function that sorts the elements in descending
# order.

# 4 => We’ve written a lot of recursive functions, but not all of them are tail
# recursive. Write the tail-recursive versions of Sum.up_to/1 and Math.sum/1 .
# Extra challenge: write the tail-recursive version of Sort.merge/2 .

# 5 => In the section Adding Boundaries, on page 75, we added a depth restriction
# to limit how many directories deep our module should dive. Now create
# a BreadthNavigator module that has a breadth constraint; it will be the
# maximum number of sibling directories it can navigate.
