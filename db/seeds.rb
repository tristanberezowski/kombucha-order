#destroy tables
InviteExemption.destroy_all
Invite.destroy_all
RealmId.destroy_all
RefreshToken.destroy_all
Admin.destroy_all
CartProduct.destroy_all
Product.destroy_all
LiquidSelection.destroy_all
Container.destroy_all
Flavour.destroy_all
Liquid.destroy_all

#Realm Id
FactoryBot.create(:realm_id, name: '4620816365019076980')

#Refresh Token & Access Token
FactoryBot.create(:refresh_token, name: 'AB11589139983l2dj7dHkxdrdaxpuV7WYDcT8CC1CKPdMXTvmG')
FactoryBot.create(:access_token, name: 'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..kBP5DZP-uuf1DB10RzQ2HA.DAbdV6Yvw_Y-8IwXU_3Gih_vQrfRr2oSyWYdfEQSZCz2OjYSZ5rsQZUBAH2Sac0-vpwPaPHp1XpjScMiOM12B50r7JiWpWV8g7-i6wpHtaRB0CicM5rwFlEjGxj0pFfQQfE4C5dCwdU4ea1XQJxHe81Oy4HefQnCo9WIMNFjcgYa6AXk71ddhcCl67m5mYqdtEHFD2bM7pE9RZ_mgKECEfOBoY_CGCzOYc9ZfkjKhqyKdVhRqPQOg5NgzKwor8MF5DjsKS5z1fiDBrzNeCqUwK4Xuo48exnWuZEHBNsqCpGymHekG5VAEqWBN9P5Tk5HzAU7ZSpwGW1WvXFglTO1NIA3szmjRJjhLpUlXfO1u7XWeUdAzrV0FeQ09masUOROk5D-F9s99xAYblU2X6f6OUF65NYpmaA7xor2bCNWn3gu0laNajRFfA4lxEIxTugvFJ1TPPOsM9f8_Mypc9CReKjmBM6fym8bay2QttIcZEB6V9Bl6kiW4OHsEDH_iLtkbI1rgnls45vw_xxGuLxxFRy7c1MCt0OnW9p014bDSn5ZFcq4ceeG_F-EKZA0pC5_itnnT3PJgIDuwgoiaruvhonPohhenKagR1xrBBHj8MD-V341v_SNeu6W5ceqGRfTSdGcjNRlkqwMwla6jO01GrhvFqQFgEpAeBLT3i9g8u8FZSZWzI5Us3E6UIuPxsxNy5oCTkj-NAw3Rt5xxtg1Gsojmmwb06pGNcxbMDrI8RzJEXyy_ep3tQOsQK38HEtNMDs3iVauwOPY7FXFq5vGxBiA8eOAGLbDSGFBxEMt9mz0XCJCcr2Zh-Ilaxk-INE3bUqDAyotH2_toMIsVZ8iJGxWvd0bkUhcp8RolFMcLx8l4efR8sCs-Sc98VPwY9xYchM0eRS6czGCTJM6UXGRIg.fqFBA12F-1aavklUwIBc4Q')

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



# Products

# Kegs
selection = LiquidSelection.create!(flavour: original, container: keg)
Product.create!(name: "Keg of Sparkling Water", selectable: selection, rentable: false, purchasable: true, price: Money.new(3500))

selection = LiquidSelection.create!(flavour: bellini, container: keg)
Product.create!(name: "Keg of Bellini Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: turmeric, container: keg)
Product.create!(name: "Keg of Turmeric Tonic Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: lady, container: keg)
Product.create!(name: "Keg of Lady Grey Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: hibiscus, container: keg)
Product.create!(name: "Keg of Hibiscus Ginger Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: beauty, container: keg)
Product.create!(name: "Keg of Beauty Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: revitalize, container: keg)
Product.create!(name: "Keg of Revitalize Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: cran, container: keg)
Product.create!(name: "Keg of Cran-Baby Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: grapefruit, container: keg)
Product.create!(name: "Keg of Pink Grapefruit Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: blue, container: keg)
Product.create!(name: "Keg of Blue Valentine Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

selection = LiquidSelection.create!(flavour: fuji, container: keg)
Product.create!(name: "Keg of Fuji Apple Kombucha", selectable: selection, rentable: false, purchasable: true, price: Money.new(11000))

# Bottles

selection = LiquidSelection.create!(flavour: mojito, container: bottles)
Product.create!(name: "12 Pack of Mojito bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: hawaiian, container: bottles)
Product.create!(name: "12 Pack of Hawaiian bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: turmeric, container: bottles)
Product.create!(name: "12 Pack of Turmeric Tonic bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: lady, container: bottles)
Product.create!(name: "12 Pack of Lady Grey bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: hibiscus, container: bottles)
Product.create!(name: "12 Pack of Hibiscus Ginger bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: beauty, container: bottles)
Product.create!(name: "12 Pack of Beauty bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: grapefruit, container: bottles)
Product.create!(name: "12 Pack of Pink Grapefruit bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: revitalize, container: bottles)
Product.create!(name: "12 Pack of Revitalize bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: raspberry, container: bottles)
Product.create!(name: "12 Pack of Raspberry Lime bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))

selection = LiquidSelection.create!(flavour: blue, container: bottles)
Product.create!(name: "12 Pack of Blue Valentine bottles", selectable: selection, rentable: false, purchasable: true, price: Money.new(325 * 12))