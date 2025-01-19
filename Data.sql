use ismgroup58;

insert into user
values ('TechForge Industries', 'info@techforge.com', '293847561', 'techforge', 'vbn920jd', '2020-01-15', 'images/users/TechForge.png', '6922334455', 'Veroia', '8 Papadopoulou St.', 19840), 
 ('PackNest Solutions', 'info@packnest.com', '384756109', 'packNest', 'g5wyhDEWRV', '2018-09-11', 'images/users/packnest.png', '6933445566', 'Athens', '16 Karachaliou St.', 11232),
 ('IronHand Supplies', 'info@ironhandsupplies.com', '465738290', 'ironhand', 'iytfnD90', '2017-09-25', 'images/users/ironhand.png', '6911009922', 'Athens', '28 Iatrou St.', 33344),
 ('Sparkk Clean', 'info@sparkkclean.com', '102938475', 'sparkkClean', '73cn9fj', '2020-02-03', 'images/users/sparkkClean.png', '6911223344', 'Thessaloniki', '105 Grigoriou St.', 73909),
 ('Corporatellge', 'info@corporatellge.com,', '564738290', 'corporatellge', 'tgb2fin0RF', '2019-09-15', 'images/users/Corporattelge.png', '6909988778', 'Trikala', '13 Kidoniou St.', 99123),
 ('Form & Function', 'info@formfunction.com', '890123456', 'form&function', 'rtsvhsvj', '2018-03-17', 'images/users/furniture-comp2.png', '6989012345', 'Patra', '16 Katerinis St.', 89012),
 ('Furniture', 'info@furniture.com', '901234567', 'furniture', 'u43bi7rwkw', '2017-01-05', 'images/users/furniture-comp.png', '6990123456', 'Larisa', '8 Rhodes St.', 90123),
 ('Write Way', 'info@writeway.com', '987654321', 'writeWay', 'i82nf0', '2023-02-10', 'images/users/writeWay.png', '6901234245', 'Athens', '32 Kiriaki St.', 42312),
 ('Paper Charm', 'info@papercharm.com', '012345678', 'paperCharm', '2222', '2022-11-02', 'images/users/stationary-comp.png', '6909876543', 'Athens', '72 Kifisias Av.', 56789), -- in login page 
 ('Mansions Resort and Spa', 'info@mansionsresortnspa.com', '678901234', 'mansionsRnS', 'YSYb380gnynw_geh5gu', '2020-02-24', 'images/users/mansions.png', '6967890123', 'Athens', '25 Trapezis St.', 67890),
 ('Isabel Claudia', 'info@isabelclaudia.com', '789012345', 'isabel_claudia', 'yufigeeoAHQU234', '2018-12-03', 'images/users/company-logo2.png', '6978901234', 'Volos', '40 Agiou Dimitriou St.', 78901),
 ('Luxe Loom', 'info@luxloom.com', '123456789', 'luxeloom', '1111', '2022-01-15', 'images/users/LuxeLoom.png', '6912345678', 'Athens', '123 Dromos St.', 12345), -- in login page
 ('Horizon Inn', 'info@horizoninn.com', '234567890', 'horizonInn', 'ogtvski56', '2022-07-12', 'images/users/hotel-logo1.png', '6923456789', 'Thessaloniki', '42 Elm St.', 23456),  
 ('Nestel', 'info@nestel.com', '345678901', 'nestel', '98y93tv_g5gwui', '2020-03-04', 'images/users/hotel-logo2.png', '6934567890', 'Pireus', '25 Kato St.', 34567),      
 ('Nova Haven Resort', 'info@novahavenresort.com', '456789012', 'novahaven', '109jygt4i3t843', '2021-05-08', 'images/users/hotel-logo3.png', '6945678901', 'Crete', '9 Ekei St.', 45678),
 ('Viola & Lewis Rooms', 'info@violalweis.com', '567890123', 'violaNlewis', 'rygfkgrcwierlghw', '2019-11-02', 'images/users/company-logo1.png', '6956789012', 'Athens', '2 Kapou St.', 56789),
 ('Plated Partners', 'info@platedpartners.com', '105629380', 'plated_partners', '2xf43w5W23D', '2017-01-12', 'images/users/platedpartners.png', '6999887766', 'Sparta', '35 Marinou St.', 22233),
 ('Bright Plus', 'info@brightplus.com', '667788990', 'bright+', 'egnf437778jcmEE', '2022-07-07', 'images/users/lighting.png', '6966339910', 'Athens', '201 Georgiou St.', 11109),
 ('Kitchen Stuffed', 'info@kitchenstuffed.com', '609147290', 'kitchenStuffed', '34yvyhDF45$', '2020-10-21', 'images/users/kitchen.png', '6977111122', 'Lamia', '45 Patision St.', 23810);

insert into product (productName, image, category, description, price, stock, supplier)
values ('Luxe Loom Towels 100% Cotton', 'images/Bathroom/towels2.png', 'Bathroom', 'Material: 100% organic cotton, GOTS certified.
Size: 16 x 28 inches.
GSM: 550 GSM - perfect for everyday use, soft and absorbent.
Eco-Friendly: Dye-free and chemical-free, safe for sensitive skin.
Color Options: Resting Place / Canoe / Sausage Roll / Oyster White / Sleepy Blue / Downing Slate / Warm Grey Flannel
Care Instructions: Machine wash warm, tumble dry low, avoid fabric softeners.', 20.00, 50, 'luxeloom'),
 ('SliceMate Mini Desk Shredder', 'images/OfficeEquipment/shredder2.png', 'OfficeEquipment', 'Design: Compact and portable shredder perfect for home offices, dorms, or personal use.
Capacity: Shreds up to 4 sheets of paper at a time into secure cross-cut confetti pieces.
Power: USB-powered or battery-operated for convenience.
Features:
-Quiet operation for minimal disruption.
-Transparent waste bin with a 1-liter capacity, easy to empty.
-Safety lock to prevent accidental operation.
Uses: Ideal for shredding documents, receipts, and other sensitive paperwork.', 35.00, 120, 'corporatellge'),
 ('Tanas Glow Laundry Detergent', 'images/CleaningSupplies/detergent1.png', 'CleaningSupplies', 'Fragrance: Light floral scent with refreshing notes to leave your clothes smelling clean and fresh.
Formula: Concentrated liquid detergent with powerful stain-fighting enzymes. Safe for colors and whites.
Eco-Friendly: Biodegradable formula with plant-based ingredients, suitable for sensitive skin.
Compatibility: Works with all washing machines, including HE (high-efficiency) models.
Size: 1,5L bottle, sufficient for up to 30 washes.', 8.70, 150, 'sparkkClean'),
 ('Luxury Hotel Shower Curtain', 'images/Bathroom/curtens1.png', 'Bathroom', 'Natural Linen Look: Crafted from textured fabric with a soft, neutral tone for an earthy, minimalist style.
Eco-Friendly Material: Made with sustainable, durable fabric for a low environmental impact.
Elegant Fringe Detail: Finished with tassel edges to add a subtle, bohemian touch.
Quick-Drying & Mildew-Resistant: Designed to stay fresh and clean, enhancing bathroom hygiene.
Easy to Maintain: Machine washable for convenience and long-lasting beauty.', 18.00, 62, 'luxeloom'),
 ('FlexGuard Rubber Gloves', 'images/CleaningSupplies/rubber-gloves.png', 'CleaningSupplies', 'Design: Durable yet flexible gloves with a snug fit to provide maximum dexterity and comfort.
Material: Made from high-quality latex with a textured grip for secure handling of wet or slippery items.
Lining: Soft cotton lining to keep hands dry and comfortable during extended use.
Uses: Perfect for dishwashing, cleaning, gardening, or general household tasks.
Colors Available: Sunny Yellow, Soft Pink, and Ocean Blue.
Sizes: Available in Small, Medium, and Large.', 4.99, 69, 'sparkkClean'),
 ('RGBStrike Mechanical Keyboard', 'images/Hardware/keyboard.png', 'Hardware', 'Design: A compact and durable keyboard with a sleek black frame and vibrant red, green, and blue accent keys for a bold, unique look.
Key Type: Mechanical keys with tactile feedback for precision typing and gaming.
Lighting: Optional RGB backlighting to enhance visibility and style in any environment.
Features:
-Anti-ghosting technology for seamless multi-key input.
-Detachable USB-C cable for portability and convenience.
-Adjustable feet for ergonomic typing angles.
-Compatibility: Works with Windows, macOS, and Linux systems.', 49.99, 75, 'corporatellge'),
 ('Herbal Scent Set', 'images/Bathroom/guest-amenities1.png', 'Bathroom', 'This elegant amenities set brings spa-like luxury to your home. It includes two liquid soaps, a body lotion, a hand cream, and a soothing soy candle, all displayed on a chic marble tray. Perfect for adding a touch of sophistication to your bathroom or vanity.', 22.00, 30, 'luxeloom'),
 ('Organic Lavender Soap Bar', 'images/Bathroom/soap1.png', 'Bathroom', 'Discover the calming essence of organic lavender with these artisanal soap bars. Each bar is crafted with natural ingredients to gently cleanse and nourish your skin, leaving a subtle lavender fragrance. Beautifully minimalist in design, these soaps make a perfect addition to any bathroom.', 12.00, 100, 'luxeloom'), 
 ('Canonix Pro 3600 All-in-One Printer', 'images/OfficeEquipment/printer1.png', 'OfficeEquipment', 'The Canonix Pro 3600 is a versatile all-in-one printer designed for home and office use. Featuring wireless connectivity, fast print speeds, and high-resolution photo printing, it’s perfect for everything from documents to vibrant images. With its sleek, compact design and user-friendly touch interface, the Pro 3600 supports duplex printing, scanning, and copying, making multitasking a breeze. Compatible with various operating systems and mobile devices, this printer ensures seamless integration into any workspace.', 249.99, 82, 'corporatellge'),
 ('Classic Turkish Bath Towels', 'images/Bathroom/towels3.png', 'Bathroom', 'Made from premium cotton, they offer exceptional softness, absorbency, and durability. Perfect for adding a spa-like touch to your bathroom, these towels provide comfort and style in every use.', 16.00, 110, 'luxeloom'),               
 ('Duct Tape', 'images/PackagingMaterials/tape.png', 'PackagingMaterials', 'Length: 50 yards 
Material: Heavy-duty polyethylene-coated cloth.
Adhesive Strength: Industrial-grade adhesive for superior bonding.
Width: 2 inches (standard size).
Colors Available: Silver, Black, White, and Transparent.
Durability: Water-resistant and tear-resistant design.
Temperature Resistance: Works in extreme temperatures (-10°F to 180°F).
Special Feature: Easy tear by hand.
Ideal For: Repairs, packaging, sealing.', 9.99, 100, 'packNest'),
 ('DrillEdge Pro', 'images/Tools/drill.png', 'Tools', 'Motor: High-performance brushless motor for long-lasting durability and efficiency.
Power: 20V lithium-ion battery delivering consistent torque and runtime.
Speed Control: Variable speed settings with a maximum of 2,500 RPM for precise drilling and fastening.
Features:
-Integrated LED light for visibility in low-light conditions.
-Ergonomic handle with anti-slip grip for comfort during extended use.
-Quick-change chuck for seamless bit swaps.
Accessories Included:
-Set of 10 drill bits for wood, metal, and masonry.
-Dual-port fast charger for rapid battery recharge.
-Durable carrying case for portability and organization.
Safety: Overheat and overcharge protection to extend battery and tool lifespan.
Warranty: 3-year limited warranty.', 139.99, 25, 'ironhand'),
 ('Eco-Friendly Bamboo Towel Set', 'images/Bathroom/towels1.png', 'Bathroom', 'Sustainable Bamboo: Made from eco-friendly, sustainably sourced bamboo fibers.
Soft & Absorbent: Luxuriously soft with excellent absorbency for a spa-like feel.
Hypoallergenic: Naturally antibacterial, perfect for sensitive skin.
Elegant Colors: Includes cool gray, ocean blue, and aqua for a serene bathroom look.
Eco-Conscious Choice: Durable, stylish, and ideal for reducing environmental impact.', 23.50, 124, 'luxeloom'),
 ('ClearSky Office Table', 'images/Furniture/desk3.png', 'Furniture', 'Material: Lightweight engineered wood with a durable laminated surface.
Frame: Powder-coated steel or hardwood legs for stability.
Dimensions: 48” W x 30” H x 24” D (compact) to 60” W x 30” H x 28” D (standard).
Weight Capacity: 150 lbs.
Colors: Light oak, whitewash, or birch.
Features: Integrated cable management holes and a minimalist design perfect for home offices or studio spaces.
Additional: Easy to assemble, portable, and ideal for smaller rooms or co-working setups.', 249.99, 13, 'furniture'),
 ('Elegance Ink Series (4 pen set)', 'images/Stationary/pens1.png', 'Stationary', 'Design: A collection of smooth, minimalist pens in pastel and neutral shades with chrome accents.
Material: Premium metal casing with a polished finish, ensuring durability and elegance.
Ink Type: Smooth-flow gel ink for a flawless writing experience.
Grip: Ergonomic design for comfortable use during long writing sessions.', 12.60, 240, 'paperCharm'),
 ('Canvas Chronicles Collection', 'images/Stationary/notebooks3.png', 'Stationary', 'Designs: A curated selection of artistic prints, including geometric patterns, abstract florals, and contemporary minimalism.
Covers: Hardcover and softcover options in a range of pastel, bold, and earthy tones with matte or textured finishes.
Colors: Abstract Florals, geometric patterns, contemporary minimalist patterns.
Sizes: Available in A4, and pocket-sized formats.
Paper Quality: 100 gsm premium paper, ideal for writing, sketching, or journaling without ink bleed.
Extras: Some designs include elastic closures, inner pockets, or ribbon bookmarks for added functionality.', 9.00, 35, 'paperCharm'),
 ('Honey Moisturizing Soap', 'images/Bathroom/soap2.png', 'Bathroom', 'Natural Ingredients: Enriched with pure honey and nourishing oils for deep hydration.
Moisturizing Formula: Locks in moisture, leaving skin soft and smooth.
Gentle & Soothing: Ideal for all skin types, including sensitive skin.
Handcrafted Quality: Each bar is artisan-made, ensuring high quality and attention to detail.
Eco-Friendly & Sustainable: Packaged thoughtfully and made with environmentally-friendly practices.', 6.00, 73, 'luxeloom'), 
 ('Classic Desk Lamp', 'images/Lighting/lamp.png', 'Lighting', 'Material: Metal base with a matte finish and durable brass arm.\r\nColor: White with a warm gold-tone arm for a sleek and modern aesthetic.\r\nLight Source: Compatible with LED and incandescent bulbs (E27 socket).\r\nAdjustability: Flexible head and adjustable arm for directional lighting.\r\nPower Source: Plug-in with a 1.5m power cord.\r\nHeight: 14 inches (fully extended).\r\nBase Diameter: 6 inches.\r\nIdeal Use: Perfect for workspaces, study desks, and bedside tables.\r\nLighting Type: Emits soft, warm light suitable for reading or focused tasks.', 45.99, 43, 'form&function'),
 ('Vintage Tassel Shower Curtain', 'images/Bathroom/curtens2.jpg', 'Bathroom', 'Vintage-Inspired Design: Features classic patterns and textures for a timeless, nostalgic look.
High-Quality Fabric: Made from soft, durable material that drapes beautifully.
Elegant Details: Delicate lace, fringe, or ruffle accents add a charming, antique feel.
Easy to Clean: Machine washable for easy upkeep, preserving its beauty over time.
Perfect for Vintage Decor: Complements farmhouse, rustic, or shabby-chic bathroom styles.', 15.00, 8, 'luxeloom'), -- saved products under here 
 ('Round Wicker Relax Chair', 'images/Furniture/chairs1.png', 'Furniture', 'Natural Wicker Weave: Handcrafted from high-quality wicker, adding a warm, organic feel to any space.
Cozy Round Shape: Enveloping circular design offers a comfortable and inviting seat for relaxation.
Sturdy Frame: Built with a durable metal or wooden frame for stability and longevity.
Weather-Resistant Finish: Suitable for both indoor and outdoor use, perfect for patios, sunrooms, or living areas.
Boho-Chic Style: Complements bohemian, coastal, or rustic decor with its natural, laid-back vibe.', 60.00, 48, 'form&function'),               
 ('Pastel Spiral Notebooks', 'images/Stationary/notebooks2.png', 'Stationary', 'Design: Sleek and vibrant spiral notebooks in soothing pastel shades, perfect for everyday use.
Colors Available: Aqua Green, Lavender Purple, and Sky Blue.
Paper Quality: 80 gsm lined paper, ideal for notes, doodles, or journaling without smudging.
Binding: Durable metal spiral for easy page flipping and flat-laying convenience.
Size: A5 (5.8 x 8.3 inches), compact and lightweight for on-the-go writing.', 5.99, 42, 'writeWay'),
 ('ToastPerfect 2.0', 'images/Kitchen/toaster.png', 'Kitchen', 'Type: 2-slice or 4-slice toaster models.
Features:
-Browning control with 6-8 shade settings.
-Defrost, reheat, and bagel modes.
-Wide slots for thick bread, bagels, or waffles.
-Removable crumb tray for easy cleaning.
Material: Stainless steel or BPA-free heat-resistant plastic.
Power: 800W - 1500W for fast toasting.
Colors: Retro red, matte black, or polished chrome.
Additional: Compact design ideal for small kitchens or countertops.', 43.00, 31, 'kitchenStuffed'),
 ('Harmony Tabs File Folders (12)', 'images/Stationary/folders2.png', 'Stationary', 'Design: A set of pastel-colored file folders designed for effortless organization with a stylish touch.
Colors Available: Sky Blue, Lavender, Mint Green, Peach, Buttercream Yellow, and Soft Pink.
Material: Durable, high-quality cardstock to keep documents safe and crease-free.
Tabs: Pre-cut, reinforced tabs for easy labeling and sorting.
Size: Standard letter size (8.5 x 11 inches), suitable for all your paperwork.', 10.00, 58, 'writeWay'),
 ('Standard 5-Drawer Filing Cabinet', 'images/Furniture/filling-cabinets2.png', 'Furniture', 'Spacious Storage: Five deep drawers provide ample space for organizing documents, files, and office supplies.
Durable Construction: Made from sturdy metal for long-lasting use.
Smooth Drawer Operation: Equipped with easy-glide rails for effortless opening and closing.
Secure Locking System: Central lock mechanism to keep sensitive documents safe and secure.
Classic Office Style: Simple, functional design that fits seamlessly into any professional workspace.', 120.00, 90, 'form&function'),   
 ('VisuCore Pro24', 'images/Hardware/monitors.png', 'Hardware', 'Screen Size: 24 inches.
Resolution: Full HD 1920x1080.
Panel Type: VA with deep blacks and high contrast.
Refresh Rate: 144Hz (for smoother visuals).
Response Time: 1ms (ideal for gamers).
Ports: HDMI, DisplayPort, 2x USB. 
Ergonomics: Height adjustable stand and VESA mount compatibility.
Special Feature: Flicker-free technology and blue light filter for eye comfort', 320.00, 305, 'techforge'),  
 ('Mini Morning Essentials', 'images/FoodSupplies/nutella-honey.png', 'FoodSupplies', 'Items Included:
-Nutella Mini Jar (x2) – 30g each
-Honey Mini Jar (x2) – 50g each
-Mini Butter Stick – 20g
Perfect For:
-Breakfast spreads
-On-the-go snacks
-Gift boxes for food lovers', 12.50, 320, 'plated_partners'), 
 ('Microfiber Cleaning Cloth', 'images/CleaningSupplies/cleaning-cloths.png', 'CleaningSupplies', 'Ultra-Soft Material: Made from high-quality microfiber that’s gentle on surfaces and prevents scratches.
Highly Absorbent: Absorbs water, dust, and dirt efficiently, leaving surfaces streak-free.
Lint-Free & Non-Abrasive: Ideal for cleaning glass, mirrors, electronics, and delicate surfaces.
Reusable & Machine Washable: Designed for multiple uses, making it an eco-friendly cleaning option.
Vibrant Colors: orange / cyan / yellow / pink / purple / green
Versatile Use: Perfect for home, car, and office cleaning tasks, from dusting to polishing.', 5.00, 80, 'nestel'), 
 ('Iron Hand Hammer', 'images/Tools/hammer.png', 'Tools', 'Material: High-carbon steel head for exceptional durability and striking power.
Handle: Shock-absorbing fiberglass handle with an ergonomic, non-slip rubber grip.
Weight: 16-ounce balanced head, ideal for both driving and pulling nails with precision.
Features:
Curved claw design for efficient nail removal.
Anti-vibration technology to reduce hand strain during extended use.
Magnetic nail starter for one-handed operation.
Versatility: Suitable for construction, carpentry, and DIY projects.
Safety: Textured grip reduces the risk of slippage.
Warranty: Lifetime warranty against defects in material and workmanship.', 29.99, 35, 'ironhand'),
 ('ClickAura Series', 'images/Hardware/mouse.png', 'Hardware', 'Sensor Type: High-precision optical sensor with 12,000 DPI (adjustable).
Connectivity: Wired USB-A for ultra-low latency.
Design: Ergonomic shape with textured sides for grip.
Colors Available: Metallic Red, Green, Blue, Silver, and Copper.
Buttons: 6 programmable buttons with silent-click technology.
Cable: Durable braided cable for long-lasting use.
Special Feature: RGB backlight customization with 3 lighting zones.
Compatibility: Windows, macOS, and Linux.', 39.99, 65, 'techforge'),
 ('Colorful Lounge Chairs', 'images/Furniture/chairs2.png', 'Furniture', 'Upholstery: Premium velvet fabric with soft padding.
Frame: Durable metal frame with powder-coated legs.
Colors: Available in vibrant shades like coral red, jade green, mustard yellow, teal blue, and blush pink.
Dimensions: 28” W x 30” H x 26” D.
Weight Capacity: 300 lbs.
Additional: Lightweight and easy to assemble; suitable for living rooms, lounges, or creative spaces.', 240.00, 169, 'furniture'),
 ('Task Chair', 'images/Furniture/chairs3.png', 'Furniture', 'Material: Ergonomic mesh or foam-backed seating with faux leather finish.
Adjustability: Seat height and backrest recline for custom comfort.
Base: 5-star swivel base with smooth-rolling caster wheels.
Weight Capacity: 275 lbs.
Dimensions: 24” W x 36-42” H x 26” D.
Additional: Lumbar support for long work hours; compact design for small office spaces.', 149.00, 98, 'furniture'),
 ('Package Boxes', 'images/PackagingMaterials/boxes.png', 'PackagingMaterials', 'Material: High-durability corrugated cardboard (single or double-walled options).
Sizes Available: Small, Medium, Large, and Extra-Large (custom sizing upon request).
Weight Capacity: Up to 50 lbs (reinforced for heavy loads).
Eco-Friendly: Made with 80% recycled materials, fully recyclable.
Design Features:
-Easy-fold creases for quick assembly.
-Water-resistant coating for added protection.
-Reinforced corners for extra durability.
Special Feature: Custom branding options available (logos, colors, and labels).
Ideal For: Shipping, moving, storage, and e-commerce packaging.', 22.50, 110, 'packNest'),
 ('F&F Library Setup', 'images/Furniture/library.png', 'Furniture', 'Material: Solid wood or engineered wood with smooth matte or glossy finish.
Storage: Multiple tiers for books, decor, or storage boxes.
Dimensions: Options range from small (36” W x 48” H) to large (72” W x 84” H).
Colors: Natural oak, walnut brown, or charcoal black.
Features: Adjustable shelves, anti-tip hardware, and optional glass doors.
Additional: Customizable units for modular expansion; modern yet timeless design.', 310.00, 22, 'form&function'),
 ('Square Ceiling Lights', 'images/Lighting/office-ceiling-light2.png', 'Lighting', 'Material: Aluminum frame with frosted acrylic diffuser.
Light Type: Integrated energy-efficient LED with uniform light distribution.
Brightness: 1500 - 4500 lumens (adjustable options).
Color Temperature: 3000K (warm white) to 6000K (cool white).
Installation: Flush-mounted or recessed into ceilings.
Features:
Dimmable via remote control or smart systems.
Flicker-free technology to reduce eye strain.
Modern, slim profile design.
Dimensions: Available in 12” x 12” to 24” x 24” panels.
Colors: Matte white, black, or silver.
Additional: Perfect for offices, conference rooms, or modern living spaces.', 146.00, 27, 'bright+'),
 ('BrightCore X1', 'images/Hardware/projector.png', 'Hardware', 'Resolution: 4K Ultra HD (3840x2160) for crystal-clear visuals.
Brightness: 3,500 lumens for vibrant projections in any lighting.
Contrast Ratio: 10,000:1 for deep blacks and sharp colors.
Projection Size: Supports screen sizes from 50 to 300 inches.
Connectivity: HDMI, USB-C, Wireless Screen Mirroring (Wi-Fi), and Bluetooth.
Lamp Life: Up to 30,000 hours with LED technology.
Audio: Built-in dual 10W stereo speakers with Dolby sound enhancement.
Portability: Compact and lightweight design with a sleek matte white finish.
Special Feature: Auto keystone correction and 4-corner adjustment for easy setup.', 480.00, 45, 'techforge'),
 ('Caribou Coffee Blend', 'images/FoodSupplies/coffee1.png', 'FoodSupplies', 'Flavor Profile: Medium roast with sweet and bold notes, hints of chocolate, and subtle nuttiness.
Sourcing: Ethically sourced beans from premium coffee-growing regions.
Brewing Versatility: Ideal for coffee makers, French presses, or pour-overs.
Experience: Perfect for any time of day, offering a cozy and comforting cup.
Available Options: Choose from whole bean or ground coffee.', 8.99, 105, 'plated_partners'),
 ('FreshVault Max', 'images/Kitchen/refridgerator.png', 'Kitchen', 'Type: Mini fridge, top-freezer, or French-door models.
Capacity: 3.2 cu. ft. (compact) to 20 cu. ft. (full-size).
Features:
Adjustable temperature controls with energy-saving mode.
Built-in freezer compartment for compact models.
Spill-proof glass shelves and crisper drawers.
Smart LED lighting for interior visibility.
Material: Stainless steel, matte black, or sleek white finish.
Noise Level: Low (35-45 dB for quiet operation).
Additional: Ideal for home kitchens, dorms, or break rooms.', 399.99, 15, 'kitchenStuffed'),
 ('Muji Kraft Paper Notebook', 'images/Stationary/notebooks1.png', 'Stationary', 'Eco-Friendly Material: Made from 100% recycled kraft paper, promoting sustainability.
Durable Cover: Sturdy kraft cover protects your notes and sketches while adding a rustic charm.
Versatile Use: Suitable for journaling, note-taking, sketching, or creative projects.
Blank or Lined Pages: Available with blank, lined, or grid pages to suit various writing styles.
Compact Size: Lightweight and portable, perfect for carrying in a backpack or purse.', 6.00, 67, 'paperCharm'),
 ('BeamFlow Linear', 'images/Lighting/office-ceiling-light.png', 'Lighting', 'Material: Aluminum body with acrylic diffuser for even light.
Light Type: High-output LED strip with energy efficiency.
Brightness: 2000 - 5000 lumens (depending on length).
Color Temperature: Adjustable from warm (3000K) to cool (6000K).
Installation: Surface-mounted, suspended, or recessed.
Features:
Dimmable with smart controls.
Modular design for continuous lighting in long spaces.
Sleek, modern aesthetic with edge-to-edge illumination.
Dimensions: Available in 24”, 48”, and 72” lengths.
Colors: White, black, or brushed aluminum.
Additional: Ideal for offices, hallways, studios, or retail spaces.', 150.00, 11, 'bright+'),
 ('Multicolor Binder Set (13)', 'images/Stationary/binders1.png', 'Stationary', 'Color Variety: Includes 13 different colors to help organize and categorize your documents creatively.
Durable Construction: Made from high-quality materials to withstand daily use.
Standard Size: Fits standard letter-size sheets for versatile use.
Easy Access: Features a 3-ring design for quick and simple page turning and organization.
Customizable Spines: Allows for easy labeling and identification of contents for enhanced organization.', 35.00, 59, 'paperCharm'),
 ('Bright+ SlimLamp', 'images/Lighting/desk-lamp2.png', 'Lighting', 'Material: High-grade aluminum body with a matte or brushed finish.
Design: Ultra-slim, modern design with an adjustable arm and flat LED panel.
Light Type: Energy-efficient LED with adjustable brightness levels (3-5 settings).
Power Source: USB or AC adapter with low energy consumption.
Features:
-Flicker-free light for eye comfort.
-Touch-sensitive controls for brightness and color temperature.
-Rotating head and foldable body for flexibility and portability.
Dimensions: 16” H x 12” L (adjustable).
Colors: Black, white, or silver.
Additional: Ideal for modern offices, study spaces, or minimalist workstations.', 79.00, 55, 'bright+'),
 ('Beacon Classic', 'images/Lighting/desk-lamp.png', 'Lighting', 'Material: Metal or wood base with a vintage-inspired design.
Light Type: Compatible with E26/E27 light bulbs (LED, incandescent, or filament bulbs).
Design: Traditional style with exposed bulb or lampshade options.
Power Source: Standard AC plug with on/off switch.
Features:
-Dimmable (with compatible bulbs).
-Sturdy, weighted base for stability.
-Option for warm or cool light bulbs.
Dimensions: 14” H x 8” W (base).
Colors: Matte black, brushed bronze, or natural wood.
Additional: Perfect for vintage-inspired offices, cozy study nooks, or traditional workspaces.', 49.99, 12, 'bright+'),
 ('AromaFusion 3000', 'images/Kitchen/coffee-machine.png', 'Kitchen', 'Type: Drip coffee, espresso machine, or pod-compatible brewer.
Features:
-Programmable timer with auto-start.
-Adjustable brew strength (mild, regular, bold).
-Built-in milk frother (select models).
-LCD display with one-touch control.
Capacity: 10 - 15 cups (carafe models); single-serve for pod machines.
Material: Stainless steel with glass carafe or BPA-free plastic.
Colors: Black, silver, or matte white.
Additional: Ideal for home offices, kitchens, or small cafes.', 82.00, 16, 'kitchenStuffed'),
 ('Delight Box (16 pieces)', 'images/FoodSupplies/cakes.png', 'FoodSupplies', 'Flavors: Classic Chocolate, Velvet Red, Golden Caramel, Strawberry Bliss, Vanilla Dream, Dark Cocoa, Mocha Delight, Lemon Cream', 48.00, 320, 'plated_partners'),
 ('Office Desk', 'images/Furniture/desk2.jpg', 'Furniture', 'Desk Material: High-grade engineered wood with a scratch-resistant matte finish.
Chair: Premium faux leather upholstery with high-back ergonomic support.
Desk Dimensions: 72” W x 30” H x 28” D.
Storage: Integrated drawers and cable management slots for organized workspace.
Weight Capacity: Desk - 200 lbs | Chair - 350 lbs.
Style: Modern, minimalist design suited for executive offices and boardrooms.', 750.00, 38, 'furniture'),
('MicroChef 500', 'images/Kitchen/microwave.png', 'Kitchen', 'Type: Compact countertop or midsize microwave oven.
Capacity: 0.7 - 1.5 cubic feet.
Power: 700W - 1200W for faster heating.
Features:
-Preset cooking modes (popcorn, reheat, defrost, etc.).
-Digital timer and child lock function.
-Rotating glass turntable for even heating.
-Compact design perfect for small spaces.
Material: Stainless steel exterior and easy-to-clean interior.
Colors: Silver, matte black, or white.
Additional: Energy-efficient and ideal for apartments or offices.', 111.00, 29, 'kitchenStuffed');

insert into orders (ordered, shipped, status)
values  ('2024-10-01', '2024-10-16', 'shipped'),
 ('2021-02-03', '2021-02-10', 'shipped'),
 ('2021-03-12', '2021-03-25', 'completed'),
 ('2021-04-01', '2021-04-20', 'completed'),
 ('2021-05-15', '2021-05-30', 'completed'),
 ('2021-06-06', '2021-06-24', 'completed');

insert into order_products
values (1, 9, 30, 'paperCharm'),
 (1, 10, 25, 'paperCharm'),
 (2, 14, 5, 'nestel'),
 (3, 14, 6, 'luxeloom'),
 (4, 11, 4, 'nestel');

insert into reviews
values 
-- reviews for 'Luxe Loom Towels 100% Cotton'
(3, 'Beautifully soft and durable, the Luxe Loom Towels are a fantastic addition to our rooms.', 1, 'mansionsRnS'),
(5, 'Our guests love the Luxe Loom Towels! Soft, high-quality cotton—ideal for a comfortable stay.', 1, 'violaNlewis'),
(5, 'Luxurious and soft, the Luxe Loom Towels add elegance to every room. Perfect for guests who expect the best.', 1, 'isabel_claudia'),
(4, 'This product is great! Definitely recommend it! Exactly like the picture, soft material', 1, 'horizonInn'),
(4, 'High quality and beautiful design! Im very happy with this purchase.', 1, 'nestel'),
(4, 'Fast shipping, the material feels soft and durable. Worth every penny!', 1, 'novahaven'),

-- Reviews for various office supplies and equipment
(5, 'The SliceMate shredder is perfect for our small office. Quiet and efficient!', 2, 'corporatellge'),
(4, 'Reliable printer, great for high-volume printing needs.', 9, 'bright+'),
(5, 'Amazing keyboard! The mechanical switches feel great and the RGB lighting is beautiful.', 6, 'techforge'),
(4, 'Very comfortable chairs, perfect for our office renovation.', 30, 'corporatellge'),
(5, 'These folders takes the organization to the next level! Strongly suggest.', 23, 'bright+'),

-- Reviews for cleaning and bathroom supplies
(5, 'These rubber gloves are durable and comfortable for long cleaning sessions.', 5, 'corporatellge'),
(4, 'The detergent leaves clothes fresh and clean. Great value!', 3, 'nestel'),
(5, 'Love these microfiber cloths! They clean everything perfectly.', 27, 'mansionsRnS'),
(4, 'Beautiful shower curtain that adds elegance to our bathrooms.', 19, 'horizonInn'),
(4, 'The soap smells amazing and leaves skin soft. Our guests love it!', 17, 'novahaven'),

-- Reviews for furniture and lighting
(4, 'Elegant desk lamp that provides perfect lighting for work.', 18, 'form&function'),
(5, 'The wicker chair is both comfortable and stylish. Great addition!', 20, 'violaNlewis'),
(4, 'Beautiful ceiling lights that transformed our office space.', 34, 'corporatellge'),
(5, 'The library setup is perfect for our reading room. Very satisfied!', 33, 'mansionsRnS'),
(4, 'Comfortable task chair, great for long work hours.', 31, 'packNest'),

-- Reviews for kitchen and food supplies
(5, 'The coffee machine makes excellent coffee. Our staff loves it!', 43, 'corporatellge'),
(4, 'Reliable microwave, perfect size for our break room.', 46, 'isabel_claudia'),
(5, 'The mini morning essentials kit is perfect for our guest rooms!', 26, 'horizonInn'),
(4, 'Great coffee blend, our guests always ask about it.', 36, 'novahaven'),
(5, 'The refrigerator is spacious and energy-efficient.', 37, 'violaNlewis'),

-- Reviews for hardware and tools
(4, 'The monitor has great color accuracy and no lag.', 24, 'techforge'),
(5, 'Excellent projector quality, perfect for our presentations.', 35, 'corporatellge'),
(4, 'The mouse is responsive and comfortable for all-day use.', 29, 'bright+'),
(5, 'Reliable hammer, great quality for the price.', 28, 'furniture'),
(4, 'The drill works perfectly for our maintenance needs.', 12, 'form&function'),

-- Reviews for stationery and packaging
(5, 'Beautiful notebooks with high-quality paper.', 38, 'writeWay'),
(4, 'The binder set helps keep everything organized perfectly.', 40, 'paperCharm'),
(5, 'Sturdy boxes, perfect for our shipping needs.', 32, 'plated_partners'),
(4, 'The tape is strong and reliable for all our packaging.', 11, 'ironhand'),
(5, 'Such a nice and comfortable office!', 14, 'writeWay');

