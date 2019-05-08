# NAME

Relational::Prawn - A writer for Relational to enable writing PDF reports

# SYNOPSIS

    relational do
      people = from('path/to/people.csv', schema: {created_at: :datetime, name: :string}).where(->(row) { person.created_at > Date.today - 1 })
      users = from('path/to/usernames.json').select(:id, :name)
      people.join(users).select(:id, :name, :created_at).rename(:id, :user_id).to('path/to/report.pdf')
    end
    
or

    Relational.from('path/to/people.csv')
              .join(Relational.from('path/to/usernames.json'))
              .select(:id, :name, :created_at)
              .rename(:id, :user_id)
              .to('path/to/report.pdf')
# AUTHOR

Delon Newman <contact@delonnewman.name>
