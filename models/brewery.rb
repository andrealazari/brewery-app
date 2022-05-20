def create_brewery(name, brewery_type, street, city, state, country, website, rate, comments, user_id)
    run_sql("INSERT INTO breweries(name, brewery_type, street, city, state, country, website, rate, comments, user_id) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [name, brewery_type, street, city, state, country, website, rate, comments, user_id])
end

def all_breweries_from_current_user(user_id)
    run_sql('SELECT * FROM breweries WHERE user_id = $1 ORDER BY rate DESC', [user_id])
end

def all_breweries_from_other_users(user_id)
    run_sql('SELECT users.name AS user_name, users.email, breweries.name, breweries.brewery_type, breweries.street, breweries.city, breweries.state, breweries.country, breweries.website, breweries.rate, breweries.comments, breweries.city, breweries.id FROM breweries INNER JOIN users ON users.id = breweries.user_id WHERE users.id != $1 ORDER BY rate DESC', [user_id])
end

def post_likes(brewery_id, user_id)
    run_sql('INSERT INTO post_likes(brewery_id, user_id) VALUES($1, $2)', [brewery_id, user_id])
end

def update_brewery(rate, comments, id)
    run_sql("UPDATE breweries SET rate = $1, comments = $2 WHERE id = $3", [rate, comments, id])
end

def get_brewery(id)
    run_sql("SELECT * FROM breweries WHERE id = $1", [id])[0]
end

def delete_brewery(id)
    run_sql("DELETE FROM breweries WHERE id = $1", [id])
end

def get_post_likes()
    run_sql('SELECT post_likes.brewery_id FROM breweries INNER JOIN post_likes ON post_likes.brewery_id = breweries.id').to_a
end

def count_likes(likes_array)
    final_counts = {}
    likes_array.each do |like|
        brew_id = like['brewery_id']
        if final_counts[brew_id]
            final_counts[brew_id] = final_counts[brew_id] + 1
        else
            final_counts[brew_id] = 1
        end
    end
    final_counts
end