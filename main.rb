require_relative './app'

def main
  app = App.new
  app.run
  app.save
end

main
