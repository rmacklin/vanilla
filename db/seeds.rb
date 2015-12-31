# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

images = ['https://media0.giphy.com/media/gwNs1Ga6F5RRK/200.gif',
          'https://media2.giphy.com/media/11qAyKz9AbFEYM/200.gif',
          'https://media3.giphy.com/media/xuDHhHcCR0rew/200.gif',
          'https://media3.giphy.com/media/piupi6AXoUgTe/200.gif',
          'https://media1.giphy.com/media/C0z65GND5PgzK/200.gif',
          'https://media3.giphy.com/media/EldfH1VJdbrwY/200.gif',
          'https://media1.giphy.com/media/kVA5mbyY6Z6AU/200.gif',
          'https://media2.giphy.com/media/11UvK6p2PWDMhq/200.gif',
          'https://media2.giphy.com/media/yoJC2sk5DhU7attXry/200.gif',
          'https://media3.giphy.com/media/VKaIkkWo9fqZW/200.gif',
          'https://media3.giphy.com/media/vjyl3YVgcLiWA/200.gif',
          'https://media3.giphy.com/media/TeC6PUufsNFza/200.gif',
          'https://media2.giphy.com/media/Qz6koj9kwUjOo/200.gif',
          'https://media1.giphy.com/media/DqSw5gyRQ5yPC/200.gif',
          'https://media2.giphy.com/media/jzQXsabuFUUX6/200.gif',
          'https://media2.giphy.com/media/gqxhoRt6h6Eak/200.gif',
          'https://media0.giphy.com/media/CMJnQeN5ED9gk/200.gif',
          'https://media2.giphy.com/media/D8BUT9ok5SOaI/200.gif',
          'https://media2.giphy.com/media/d0MYTsbRnGKoU/200.gif',
          'https://media0.giphy.com/media/ChzfTLSi47FYc/200.gif',
          'https://media3.giphy.com/media/42GWm4jxx3QLS/200.gif',
          'https://media3.giphy.com/media/1gUxB3UbATEvS/200.gif',
          'https://media3.giphy.com/media/74PNUyPZhv7fa/200.gif',
          'https://media1.giphy.com/media/5O3k4fxKARpVS/200.gif',
          'https://media3.giphy.com/media/5truRldhJmx32/200.gif']

tags = %w(apple banana cat dog)

images.each do |url|
  Image.create url: url, tag_list: tags.sample(rand(1..tags.size)).join(',')
end
