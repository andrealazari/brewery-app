require 'pg'

def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'brewery_app'})
    data = db.exec(sql, params)
    db.close
    data
end