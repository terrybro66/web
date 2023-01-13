require 'pg'

class DatabaseConnection
  def self.connect
    dbase = 'terrybro66.music_library'

    # DATABASE_URL="postgresql://terrybro66:v2_3xvLk_5pAJd2Vpc3jSHGuFWGV4Psf@db.bit.io/terrybro66/music_library"

    @connection = PG.connect('postgresql://terrybro66:v2_3xvLk_5pAJd2Vpc3jSHGuFWGV4Psf@db.bit.io/terrybro66/music_library')
  end

  def self.exec_params(query, _params)
    @connection.exec_params(query)
  end
end
