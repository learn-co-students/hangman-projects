require 'require_all'
require 'pry'

# require_relative "letter.rb"
# require_relative 'word.rb'

def title
  puts "                        WELCOME TO                            "
  puts "888                                                           "
  puts "888                                                           "
  puts "888                                                           "
  puts "88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.  "
  puts '888 "88b    "88b888 "88bd88P"88b888 "888 "88b    "88b888 "88b '
  puts '888  888.d888888888  888888  888888  888  888.d888888888  888 '
  puts '888  888888  888888  888Y88b 888888  888  888888  888888  888 '
  puts '888  888"Y888888888  888 "Y88888888  888  888"Y888888888  888 '
  puts '                             888                              '
  puts '                        Y8b d88P                              '
  puts '                         "Y88P"                               '
end


def hangman_img
[
  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||              ",
    '| |/         ||              ',
    "| |          ||              ",
    "| |         //\\\\             ",
    "| |        ||  ||            ",
    '| |         \\\\//             ',
    '| |                          ',
    '| |                          ',
    "| |                          ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    ',
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||.-''.         ",
    '| |/         |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |           `--'           ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    "| |                          ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    ',
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||.-''.         ",
    '| |/         |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |         .-`--'.          ",
    '| |        /_     _\         ',
    '| |          |   |           ',
    '| |          |___|           ',
    "| |                          ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    ',
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||.-''.         ",
    '| |/         |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |         .-`--'.          ",
    '| |        /_     _\         ',
    '| |       // |   |           ',
    '| |      //  |___|           ',
    "| |     ')                   ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    ',
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||.-''.         ",
    '| |/         |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |         .-`--'.          ",
    '| |        /_     _\         ',
    '| |       // |   | \\\\        ',
    '| |      //  |___|  \\\\       ',
    "| |     ')           ('      ",
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '| |                          ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    '
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    "| | /        ||.-''.         ",
    '| |/         |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |         .-`--'.          ",
    '| |        /_     _\         ',
    '| |       // |   | \\\\        ',
    '| |      //  |___|  \\\\       ',
    "| |     ')   |   |   (`      ",
    '| |          ||--|           ',
    '| |          ||              ',
    '| |          ||              ',
    '| |          ||              ',
    '| |         / |              ',
    '""""""""""""""""""""""""|    ',
    '|"|"""""""""""""""""""|"|    ',
    '| |                   | |    ',
    ': :                   : :    ',
    '. .                   . .    '
  ],

  [
    '___________.._______         ',
    '| .__________))______|       ',
    '| | / /      ||              ',
    '| |/ /       ||              ',
    '| | /        ||              ',
    "| |/         ||.-''.         ",
    '| |          |/  _  \        ',
    "| |          ||  `/,|        ",
    "| |          (\\\\`_.'         ",
    "| |         .-`--'.          ",
    '| |        /_     _\         ',
    '| |       // |   | \\\\        ',
    '| |      //  |___|  \\\\       ',
    "| |     ')   |   |   (`      ",
    '| |          ||-||           ',
    '| |          || ||           ',
    '| |          || ||           ',
    '| |          || ||           ',
    '""""""""""|_/ | | \ |"""|    ',
    '|"|"""""""\ `-" `-" ""|"|    ',
    '| |        \ \        | |    ',
    ': :         \ \       : :    ',
    '. .          \ \      . .    '
  ],
  [
    "          n   .-''.   n       ",
    '         nln / _  _\ nln      ',
    "         \\ \\ | * L*|/ /       ",
    "          \\ \\ \\__U// /        ",
    "           \\ \\`--'/ /         ",
    '            \      /          ',
    '             |    |           ',
    '             |____|           ',
    "             |    |           ",
    '             ||--||           ',
    '             ||  ||           ',
    '             ||  ||           ',
    '             ||  ||           ',
    '            / |  | \          ',
    'WWWwWWWWWWwWWwWwwWWwWWWWWwWWWW',
  ]
]
end




def thank_you
[
'  .▀█▀.█▄█.█▀█.█▄.█.█▄▀　█▄█.█▀█.█─█',
'  ─.█.─█▀█.█▀█.█.▀█.█▀▄　─█.─█▄█.█▄█'
]
end
# Pry.start