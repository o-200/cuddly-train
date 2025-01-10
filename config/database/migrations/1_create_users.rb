# frozen_string_literal: true

Sequel.migration do
  up do
    next if DB.table_exists?(:users)

    create_table(:users) do
      primary_key :id
      String :name, null: false
      Integer :age, null: false
      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table(:users)
  end
end
