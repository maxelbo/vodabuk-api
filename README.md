# Vödabuk API

This is a Ruby on Rails API designed to manage a Volapük dictionary based on the work of the late Ralph Midgley. The API is intended to be used by a web application built with React.

## Getting Started

### Installation

Clone the repository:

```
git clone https://github.com/maxelbo/vodabuk-api.git
cd volapuk-dictionary-api
```

Install dependencies:

``
bundle install

```

Set up the database:

```

rails db:create
rails db:migrate
rails db:seed

```

### Running the Server
Start the Rails server:

```

rails server

```

The API will be available at http://localhost:3000.

## API Endpoints
### Words
List Words
Endpoint:
```

GET /api/v0/volpuk/words

```

## License
This project is licensed under the MIT License.

## Acknowledgements
This project uses the Rails framework.
Based on the work of the late Ralph Midgley.

```
