# Sinaxys

<table>
    <tr>
        <td>Ruby</td>
        <td>3.1.3</td>
    </tr>
    <tr>
        <td>Ruby on Rails</td>
        <td>7.0.4.3</td>
    </tr>
    <tr>
        <td>Postgresql</td>
        <td>15</td>
    </tr>
</table>

<br>

## Settings to run the project

### Without using Docker

```bash
git clone https://github.com/pauloaugusto-dmf/Sinaxys.git
cd Sinaxys
bundle install
rails db:setup
rails s
```

### Using Docker


```bash
git clone https://github.com/pauloaugusto-dmf/Sinaxys.git
cd Sinaxys
cp .env.template .env
docker-compose build
docker-compose up -d
docker-compose exec web rails db:setup
```

### Open the browser at the address `http://0.0.0.0:3000`

<br>

## Tests

### Without using Docker

```bash
rspec
```

### Using Docker

```bash
docker-compose run --rm web rspec
```

 
