def create_user(name, email, password)
    password_digest = BCrypt::Password.create(password)

    run_sql("INSERT INTO users(name, email, password_digest) VALUES($1, $2, $3) RETURNING *", [name, email, password_digest]).to_a[0]
end

def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])

    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def find_user_by_id(id)
    run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end

def find_user_by_name(name)
    users = run_sql("SELECT * FROM users WHERE name = $1", [name])

    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def all_users_emails_created()
    run_sql("SELECT email FROM users")
end