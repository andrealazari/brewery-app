require 'pg'

def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'breweries_app'})
    data = db.exec(sql, params)
    db.close
    data
end