require 'rspec'
require 'movie_sql'

describe "#zoolander_cast" do
  it "1. List Zoolander cast by name" do
    expect(zoolander_cast).to eq([
      {"name"=>"Alexander Skarsgård"},
      {"name"=>"Andy Dick"},
      {"name"=>"Anne Meara"},
      {"name"=>"Ben Stiller"},
      {"name"=>"Christine Taylor"},
      {"name"=>"David Duchovny"},
      {"name"=>"James Marsden"},
      {"name"=>"Jennifer Coolidge"},
      {"name"=>"Jerry Stiller"},
      {"name"=>"John Vargas"},
      {"name"=>"Jon Voight"},
      {"name"=>"Justin Theroux"},
      {"name"=>"Matt Levin"},
      {"name"=>"Milla Jovovich"},
      {"name"=>"Nora Dunn"},
      {"name"=>"Owen Wilson"},
      {"name"=>"Patton Oswalt"},
      {"name"=>"Tony Kanal"},
      {"name"=>"Will Ferrell"},
      {"name"=>"Woodrow Asai"}
    ])
  end
end

describe "#matt_damon_films" do
  it "2. List Matt Damon films by movie title" do
    expect(matt_damon_films).to eq([
      {"title"=>"All the Pretty Horses"},
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Good Will Hunting"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Rounders"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"Spirit: Stallion of the Cimarron"},
      {"title"=>"Stuck on You"},
      {"title"=>"The Adjustment Bureau"},
      {"title"=>"The Bourne Identity"},
      {"title"=>"The Bourne Ultimatum"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Good Shepherd"},
      {"title"=>"The Informant!"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"The Rainmaker"},
      {"title"=>"The Talented Mr. Ripley"},
      {"title"=>"True Grit"},
      {"title"=>"We Bought a Zoo"}
    ])
  end
end

describe "#matt_damon_supporting_actor_films" do
  it "3. List Matt Damon supporting actor films by title" do
    expect(matt_damon_supporting_actor_films).to eq([
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"True Grit"}
    ])
  end
end

describe "#leading_star_for_1962_films" do
  it "4. List 1962 leading stars by movie title" do
    expect(leading_star_for_1962_films).to eq([
      { "title" => "A Kind of Loving", "name" => "Alan Bates" },
      { "title" => "Barabbas", "name" => "Anthony Quinn" },
      { "title" => "Big and Little Wong Tin Bar", "name" => "Jackie Chan" },
      { "title" => "Billy Rose's Jumbo", "name" => "Doris Day" },
      { "title" => "Boys' Night Out", "name" => "Kim Novak" },
      { "title" => "Cape Fear", "name" => "Gregory Peck" },
      { "title" => "Carry On Cruising", "name" => "Sid James" },
      { "title" => "Days of Wine and Roses", "name" => "Jack Lemmon" },
      { "title" => "Gay Purr-ee", "name" => "Judy Garland" },
      { "title" => "Gypsy", "name" => "Rosalind Russell" },
      { "title" => "In Search of the Castaways", "name" => "Hayley Mills" },
      { "title" => "Jigsaw", "name" => "Jack Warner" },
      { "title" => "L'Eclisse", "name" => "Alain Delon" },
      { "title" => "La notte", "name" => "Marcello Mastroianni" },
      { "title" => "Life for Ruth", "name" => "Michael Craig" },
      { "title" => "Lolita", "name" => "James Mason" },
      { "title" => "Long Day's Journey into Night", "name" => "Katharine Hepburn" },
      { "title" => "Love at Twenty", "name" => "Jean-Pierre Léaud" },
      { "title" => "Lycanthropus", "name" => "Barbara Lass" },
      { "title" => "Mother Joan of the Angels", "name" => "Lucyna Winnicka" },
      { "title" => "Mutiny on the Bounty", "name" => "Marlon Brando" },
      { "title" => "Panic in Year Zero!", "name" => "Ray Milland" },
      { "title" => "Period of Adjustment", "name" => "Anthony Franciosa" },
      { "title" => "Pressure Point", "name" => "Bobby Darin" },
      { "title" => "Ride the High Country", "name" => "Randolph Scott" },
      { "title" => "State Fair", "name" => "Pat Boone" },
      { "title" => "Sundays and Cybele", "name" => "Hardy Krüger" },
      { "title" => "Term of Trial", "name" => "Laurence Olivier" },
      { "title" => "That Touch of Mink", "name" => "Cary Grant" },
      { "title" => "The 300 Spartans", "name" => "King Leonidas" },
      { "title" => "The Apartment", "name" => "Jack Lemmon" },
      { "title" => "The Counterfeit Traitor", "name" => "William Holden" },
      { "title" => "The Manchurian Candidate", "name" => "Frank Sinatra" },
      { "title" => "The Music Man", "name" => "Robert Preston" },
      { "title" => "The Phantom of the Opera", "name" => "Herbert Lom" },
      { "title" => "The Trial", "name" => "Anthony Perkins" },
      { "title" => "Through a Glass Darkly", "name" => "Harriet Andersson" },
      { "title" => "To Kill a Mockingbird", "name" => "Mary Badham" },
      { "title"=>"Village of Daughters", "name"=>"Yvonne Romain"},
      { "title" => "What Ever Happened to Baby Jane?", "name" => "Joan Crawford" },
      { "title" => "Who's Got the Action?", "name" => "Dean Martin" }
    ])
  end
end

describe "#unknown_actors_2012" do
  it "5. Give the 2012 movie without casting info" do
    expect(unknown_actors_2012).to eq([
      {"id"=>20377, "title"=>"Titanic"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List movies having > 60 roles" do
    expect(big_movies).to eq([
      {"title"=>"A Hundred and One Nights", "roles"=>70},
      {"title"=>"Perfect", "roles"=>78},
      {"title"=>"S.W.A.T.", "roles"=>68}
    ])
  end
end

describe "#stars_working_with_ben_affleck" do
  it "7. List movies and stars supported by Ben Affleck, by movie title" do
    expect(stars_working_with_ben_affleck).to eq([
      {"title"=>"Armageddon", "name"=>"Bruce Willis"},
      {"title"=>"Boiler Room", "name"=>"Giovanni Ribisi"},
      {"title"=>"Buffy the Vampire Slayer", "name"=>"Kristy Swanson"},
      {"title"=>"Dazed and Confused", "name"=>"Jason London"},
      {"title"=>"Glory Road", "name"=>"Josh Lucas"},
      {"title"=>"Good Will Hunting", "name"=>"Matt Damon"},
      {"title"=>"Hollywoodland", "name"=>"Adrien Brody"}
    ])
  end
end

describe "#barrie_ingham_multiple_roles" do
  it "8. List movies in which Barrie Ingham plays multiple roles" do
    expect(barrie_ingham_multiple_roles).to eq([
      {"title"=>"The Great Mouse Detective"}
    ])
  end
end

