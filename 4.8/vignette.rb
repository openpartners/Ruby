require 'rmagick'

andrey = Magick::Image.read('andrey.png').first
puts andrey.class
puts "#{andrey.columns}x#{andrey.rows}"
# Wynik:
# Magick::Image
# 222x222
oval = Magick::Image.new(andrey.columns, andrey.rows) do
    # tworzę nowy obrazek oval o takich samych wymiarach jak i andrey
    self.background_color = 'black'
    # mogę nadać dodatkowe własciwości np kolor tła
end

op = Magick::Draw.new # tworzę operację do rysowania
op.stroke('white') # ustawiam kolor pociągnięcia pędzla na biały
op.fill('white') # kolor wypełnienia też na biały
op.ellipse(andrey.columns/2, andrey.rows/2,
andrey.columns/2 - andrey.columns*0.1, andrey.rows/2 - andrey.rows*0.1,
0, 360
)
# rysuję samą elipsę
# pierwsze dwa argumenty środek elipsy - środek obrazka
# kolejne 2 param. - szerokość i wysokość elipsy
# chce by to było prawie cały obrazek z marginesem  10% od rozmiaru obrazka
# kolejne 2 argumenty - kąt startu elipsy czyli 0 stopni i kąt końca elipsy czyli 360 stopni

op.draw(oval) # wykonuję załadowane operacje na obiekcie oval

andrey.alpha = Magick::ActivateAlphaChannel
# właczam kanał alfa w obrazku andrey
oval.alpha = Magick::DeactivateAlphaChannel
# w elipcie kanał alpha mi nie potrzebny

oval = oval.blur_image(0, 20)
# chce rozmyć brzegi oval by evekt był jak vignette
# (promień rozmycia - 0 optymalny dobierze Magick
#  parametr sigma cokolwiek to znaczy - chyba intensywność rozmycia - dam na 20)

comp_andrey = andrey.composite(oval, Magick::CenterGravity, Magick::CopyOpacityCompositeOp)
# dokonuję operacji kompozytow argumenty - oval: na obiekcie, przesunięcie, tryb
#comp_andrey.write("c_andrey.png")
comp_andrey.write("vignette_andrey.png")

oval.write("oval.png") # by sprawdzić co się narysowało zapisuję obrazek
