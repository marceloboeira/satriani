class Satriani::RequestController 
  
  def call(env) 
    [200, {}, ["Hello World"]]
  end
end