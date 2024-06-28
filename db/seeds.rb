# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Word.destroy_all
Translation.destroy_all
Example.destroy_all

def create_word_with_nested_attributes(word_data)
  translations = word_data.delete(:translations) || []
  examples = word_data.delete(:examples) || []

  Word.create!(
    word_data.merge(
      translations_attributes: translations,
      examples_attributes: examples
    )
  )
end

# Seed data for words
words_data = [
  {
    "word": "a",
    "lang": "volapuk",
    "category": "preposition",
    "translations": [
      {
        "lang": "english", 
        "text": "per"
      },
      {
        "lang": "english", 
        "text": "at"
      },
    ],
    "examples": [
      {"lang": "english", "text": "A düp = Per hour"},
      {"lang": "english", "text": "A dolars tel = At 2 dollars each"}
    ]
  },
  {
    "word": "ad",
    "lang": "volapuk",
    "category": "preposition",
    "translations": [
      {
        "lang": "english", 
        "text": "for"
      },
      {
        "lang": "english", 
        "text": "in order to"
      },
      {
        "lang": "english", 
        "text": "to"
      },
    ],
    "examples": [
    ]
  },
  {
    "word": "adas",
    "lang": "volapuk",
    "category": "conjunction",
    "translations": [
      {
        "lang": "english", 
        "text": "that"
      },
      {
        "lang": "english", 
        "text": "to"
      },
    ],
    "examples": [
      {"lang": "english", "text": "(after positive) Binom tu liegik, adas vedom tifan = He is too rich to become a thief"},
    ]
  },
  {
    "word": "adelo",
    "roots": ["del"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "today" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Adelo binon del gudik = Today is a good day" 
      }
    ]
  },
  {
    "word": "adyö",
    "lang": "volapuk",
    "category": "interjection",
    "translations": [
      { 
        "lang": "english", 
        "text": "goodbye" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Adyō! = Goodbye!" 
      }
    ]
  },
  {
    "word": "ag",
    "lang": "volapuk",
    "category": "interjection",
    "translations": [
      { 
        "lang": "english", 
        "text": "oh" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Ag! = Oh!" 
      }
    ]
  },
  {
    "word": "agödo",
    "roots": ["göd"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "this morning" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Agödo no äfidob janedi = This morning I didn't eat breakfast." 
      }
    ]
  },
  {
    "word": "ai-",
    "lang": "volapuk",
    "category": "prefix",
    "translations": [
      { 
        "lang": "english", 
        "text": "always" 
      },
      { 
        "lang": "english", 
        "text": "ever" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Aidelik = Daily"
      }
    ]
  },
  {
    "word": "aidelik",
    "roots": ["ai-", "del"],
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "daily" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Nuns aidelik = Daily news"
      }
    ]
  },
  {
    "word": "aipo",
    "roots": ["ai-", "po"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "after each" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "aipos",
    "roots": ["ai-", "po"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "after every" 
      }
    ],
    "examples": [
      { 
        "lang": "english", 
        "text": "Aipos dels tel = Every other day" 
      }
    ]
  },
  {
    "word": "al-",
    "roots": ["al-"],
    "lang": "volapuk",
    "category": "prefix",
    "translations": [
      { 
        "lang": "english", 
        "text": "each" 
      },
      { 
        "lang": "english", 
        "text": "every" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "aldelik",
    "roots": ["al-", "del"],
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "daily" 
      },
    ],
    "examples": [
    ]
  },
  {
    "word": "alik",
    "roots": ["al-"],
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "each" 
      },
      { 
        "lang": "english", 
        "text": "every" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "almulik",
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "monthly" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "alna",
    "roots": ["al-"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "each time" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "alo",
    "roots": ["al-"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "at any rate" 
      },
      { 
        "lang": "english", 
        "text": "at any event" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "alseimik",
    "roots": ["al-", "seim"],
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "any" 
      },
      { 
        "lang": "english", 
        "text": "whatever" 
      },
      { 
        "lang": "english", 
        "text": "whichever" 
      }
    ],
    "examples": [
    ]
  },
  {
    "word": "alyelik",
    "roots": ["al-", "yel"],
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "annual" 
      },
      { 
        "lang": "english", 
        "text": "yearly" 
      }
    ],
  },
  {
    "word": "aneito",
    "roots": ["neit"],
    "lang": "volapuk",
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "tonight" 
      }
    ],
  },
  {
    "word": "anik",
    "lang": "volapuk",
    "category": "adjective",
    "translations": [
      { 
        "lang": "english", 
        "text": "several" 
      },
      { 
        "lang": "english", 
        "text": "some" 
      }
    ],
  },
  {
    "word": "anu",
    "lang": "volapuk",
    "roots": ["nu"],
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "at this moment" 
      },
      { 
        "lang": "english", 
        "text": "now" 
      }
    ],
  },
  {
    "word": "aposzedelo",
    "lang": "volapuk",
    "roots": ["pos", "ze", "del"],
    "category": "adverb",
    "translations": [
      { 
        "lang": "english", 
        "text": "this afternoon" 
      }
    ],
  },
]

# Create words, translations, and examples
words_data.each do |word_data|
  create_word_with_nested_attributes(word_data)
end

puts "Sidnunäds sekaliegiko pälüükons! = Seed data successfully added!"
