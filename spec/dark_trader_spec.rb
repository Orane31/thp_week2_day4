require_relative '../lib/dark_trader.rb'

describe "Go open the webpage" do
   it "should open the web page from its url" do
    expect(acquire_page("https://coinmarketcap.com/all/views/all/")).to eq("The page is ready to be scrapped")
    expect(acquire_page("https://www.amazon.fr/Bluestork-BS-KB-MICRO-BT-SP-Bluetooth/dp/B00ARHXMEW/ref=sr_1_7?dchild=1&keywords=clavier+qwerty&qid=1594840405&refinements=p_n_feature_eight_browse-bin%3A14337020031&rnid=1703605031&s=computers&sr=1-7")).to eq("The page is ready to be scrapped")
    
    end 

end

describe "gets the name and the value of the array" do 
    it "should "

end








