#destroy tables
Admin.destroy_all
Product.destroy_all
LiquidSelection.destroy_all
Container.destroy_all
Flavour.destroy_all
Liquid.destroy_all

# Admins
FactoryBot.create(:admin, email: 'admin@example.com', password: 'password')

# Liquids
kombucha = Liquid.create!(name: "Kombucha")
water = Liquid.create!(name: "Sparkling Water")

# Flavours
bellini = kombucha.flavours.create!(
  name: "Bellini", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
  )
turmeric = kombucha.flavours.create!(
  name: "Turmeric Tonic", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
  )
lady = kombucha.flavours.create!(
  name: "Lady Grey", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
hibiscus = kombucha.flavours.create!(
  name: "Hibiscus Ginger", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
beauty = kombucha.flavours.create!(
  name: "Beauty", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
revitalize = kombucha.flavours.create!(
  name: "Revitalize", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
cran = kombucha.flavours.create!(
  name: "Cran-baby", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
grapefruit = kombucha.flavours.create!(
  name: "Pink Grapefruit", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
blue = kombucha.flavours.create!(
  name: "Blue Valentine", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
fuji = kombucha.flavours.create!(
  name: "Fuji Apple", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
mojito = kombucha.flavours.create!(
  name: "Mojito", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
hawaiian = kombucha.flavours.create!(
  name: "Hawaiian", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
mojito = kombucha.flavours.create!(
  name: "Mojito", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
original = water.flavours.create!(
  name: "Original",
  description: "Our original sparkling water crisp flavour!"
)

# Containers
keg = Container.create!(name: "Keg", volume: 19500)
bottles = Container.create!(name: "12 375mL Bottles", volume: 12 * 375)
growler1 = Container.create!(name: "1L Growler", volume: 1000)
growler2 = Container.create!(name: "2L Growler", volume: 2000)
growler5 = Container.create!(name: "500mL Growler", volume: 500)



# Products

selection = LiquidSelection.create!(flavour: original, container: keg)
Product.create!(name: "Keg of Sparkling Water", selectable: selection, rentable: false, purchasable: true, price: Money.new(3500))

selection = LiquidSelection.create!(flavour: bellini, container: keg)
Product.create!(name: "Keg of Bellini Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: turmeric, container: keg)
Product.create!(name: "Keg of Turmeric Tonic Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: lady, container: keg)
Product.create!(name: "Keg of Lady Grey Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: bellini, container: bottles)
Product.create!(name: "12 Pack of Bellini bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))

selection = LiquidSelection.create!(flavour: hawaiian, container: bottles)
Product.create!(name: "12 Pack of Hawaiian bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))

selection = LiquidSelection.create!(flavour: hawaiian, container: bottles)
Product.create!(name: "12 Pack of Hawaiian bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))

selection = LiquidSelection.create!(flavour: turmeric, container: bottles)
Product.create!(name: "12 Pack of Turmeric Tonic bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))

selection = LiquidSelection.create!(flavour: lady, container: bottles)
Product.create!(name: "12 Pack of Lady Grey bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))

selection = LiquidSelection.create!(flavour: hibiscus, container: bottles)
Product.create!(name: "12 Pack of Hibiscus Ginger bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325))




