require '../lib/mairie_christmas.rb'


describe "get the urls of each townhall in Val d'Oise" do 
    it "should return an array of links" do
        expect(get_townhall_urls).not_to be_nil
        expect(get_townhall_urls.any?{"http://annuaire-des-mairies.com/95/goussainville.html"}).to be true
    end
end

describe "get townhall names  of all cities in Vald'Oise" do
    it "should return an array of the names of the cities in Val d'oise" do
        expect(get_townhall_names).not_to be_nil
        expect(get_townhall_names.any?{"Pontoise" "Chaussy"}).to be true
        expect(get_townhall_names.size).to be > 100
    end
end

describe "get the name and email for each townhall" do
    it "should return an array of emails" do
        expect(perform).not_to be_nil
        expect(perform.any?{"mairie.de.noisy.sur.oise@wanadoo.fr" "mairie.ronquerolles95@wanadoo.fr"}).to be true
        expect(perform.size).to eq(185)
    end
end





