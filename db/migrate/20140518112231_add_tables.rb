class AddTables < ActiveRecord::Migration
  def change
    #
    #create_table "events", force: true do |t|
    #  t.integer "society_id"
    #  t.string   "name"
    #  t.string   "type"
    #  t.string   "description"
    #  t.string   "website"
    #  t.date     "date"
    #  t.time     "startTime"
    #  t.time     "endTime"
    #  t.binary   "banner"
    #  t.binary   "image2"
    #  t.binary   "image3"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #end

    create_table "societies", force: true do |t|
      t.string   "name"
      t.integer  "regNum"
      t.string   "website"
      t.boolean  "approved"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", force: true do |t|
      t.string   "name"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "last_name"
      t.string   "email"
      t.string   "phone"
      t.string   "mobile"
      t.string   "encrypted_password"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "salt"
    end

    #Society.create(name: 'Chess Club', regNum: '12', approved: true)
    #Society.create(name: 'Starcraft Society', regNum: '13', approved: false)
    #Society.create(name: 'Magic Society', regNum: '14', approved: true)
    #Society.create(name: 'Atheist Alliance', regNum: '15', approved: true)
    #Society.create(name: 'Socialist Alternative', regNum: '16', approved: true)
    #Society.create(name: 'Morris Dancers', regNum: '17', approved: true)
    #Society.create(name: 'Etcetera, Etcetera, Etcetera', regNum: '99', approved: false)

    #Event.create(name: 'Our Glorious Socialist Revolution')
  end
end
