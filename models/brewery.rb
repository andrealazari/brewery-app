def create_brewery(name, brewery_type, street, city, state, country, website, rate, comments, user_id)
    run_sql("INSERT INTO breweries(name, brewery_type, street, city, state, country, website, rate, comments, user_id) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [name, brewery_type, street, city, state, country, website, rate, comments, user_id])
end

def all_breweries
    run_sql('SELECT * FROM breweries ORDER BY rate DESC')
end