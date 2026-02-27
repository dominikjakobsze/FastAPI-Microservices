// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table users {
  id integer [primary key]
  username text
  email text
  otp_code text [note: 'hashed string']
  otp_expires_at datetime
  Note: 'Auth-Microservice'
}

Table reminders {
  id integer [primary key]
  title text
  content text
  when date
  category_id integer
  user_id integer
  Note: 'Reminders-Microservice'
}

Table categories {
  id integer [primary key]
  category_name text
  user_id integer
  Note: 'Reminders-Microservice'
}

Ref: users.id < reminders.user_id
Ref: users.id < categories.user_id
Ref: categories.id < reminders.category_id


