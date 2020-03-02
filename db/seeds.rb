#destroy tables
LiquidPrice.destroy_all
InviteExemption.destroy_all
Invite.destroy_all
RealmId.destroy_all
RefreshToken.destroy_all
Admin.destroy_all
CartProduct.destroy_all
Cart.destroy_all
OrderProduct.destroy_all
Order.destroy_all
UserExemption.destroy_all
User.destroy_all
CartProduct.destroy_all
Product.destroy_all
LiquidSelection.destroy_all
Container.destroy_all
Flavour.destroy_all
Liquid.destroy_all

#Realm Id
FactoryBot.create(:realm_id, name: '4620816365019076980')

#Refresh Token & Access Token
FactoryBot.create(:refresh_token, name: 'a')
FactoryBot.create(:access_token, name: 'a')

# Admins
FactoryBot.create(:admin, email: 'admin@example.com', password: 'password')

#Users
user1 = FactoryBot.create(:user, name: 'User One', email: 'user1@example.com', password: 'password')
user2 = FactoryBot.create(:user, name: 'User Two', email: 'user2@example.com', password: 'password')

#User Exemptions
delivery1 = DeliveryExemption.create!(fee: 20)
UserExemption.create!(user: user1, exemptable: delivery1)
delivery2 = DeliveryExemption.create!(fee: 30)
UserExemption.create!(user: user2, exemptable: delivery2)

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
raspberry = kombucha.flavours.create!(
  name: "Raspberry Lime", 
  description: "Aside from its unbelievably bright bold colour, the balance of peach & apricot and subtle citrus finish really shine!"
)
original = water.flavours.create!(
  name: "Original",
  description: "Our original sparkling water crisp flavour!"
)

# Containers
keg = Container.create!(name: "Keg", volume: 19500)
bottles = Container.create!(name: "Twelve 375mL Bottles", volume: 12 * 375, environmental_fee: Money.new(11 * 12))

# Liquid Prices
LiquidPrice.create!(container: keg, liquid: water, price: Money.new(3500))
LiquidPrice.create!(container: bottles, liquid: kombucha, price: Money.new(325 * 12))
LiquidPrice.create!(container: keg, liquid: kombucha, price: Money.new(11000))


# Products

# Kegs
selection = LiquidSelection.create!(flavour: original, container: keg)
Product.create!(name: "Keg of Sparkling Water", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: bellini, container: keg)
Product.create!(name: "Keg of Bellini Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: turmeric, container: keg)
Product.create!(name: "Keg of Turmeric Tonic Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: lady, container: keg)
Product.create!(name: "Keg of Lady Grey Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: hibiscus, container: keg)
Product.create!(name: "Keg of Hibiscus Ginger Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: beauty, container: keg)
Product.create!(name: "Keg of Beauty Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: revitalize, container: keg)
Product.create!(name: "Keg of Revitalize Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: cran, container: keg)
Product.create!(name: "Keg of Cran-Baby Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: grapefruit, container: keg)
Product.create!(name: "Keg of Pink Grapefruit Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: blue, container: keg)
Product.create!(name: "Keg of Blue Valentine Kombucha", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: fuji, container: keg)
Product.create!(name: "Keg of Fuji Apple Kombucha", selectable: selection, rentable: false, purchasable: true)

# Bottles

selection = LiquidSelection.create!(flavour: mojito, container: bottles)
Product.create!(name: "12 Pack of Mojito bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: hawaiian, container: bottles)
Product.create!(name: "12 Pack of Hawaiian bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: turmeric, container: bottles)
Product.create!(name: "12 Pack of Turmeric Tonic bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: lady, container: bottles)
Product.create!(name: "12 Pack of Lady Grey bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: hibiscus, container: bottles)
Product.create!(name: "12 Pack of Hibiscus Ginger bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: beauty, container: bottles)
Product.create!(name: "12 Pack of Beauty bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: grapefruit, container: bottles)
Product.create!(name: "12 Pack of Pink Grapefruit bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: revitalize, container: bottles)
Product.create!(name: "12 Pack of Revitalize bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: raspberry, container: bottles)
Product.create!(name: "12 Pack of Raspberry Lime bottles", selectable: selection, rentable: false, purchasable: true)

selection = LiquidSelection.create!(flavour: blue, container: bottles)
Product.create!(name: "12 Pack of Blue Valentine bottles", selectable: selection, rentable: false, purchasable: true)